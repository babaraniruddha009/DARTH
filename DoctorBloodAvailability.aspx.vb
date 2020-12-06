Imports System.Data
Imports System.Data.SqlClient
Imports QRCoder
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail
Imports System.Net
Partial Class DoctorBloodAvailability
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") Is vbNullString And Session("HospitalName") Is vbNullString Then
            Response.Redirect("~/Index.aspx")

        Else

            SqlDataSource2.SelectCommand = "SELECT * FROM BloodAvailable order by City"
            GridView1.DataSource = SqlDataSource2
        End If
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim LblUni As Label = GridView1.Rows(e.RowIndex).FindControl("ItemUnicode")
        Dim LblName As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodBank_Name")
        Dim Uni As String = "XD" + LblUni.Text + "Z57y"
        Dim Name As String = LblName.Text

        Response.Redirect("~/DoctorRequestPage.aspx?UC=" + Uni + "&Nm=" + Name + "")
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim LbRequest As LinkButton = TryCast(e.Row.FindControl("RequestBtn"), LinkButton)
            Dim lbl As Label = TryCast(e.Row.FindControl("ItemStatus"), Label)
            If lbl.Text = "Offline" Then
                LbRequest.Enabled = False
            Else
                LbRequest.Enabled = True
            End If
        End If

    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub SearchBtn_Click(sender As Object, e As EventArgs) Handles SearchBtn.Click
        Try
            Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            con.Open()
            If SearchText.Text = "" Then
                Dim search As String = SearchText.Text.Trim
                Dim da As New SqlDataAdapter("Select * from BloodAvailable", con)
                Timer1.Enabled = True
                Dim ds As New DataSet
                da.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()

            Else
                Dim search As String = SearchText.Text.Trim
                Dim da As New SqlDataAdapter("Select * from BloodAvailable where BloodBank_Name='" + search + "'", con)
                Timer1.Enabled = False
                Dim ds As New DataSet
                da.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()

            End If

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try


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
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
