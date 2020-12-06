Imports System.Data
Imports System.Data.SqlClient
Imports QRCoder
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail
Imports System.Net
Partial Class DoctorPatientHistory
    Inherits System.Web.UI.Page
    Dim S As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
            S = Session("Unicode").ToString
            SqlDataSource2.SelectCommand = "Select * from [" + S + "B] where [Status]='Canceled'"
            SqlDataSource1.SelectCommand = "Select * from [" + S + "B] where [Status]='Delivered'"

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
                Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")

                'Code to send Email.
                Dim send As String = "darthblood16@gmail.com"
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
                con.Close()
            Catch ex As Exception
                alert("alert('Invalid Data...Please try again.')")
            Finally


                TxtEmail.Text = String.Empty
                TxtContact.Text = String.Empty
                TxtMessage.Text = String.Empty
                TxtName.Text = String.Empty

            End Try
        End If
    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        GridView1.DataBind()
    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
        Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        Try
            con.Open()

            Dim cmd As New SqlCommand("Delete from [" + S + "B] where Id=@id", con)
            cmd.Parameters.AddWithValue("@id", id.Text.Trim)
            Dim n As Integer = cmd.ExecuteNonQuery
            GridView1.DataBind()

            con.Close()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub
    Protected Sub GridView2_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView2.RowDeleting
        Dim id As Label = GridView2.Rows(e.RowIndex).FindControl("ItemId")
        Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        Try
            con.Open()

            Dim cmd As New SqlCommand("Delete from [" + S + "B] where Id=@id", con)
            cmd.Parameters.AddWithValue("@id", id.Text.Trim)
            Dim n As Integer = cmd.ExecuteNonQuery
            GridView2.DataBind()
            con.Close()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub
    Protected Sub DetailBtn_Click(sender As Object, e As EventArgs) Handles DetailBtn.Click
        GridView1.Visible = False
        GridView2.Visible = True
        DetailBtn.ForeColor = Drawing.ColorTranslator.FromHtml("#3366ff")
        RequestBtn.ForeColor = Drawing.Color.Black
        GridView2.DataBind()
    End Sub
    Protected Sub RequestBtn_Click(sender As Object, e As EventArgs) Handles RequestBtn.Click

        GridView1.Visible = True
        GridView2.Visible = False
        RequestBtn.ForeColor = Drawing.ColorTranslator.FromHtml("#3366ff")
        DetailBtn.ForeColor = Drawing.Color.Black
        GridView1.DataBind()
    End Sub
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
