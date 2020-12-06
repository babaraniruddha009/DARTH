Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Partial Class BloodHistory
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim s As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            s = Session("Unicode").ToString
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            SqlDataSource2.SelectCommand = "SELECT * FROM " + s + "B order by [DateTime]"
            SqlDataSource1.SelectCommand = "SELECT * FROM " + s + "D where [Status]='Accepted' or [Status]='Declined' or [Status]='Time Out!' order by [Status]"
            SqlDataSource3.SelectCommand = "SELECT * FROM " + s + "D where [Status]='Delivered'"
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

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting

        Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
        Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
        Dim updatedata As String = "Delete from " + s + "B where ID = " + id.Text
        Dim con As New SqlConnection(mycon)
        con.Open()
        Dim cmd As New SqlCommand(updatedata, con)
        cmd.ExecuteNonQuery()
        GridView1.EditIndex = -1
        GridView1.DataBind()
        con.Close()
    End Sub

    Protected Sub GridView2_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView2.RowDeleting
        Dim id As Label = GridView2.Rows(e.RowIndex).FindControl("ItemId")
        Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
        Dim updatedata As String = "Delete from " + s + "D where Id= " + id.Text
        Dim con As New SqlConnection(mycon)
        con.Open()
        Dim cmd As New SqlCommand(updatedata, con)
        cmd.ExecuteNonQuery()
        GridView2.EditIndex = -1
        SqlDataSource1.DataBind()
        GridView2.DataSource = SqlDataSource1
        GridView2.DataBind()
        con.Close()
    End Sub

    Protected Sub GridView3_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView3.RowDeleting
        Dim id As Label = GridView3.Rows(e.RowIndex).FindControl("ItemId")
        Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
        Dim updatedata As String = "Delete from " + s + "D where Id= " + id.Text
        Dim con As New SqlConnection(mycon)
        con.Open()
        Dim cmd As New SqlCommand(updatedata, con)
        cmd.ExecuteNonQuery()
        GridView3.EditIndex = -1
        SqlDataSource3.DataBind()
        GridView3.DataSource = SqlDataSource3
        GridView3.DataBind()
        con.Close()
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

    Protected Sub BtnDetail_Click(sender As Object, e As EventArgs) Handles BtnDetail.Click

        GridView2.Visible = False
        GridView3.Visible = False
        GridView1.Visible = True

        BtnDetail.ForeColor = Drawing.ColorTranslator.FromHtml("#3366ff")
        RequestBtn.ForeColor = Drawing.Color.Black
        DeliverBtn.ForeColor = Drawing.Color.Black
    End Sub

    Protected Sub RequestBtn_Click(sender As Object, e As EventArgs) Handles RequestBtn.Click
        GridView1.Visible = False
        GridView3.Visible = False
        GridView2.Visible = True
        RequestBtn.ForeColor = Drawing.ColorTranslator.FromHtml("#3366ff")
        BtnDetail.ForeColor = Drawing.Color.Black
        DeliverBtn.ForeColor = Drawing.Color.Black
    End Sub

    Protected Sub DeliverBtn_Click(sender As Object, e As EventArgs) Handles DeliverBtn.Click
        GridView2.Visible = False
        GridView1.Visible = False
        GridView3.Visible = True

        DeliverBtn.ForeColor = Drawing.ColorTranslator.FromHtml("#3366ff")
        BtnDetail.ForeColor = Drawing.Color.Black
        RequestBtn.ForeColor = Drawing.Color.Black
    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
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




