Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class BloodPieChart
    Inherits System.Web.UI.Page
    Private con As SqlConnection
    Dim dt As DataTable = New DataTable()
    Dim s As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            s = Session("Unicode").ToString
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            con.Open()
            Dim cmd As New SqlCommand("select BloodName,Quantity from " + s + "A order by Quantity desc", con)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            cmd.Dispose()

            Dim cmd2 As New SqlCommand("Select BloodBank_Name from BloodBank where Unicode = '" + s + "' ", con)
            Dim rdr As SqlDataReader = cmd2.ExecuteReader
            rdr.Read()
            Dim ChartTitle As String = rdr(0)
            rdr.Close()
            cmd2.Dispose()
            countrychart.ChartTitle = ChartTitle + " Blood Availability"
            For Each dr As DataRow In dt.Rows
                countrychart.PieChartValues.Add(New AjaxControlToolkit.PieChartValue() With {
                    .Category = dr("BloodName").ToString(),
                    .Data = Convert.ToDecimal(dr("Quantity"))
                })
            Next
            con.Close()
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
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        con.Open()
        Dim selectCommand As New SqlCommand("SELECT count(*) from [" + s + "C]", con)
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
