Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class DoctorHome
    Inherits System.Web.UI.Page
    Private con As SqlConnection
    Dim s As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
            s = Session("Unicode").ToString
            HospitalNameLbl.text = Session("HospitalName").ToString
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
    Public Shared Function CheckEmail(ByVal email As String) As Boolean
        Dim MatchEmailPattern As String = "\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        If email IsNot Nothing Then
            Return Regex.IsMatch(email, MatchEmailPattern)
        Else
            Return False
        End If
    End Function
    Protected Sub SendBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SendBtn.Click
        Try
            Dim nm As String = name.Text
            Dim ema As String = email.Text
            Dim subj As String = subject.Text
            Dim message As String = mess.Text.ToString
            If subj <> String.Empty And nm <> String.Empty And message <> String.Empty Or CheckEmail(ema) Then
                If message.Length < 300 Then
                    con.Open()
                    Dim cmd2 As New SqlCommand("Select Hospital_Name,City,State,Address from Hospital where [Unicode]=@uni", con)
                    cmd2.Parameters.AddWithValue("@uni", s)
                    Dim rdr As SqlDataReader = cmd2.ExecuteReader
                    rdr.Read()
                    Dim HospitalName As String = rdr(0)
                    Dim City As String = rdr(1)
                    Dim State As String = rdr(2)
                    Dim Address As String = rdr(3)

                    rdr.Close()
                    Dim sql As String = "insert into HospitalReport(HospitalName,City,State,Address,Name,Email,Subject,Message,DateTime) values(@HospitalName,@City,@State,@Address,@Name,@Email,@Subject,@Message,@DateTime)"
                    Dim cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@HospitalName", HospitalName)
                    cmd.Parameters.AddWithValue("@City", City)
                    cmd.Parameters.AddWithValue("@State", State)
                    cmd.Parameters.AddWithValue("@Address", Address)
                    cmd.Parameters.AddWithValue("@Name", nm)
                    cmd.Parameters.AddWithValue("@Email", ema)
                    cmd.Parameters.AddWithValue("@Subject", subj)
                    cmd.Parameters.AddWithValue("Message", message)
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"))
                    Dim n As Integer = cmd.ExecuteNonQuery

                    If n = 1 Then
                        alert("alert('Your report send successfully...')")
                        name.Text = ""
                        email.Text = ""
                        subject.Text = ""
                        mess.Text = ""

                    Else
                        alert("alert('Sorry! Problem in sending a report')")
                    End If
                    con.Close()
                Else
                    alert("alert('Write your message only up to 300 letters.')")
                End If

            Else
                alert("alert('Fields are empty.')")
            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
End Class
