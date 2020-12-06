
Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Partial Class BloodMaps
    Inherits System.Web.UI.Page


    Private sb As New System.Text.StringBuilder()
        Private count As Integer = 0
        Private con As SqlConnection
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
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
        Dim SearchString As String = s.Substring(0, 1).ToUpper
        s.Replace(s.ElementAt(0), SearchString)
        ListName.Items.Clear()
            ListLat.Items.Clear()
            ListLong.Items.Clear()
            ListDesc.Items.Clear()
        Try
            Dim cmd As New SqlCommand
            con.Open()
            If s.ToUpper.Equals("O+") Or s.ToUpper.Equals("O-") Or s.ToUpper.Equals("A+") Or s.ToUpper.Equals("A-") Or s.ToUpper.Equals("AB+") Or s.ToUpper.Equals("AB-") Or s.ToUpper.Equals("B+") Or s.ToUpper.Equals("B-") Or s.ToUpper.Equals("BOMBAY+") Or s.ToUpper.Equals("BOMBAY-") Then
                cmd = New SqlCommand("Select BloodBank_Name,City,Latitude,Longitude,Address from BloodBank where [" + s + "]=1", con)
            Else
                cmd = New SqlCommand("Select * from Locations where City='" + s + "' or Name='" + s + "'", con)
            End If

            Dim rd As SqlDataReader
            Dim i As Integer = 0
            rd = cmd.ExecuteReader
            While (rd.Read)
                ListName.Items.Add(rd(0))
                ListLat.Items.Add(rd(2))
                ListLong.Items.Add(rd(3))
                ListDesc.Items.Add(rd(4))
            End While
            rd.Close()
        Catch ex As Exception
            alert("alert('Data Not Found...')")
        Finally
            con.Close()
            End Try
        End Sub
        Public Sub alert(ByVal s As String)
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
        End Sub

End Class