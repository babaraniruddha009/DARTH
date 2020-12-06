Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Partial Class ForgetPassword
    Inherits System.Web.UI.Page
    Public Shared Unicode As String = String.Empty
    Public Shared otp As String = String.Empty
    Public Shared Seconds As Double
    Dim query As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        query = Request.QueryString("value").ToString
        If Not IsPostBack Then

            Timer1.Enabled = False
        End If
        'Email.Text = Request.QueryString("value").ToString
    End Sub
    Protected Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click
        Try

            If Request.QueryString("value").Equals("BloodBank") Then


                Dim ema As String = Email.Text.Trim
                Dim sql As String = "select Unicode from BloodBank where Email=@email"
                Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                con.Open()
                Dim cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@email", ema)
                Dim rd As SqlDataReader = cmd.ExecuteReader
                If rd.Read Then
                    Unicode = rd.GetString(0)
                    Dim numbers As String = "1234567890"
                    Dim characters As String = numbers
                    otp = String.Empty

                    Dim length As Integer = 5

                    For i As Integer = 0 To length - 1
                        Dim character As String = String.Empty
                        Do
                            Dim index As Integer = New Random().Next(0, characters.Length)
                            character = characters.ToCharArray()(index).ToString()
                        Loop While otp.IndexOf(character) <> -1
                        otp += character
                    Next
                    'code for sending OTP
                    Dim emailto As String = ema
                    Dim subject As String = "Sending an otp for confirmation"
                    Dim email_body As String = "Hi ! This is DARTH you have requested for an OTP. Your requested OTP is " + otp + " ."
                    Dim email_from As String = "aniruddha.babar273@gmail.com"
                    Dim email_password As String = "aniruddha@273"
                    Dim mm As New MailMessage(email_from, emailto, subject, email_body)
                    mm.IsBodyHtml = True

                    Dim nc As New NetworkCredential(email_from, email_password)
                    Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                    smtp.EnableSsl = True
                    smtp.UseDefaultCredentials = True
                    smtp.Credentials = nc
                    smtp.Send(mm)
                    BtnSubmit.Visible = False
                    OtpTxt.Visible = True
                    ConfPassTxt.Visible = True
                    NewPassTxt.Visible = True
                    BtnReset.Visible = True
                    OtpLabel.Visible = True

                    Label1.Visible = True
                    Label2.Visible = True
                    Timer1.Enabled = True


                Else
                    alert("alert('Enter Correct Email')")

                End If
            ElseIf (Request.QueryString("value").Equals("Hospital")) Then
                Dim ema As String = Email.Text.Trim
                Dim sql As String = "select Unicode from Hospital where Email=@email"
                Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                con.Open()
                Dim cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@email", ema)
                Dim rd As SqlDataReader = cmd.ExecuteReader
                If rd.Read Then
                    Unicode = rd.GetString(0)
                    Dim numbers As String = "1234567890"
                    Dim characters As String = numbers
                    otp = String.Empty

                    Dim length As Integer = 5

                    For i As Integer = 0 To length - 1
                        Dim character As String = String.Empty
                        Do
                            Dim index As Integer = New Random().Next(0, characters.Length)
                            character = characters.ToCharArray()(index).ToString()
                        Loop While otp.IndexOf(character) <> -1
                        otp += character
                    Next
                    'code for sending OTP
                    Dim emailto As String = ema
                    Dim subject As String = "Sending an otp for confirmation"
                    Dim email_body As String = "Hi ! This is DARTH you have requested for an OTP. Your requested OTP is " + otp + " ."
                    Dim email_from As String = "darthblood16@gmail.com"
                    Dim email_password As String = "DARTH271517"
                    Dim mm As New MailMessage(email_from, emailto, subject, email_body)
                    mm.IsBodyHtml = True

                    Dim nc As New NetworkCredential(email_from, email_password)
                    Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                    smtp.UseDefaultCredentials = True
                    smtp.EnableSsl = True

                    smtp.Credentials = nc
                    smtp.Send(mm)
                    BtnSubmit.Visible = False
                    OtpTxt.Visible = True
                    ConfPassTxt.Visible = True
                    NewPassTxt.Visible = True
                    BtnReset.Visible = True
                    OtpLabel.Visible = True

                    Label1.Visible = True
                    Label2.Visible = True
                    Timer1.Enabled = True


                Else
                    alert("alert('Enter Correct Email')")

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub BtnReset_Click(sender As Object, e As EventArgs) Handles BtnReset.Click
        Try

            If Request.QueryString("value").Equals("BloodBank") Then

                Dim otp1 As String = OtpTxt.Text
                If (otp.Equals(otp1)) Then
                    Dim np As String = NewPassTxt.Text
                    Dim cnp As String = ConfPassTxt.Text
                    If np.Equals(cnp) Then


                        Dim sql As String = "Update BloodBank set Password=@np where Unicode=@unicode"
                        Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                        con.Open()
                        Dim cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@unicode", Unicode)
                        cmd.Parameters.AddWithValue("@np", np)
                        Dim n As Integer = cmd.ExecuteNonQuery
                        If n > 0 Then
                            alert("alert('Password Changed Successfully..')")
                            Email.Text = String.Empty
                            BtnSubmit.Visible = True
                            OtpTxt.Visible = False
                            ConfPassTxt.Visible = False
                            NewPassTxt.Visible = False
                            BtnReset.Visible = False
                            OtpTxt.Text = String.Empty
                            ConfPassTxt.Text = String.Empty
                            NewPassTxt.Text = String.Empty
                            OtpLabel.Visible = False
                            Label1.Visible = False
                            Label2.Visible = False

                            Timer1.Enabled = False

                        Else
                            alert("alert('Problem in changing password. Please Try Again')")

                        End If
                    Else
                        alert("alert('Password and confirm password must be same')")
                    End If
                Else
                    alert("alert('Enter Correct OTP')")

                End If
            ElseIf Request.QueryString("value").Equals("Hospital") Then
                Dim otp1 As String = OtpTxt.Text
                If (otp.Equals(otp1)) Then
                    Dim np As String = NewPassTxt.Text
                    Dim cnp As String = ConfPassTxt.Text
                    If np.Equals(cnp) Then
                        Dim sql As String = "Update Hospital set Password=@np where Unicode=@unicode"
                        Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                        con.Open()
                        Dim cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@unicode", Unicode)
                        cmd.Parameters.AddWithValue("@np", np)
                        Dim n As Integer = cmd.ExecuteNonQuery
                        If n > 0 Then
                            alert("alert('Password Changed Successfully..')")
                            Email.Text = String.Empty
                            BtnSubmit.Visible = True
                            OtpTxt.Visible = False
                            ConfPassTxt.Visible = False
                            NewPassTxt.Visible = False
                            BtnReset.Visible = False
                            OtpTxt.Text = String.Empty
                            ConfPassTxt.Text = String.Empty
                            NewPassTxt.Text = String.Empty
                            OtpLabel.Visible = False
                            Label1.Visible = False
                            Label2.Visible = False

                            Timer1.Enabled = False

                        Else
                            alert("alert('Problem in changing password. Please Try Again')")

                        End If
                    Else
                        alert("alert('Password and confirm password must be same')")
                    End If
                Else
                    alert("alert('Enter Correct OTP')")

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try



    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub LoginLinkBtn_Click(sender As Object, e As EventArgs) Handles LoginLinkBtn.Click

        Response.Redirect("Login.aspx?value=" + query)
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Seconds = Label2.Text
        If Seconds = 0 Then
            Timer1.Enabled = False
            otp = String.Empty
        Else
            Seconds = Seconds - 0.5
        End If
        Label2.Text = Seconds
    End Sub
End Class

