Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       

    End Sub

    Protected Sub Confirmbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Confirmbtn.Click
        If (otpetxt.text <> "") Then


            Dim unicode As String = Session("Unicode")
            Dim username As String = Session("Username")
            Dim OTP As Integer = CInt(Session("OTP"))
            Dim Email As String = Session("Email")
            Dim Contac As Double = Session("Contact")
            Dim Landline As String = Session("Landline")
            Dim Password As String = Session("Password")
            Dim t1 As Integer = Session("time")
            Dim t2 As Integer = Date.Now.Minute
            Dim occ As String = Session("Occu")
            Dim diff As Integer = t2 - t1
            Dim o As Integer = CInt(otpetxt.text.trim)
          
            Try
                If (0 >= diff Or diff <= 2) Then
                    If (o = OTP) Then



                        If (occ.Equals("BloodBank")) Then
                            Dim sql As String = "update BloodBank set Username=@username,Email=@email,Contact_No=@contact,Landline_No=@landline,Password=@password,Reg_or_Not=1 where Unicode=@unicode"
                            Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=Project_db;Integrated Security=True;Pooling=False")
                            con.Open()
                            Dim cmd As New SqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@unicode", unicode)
                            cmd.Parameters.AddWithValue("@username", username)
                            cmd.Parameters.AddWithValue("@email", Email)
                            cmd.Parameters.AddWithValue("@contact", Contac)
                            cmd.Parameters.AddWithValue("@landline", Landline)
                            cmd.Parameters.AddWithValue("@password", Password)
                            cmd.ExecuteNonQuery()
                            cmd.Dispose()
                            con.Dispose()
                            con.Close()

                            Session.RemoveAll()
                            Session.Abandon()
                            Response.Redirect("~/Index.aspx")

                        Else
                            Dim sql As String = "update Doctor set Username=@username,Email=@email,Contact=@contact,Landline=@landline,Password=@password,reg_or_not=1 where Unicode=@unicode"
                            Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=Project_db;Integrated Security=True;Pooling=False")
                            con.Open()
                            Dim cmd As New SqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@username", username)
                            cmd.Parameters.AddWithValue("@email", Email)
                            cmd.Parameters.AddWithValue("@contact", Contac)
                            cmd.Parameters.AddWithValue("@landline", Landline)
                            cmd.Parameters.AddWithValue("@password", Password)
                            cmd.ExecuteNonQuery()
                            cmd.Dispose()
                            con.Dispose()
                            con.Close()
                            Session.RemoveAll()
                            Session.Abandon()
                            Response.Redirect("~/Index.aspx")

                        End If
                    Else
                        msgbox("Please enter Correct OTP")
                    End If


                Else
                    msgbox("Time out...")
                End If
            Catch ex As Exception
                msgbox(ex.message)
            End Try
        Else
            msgbox("Please enter the otp...")

        End If
    End Sub

   
    Protected Sub resendbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles resendbtn.Click
        Session.Remove("OTP")
        Session.Remove("time")
        Dim numbers As String = "1234567890"
        Dim characters As String = numbers
        Dim otp As String = String.Empty
        Dim length As Integer = 5

        For i As Integer = 0 To length - 1
            Dim character As String = String.Empty
            Do
                Dim index As Integer = New Random().Next(0, characters.Length)
                character = characters.ToCharArray()(index).ToString()
            Loop While otp.IndexOf(character) <> -1
            otp += character
        Next
        Session.Add("OTP", otp)
        'code for sending OTP
        Dim emailto As String = Session("Email")
        Dim subject As String = "sending an otp for confirmation"
        Dim email_body As String = "Your otp is" + otp
        Dim email_from As String = "harsharathi27@gmail.com"
        Dim email_password As String = "27082000GMAIL"
        Dim mm As New MailMessage(email_from, emailto, subject, email_body)
        mm.IsBodyHtml = True

        Dim nc As New NetworkCredential(email_from, email_password)
        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.UseDefaultCredentials = True
        smtp.EnableSsl = True
        smtp.Credentials = nc
        smtp.Send(mm)
        Session.Add("time", Date.Now.Minute)
    End Sub
End Class
