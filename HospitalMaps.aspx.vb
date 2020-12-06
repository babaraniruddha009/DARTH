Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Partial Class HospitalMaps
    Inherits System.Web.UI.Page

    Private sb As New System.Text.StringBuilder()
    Private count As Integer = 0
    Private con As SqlConnection
    Dim S As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            S = Session("Unicode").ToString
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        Else
            Response.Redirect("~/Index.aspx")
        End If
    End Sub
    Protected Sub SubmitBtn_Click(sender As Object, e As EventArgs) Handles SubmitBtn.Click

        If TxtName.Text = String.Empty Or TxtEmail.Text = String.Empty Or TxtContact.Text = String.Empty Then
            alert("alert('Fields are empty.')")
        Else

            Try
                Dim Name As String = TxtName.Text.Trim
                Dim Email As String = TxtEmail.Text.Trim
                Dim contactNo As String = TxtContact.Text.Trim
                Dim message As String = TxtMessage.Text.Trim

                'Code to send Email.
                Dim send As String = "aniruddha.babar273@gmail.com"
                Dim password As String = "aniruddha@273"
                Dim subject As String = "DARTH Blood."
                Dim emailMessage As String = "Hi! This is DARTH.( Contact Number : 8329997206 ). You can contact with us in time between 10am to 8pm. Thank you."
                Dim mm As New MailMessage(send, Email, subject, emailMessage)
                mm.IsBodyHtml = False
                Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = True
                Dim netcred As New NetworkCredential(send, password)
                smtp.Credentials = netcred
                smtp.Send(mm)
                'Code to save the data inserted by user into contactVisiters Database.
                con.Open()
                Dim cmd As New SqlCommand("insert into contactVisiters(Name,Email,ContactNo,Message,DateTime) values(@Name,@Email,@ContactNo,@Message,@DateTime)", con)
                cmd.Parameters.AddWithValue("@Name", Name)
                cmd.Parameters.AddWithValue("@Email", Email)
                cmd.Parameters.AddWithValue("@ContactNo", contactNo)
                cmd.Parameters.AddWithValue("@Message", message)
                cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"))

                Dim n As Integer = cmd.ExecuteNonQuery
                If n = 1 Then
                    alert("alert('Contact number is send on your Email.')")
                End If
                cmd.Dispose()
            Catch ex As Exception
                alert("alert('Invalid Data...Please try again.')")
            Finally
                con.Dispose()
                con.Close()
                TxtEmail.Text = String.Empty
                TxtContact.Text = String.Empty
                TxtMessage.Text = String.Empty
                TxtName.Text = String.Empty

            End Try
        End If
    End Sub
    Protected Sub SearchBtn_Click(sender As Object, e As EventArgs) Handles SearchBtn.Click
        Dim s As String = SearchText.Text.Trim
        ListName.Items.Clear()
        ListLat.Items.Clear()
        ListLong.Items.Clear()
        ListDesc.Items.Clear()
        Try
            con.Open()
            Dim cmd As New SqlCommand("Select * from Hospital where City='" + s + "' or Hospital_Name='" + s + "'", con)
            Dim rd As SqlDataReader
            Dim i As Integer = 0
            rd = cmd.ExecuteReader
            While (rd.Read())
                ListName.Items.Add(rd(1))
                ListLat.Items.Add(rd(7))
                ListLong.Items.Add(rd(8))
                ListDesc.Items.Add(rd(3))
            End While
            rd.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
            'alert("alert('Data Not Found...')")
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        con.Open()
        Dim selectCommand As New SqlCommand("SELECT count(*) from [" + S + "C]", con)
        Dim count As Integer = selectCommand.ExecuteScalar
        If count = 0 Then
            BadgeLbl.Text = ""
            BadgeLbl.DataBind()
        Else
            BadgeLbl.Text = count
            BadgeLbl.DataBind()
        End If
        con.Close()
    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        con.Open()
        Dim UpdateCmd As New SqlCommand("Update BloodAvailable set Status='Offline' where Unicode=@Unic", con)
        UpdateCmd.Parameters.AddWithValue("@Unic", Session("Unicode").ToString)
        UpdateCmd.ExecuteNonQuery()

        con.Close()
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
