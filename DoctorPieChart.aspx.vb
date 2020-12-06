Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class DoctorPieChart
    Inherits System.Web.UI.Page
    Private con As SqlConnection
    Dim dt As DataTable = New DataTable()
    Dim s As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
            s = Session("Unicode").ToString
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
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub SearchBtn_Click(sender As Object, e As EventArgs) Handles SearchBtn.Click

        If TxtSearch.Text <> String.Empty Then
            Try
                con.Open()

                Dim BloodBankName As String = TxtSearch.Text.Trim
                Dim cmd2 As New SqlCommand("Select [Unicode] from BloodBank where [BloodBank_Name]=@BName", con)
                cmd2.Parameters.AddWithValue("@BName", BloodBankName)
                Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
                rdr2.Read()
                Dim Uni As String = rdr2(0)
                rdr2.Close()
                cmd2.Dispose()
                Dim cmd As New SqlCommand("select BloodName,Quantity from " + Uni + "A order by Quantity desc", con)
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                cmd.Dispose()
                Dim ChartTitle As String = BloodBankName
                countrychart.ChartTitle = ChartTitle + " Blood Availability"
                For Each dr As DataRow In dt.Rows
                    countrychart.PieChartValues.Add(New AjaxControlToolkit.PieChartValue() With {
                        .Category = dr("BloodName").ToString(),
                        .Data = Convert.ToDecimal(dr("Quantity"))
                    })
                Next

            Catch ex As Exception
                alert("alert('No Data Found.')")
            Finally
                con.Close()
            End Try
        Else
            alert("alert('Please Enter Blood Bank Name.')")
        End If

    End Sub
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
