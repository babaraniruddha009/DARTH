
Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page
    Dim s As String
    Public Sub alert(ByVal a As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", a, True)
    End Sub
    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        Dim userName As String = UserTxt.Text.Trim
        Dim pa As String = PasswordTxt.Text
        If (userName.Equals("") And pa.Equals("")) Then
            alert("alert('please enter UserName and Password')")
        Else
            Try

                If (Request.QueryString("value").Equals("BloodBank")) Then
                    Dim sql As String = "Select Username,Unicode,PassWord,Email,BloodBank_Name from BloodBank where Username=@Username"
                    Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                    con.Open()
                    Dim cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@Username", userName)
                    Dim rd As SqlDataReader = cmd.ExecuteReader

                    rd.Read()
                    Dim uni As String = rd.GetString(1)
                    Dim pass As String = rd.GetString(2)
                    Dim email As String = rd.GetString(3)
                    Dim bb_name As String = rd.GetString(4)
                    rd.Close()
                    'MsgBox(pass)
                    If pass.Equals(pa) Then
                        Session.Add("Unicode", uni)
                        Session.Add("BloodBankName", bb_name)

                        Dim UpdateCmd As New SqlCommand("Update BloodAvailable set Status='Online' where Unicode=@Unic", con)
                        UpdateCmd.Parameters.AddWithValue("@Unic", uni)
                        UpdateCmd.ExecuteNonQuery()

                        Response.Redirect("~/BloodBankHome.aspx")

                    Else
                        alert("alert('Invalid Username or Password...Please try again')")
                    End If


                ElseIf (Request.QueryString("value").Equals("Hospital")) Then
                    Dim sql As String = "Select UserName,Unicode,PassWord,Email,Hospital_Name from Hospital where Username=@Username"
                    Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                    con.Open()
                    Dim cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@Username", userName)
                    Dim rd As SqlDataReader = cmd.ExecuteReader

                    rd.Read()
                    Dim pass As String = rd.GetString(2)
                    Dim uni As String = rd.GetString(1)
                    Dim email As String = rd.GetString(3)
                    Dim bb_name As String = rd.GetString(4)
                    rd.Close()

                    If pass.Equals(pa) Then
                        Session.Add("Unicode", uni)
                        Session.Add("HospitalName", bb_name)
                        Response.Redirect("~/DoctorHome.aspx")
                    Else
                        alert("alert('Invalid Username or Password...Please try again.')")
                    End If
                End If

            Catch ex As Exception
                alert("alert('Invalid Username or Password...Please try again.')")
            End Try
        End If
        'Response.Redirect("~/DoctorHome.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        s = Request.QueryString("value")
    End Sub

    Protected Sub ForgetLinkBtn_Click(sender As Object, e As EventArgs) Handles ForgetLinkBtn.Click
        Response.Redirect("ForgetPassword.aspx?value=" + s)
    End Sub
End Class
