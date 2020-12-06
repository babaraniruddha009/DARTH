Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class Index
    Inherits System.Web.UI.Page
    Private sb As New System.Text.StringBuilder()
    Private count As Integer = 0
    Private con As SqlConnection
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
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
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub

    Protected Sub UploadBtn_Click(sender As Object, e As EventArgs) Handles UploadBtn.Click
        Dim n As Integer
        If name.Text = String.Empty Or (Not FileUploader1.HasFile) Or CategoryDrop.SelectedValue = "-1" Or CategoryType.SelectedValue = "-1" Or UploadMail.Text = String.Empty Then
            alert("alert('Fields are empty.')")
        Else
            Dim ext As String = Path.GetExtension(FileUploader1.PostedFile.FileName)

            If (ext.Equals(".png") Or ext.Equals(".jpeg") Or ext.Equals(".jpg")) Then
                Try
                    Dim UploadName As String = name.Text.Trim
                    Dim UploadEmail As String = UploadMail.Text.Trim
                    Dim catDrop As String = CategoryDrop.SelectedItem.ToString
                    Dim blood_hospital_type As String = CategoryType.SelectedItem.ToString
                    Dim bytes As Byte()
                    Using br As BinaryReader = New BinaryReader(FileUploader1.PostedFile.InputStream)
                        bytes = br.ReadBytes(FileUploader1.PostedFile.ContentLength)
                    End Using

                    Dim sql As String = "INSERT INTO Docx(Name,Document,DocType,Category,Blood_Hospital_type,Email,DateTime) VALUES(@Name, @Document,@DocType,@Category,@Blood_Hospital_type,@Email,@DateTime)"
                    Using cmd As SqlCommand = New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@Name", UploadName)
                        cmd.Parameters.AddWithValue("@Document", bytes)
                        cmd.Parameters.AddWithValue("@DocType", Path.GetFileName(FileUploader1.PostedFile.FileName).ToString)
                        cmd.Parameters.AddWithValue("@Category", catDrop)
                        cmd.Parameters.AddWithValue("@Blood_Hospital_type", blood_hospital_type)
                        cmd.Parameters.AddWithValue("@Email", UploadEmail)
                        cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"))
                        con.Open()
                        n = cmd.ExecuteNonQuery()
                        If n = 1 Then
                            alert("alert('Details uploaded successfully.')")
                        End If
                    End Using
                Catch ex As Exception
                    alert("alert('Invalid Data...')")
                    'alert("alert('File not found...Please try again.')")
                Finally
                    con.Close()
                    name.Text = String.Empty
                    CategoryDrop.SelectedValue = -1
                    CategoryType.SelectedValue = -1
                    UploadMail.Text = String.Empty
                End Try
            Else
                alert("alert('Please upload only png or jpeg file.')")
                name.Text = String.Empty
                CategoryDrop.SelectedValue = -1
                CategoryType.SelectedValue = -1
                UploadMail.Text = String.Empty
            End If
        End If
    End Sub
    Public Sub HospitalLinkBtn_Click(sender As Object, e As EventArgs) Handles HospitalLinkBtn.Click
        Response.Redirect("Login.aspx?value=Hospital")
    End Sub
    Public Sub BloodBankLinkBtn_Click(sender As Object, e As EventArgs) Handles BloodBankLinkBtn.click
        Response.Redirect("Login.aspx?value=BloodBank")
    End Sub
End Class