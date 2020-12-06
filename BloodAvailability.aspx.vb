Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Configuration
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Partial Class BloodAvailabilityaspx
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim s As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            s = Session("Unicode").ToString
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            SqlDataSource2.SelectCommand = "SELECT * FROM " + s + " order by [DateTime]"
            Dim n As Integer = GridView1.Rows.Count
            If Not Page.IsPostBack Then
                GridView1.DataSource = SqlDataSource2
                GridView1.DataBind()

            End If
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

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing

        GridView1.EditIndex = e.NewEditIndex
        GridView1.DataSource = SqlDataSource2
        GridView1.DataBind()

    End Sub
    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        GridView1.DataSource = SqlDataSource2
        GridView1.DataBind()

    End Sub
    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Try
            Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
            Dim con As New SqlConnection(mycon)
            con.Open()

            Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("EditId")
            Dim SelectCmd As New SqlCommand("Select BloodName from " + s + " where ID=@id", con)
            SelectCmd.Parameters.AddWithValue("@id", id.Text)
            Dim SelectResult As SqlDataReader = SelectCmd.ExecuteReader()
            SelectResult.Read()
            Dim OldBloodName As String = SelectResult(0)
            SelectResult.Close()
            SelectCmd.Dispose()

            Dim BloodName As DropDownList = GridView1.Rows(e.RowIndex).FindControl("BloodNameDropDown")
            Dim BloodType As DropDownList = GridView1.Rows(e.RowIndex).FindControl("BloodTypeDropDown")
            Dim BloodInMl As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditBloodInMltxt")
            Dim BloodCollection As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditDateofCollectiontxt")
            Dim BloodExpiry As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditDateofExpirytxt")
            Dim Desc As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditDescriptiontxt")
            If OldBloodName = BloodName.SelectedItem.ToString Then

                Dim updatedata As String = "Update " + s + " set BloodName= '" + BloodName.SelectedItem.ToString + "' ,BloodType= '" + BloodType.SelectedItem.ToString + "' ,BloodInMl= " + BloodInMl.Text + " ,DateofEnrolment= '" + BloodCollection.Text + "' ,DateofExpiry= '" + BloodExpiry.Text + "' ,Description= '" + Desc.Text + "' where ID= " + id.Text
                Dim cmd As New SqlCommand(updatedata, con)
                cmd.ExecuteNonQuery()
                cmd.Dispose()

                GridView1.EditIndex = -1
                SqlDataSource2.DataBind()
                GridView1.DataSource = SqlDataSource2
                GridView1.DataBind()
                con.Close()
            ElseIf BloodName.SelectedValue = "-1" Or BloodType.SelectedValue = "-1"

            Else
                Dim count As Integer
                Dim Oldcount As Integer
                Dim cmd2 As SqlCommand = New SqlCommand("Select [Quantity] from [" + s + "A] where [BloodName] =@BloodName", con)
                cmd2.Parameters.AddWithValue("@BloodName", BloodName.SelectedItem.ToString)
                Dim rdr As SqlDataReader = cmd2.ExecuteReader
                While rdr.Read()
                    count = rdr(0)
                End While
                rdr.Close()
                cmd2.Dispose()

                Dim OldCountCommand As SqlCommand = New SqlCommand("Select [Quantity] from [" + s + "A] where [BloodName] =@BloodName", con)
                OldCountCommand.Parameters.AddWithValue("@BloodName", OldBloodName)
                Dim OldCountrdr As SqlDataReader = OldCountCommand.ExecuteReader
                While OldCountrdr.Read()
                    Oldcount = OldCountrdr(0)
                End While
                OldCountrdr.Close()
                OldCountCommand.Dispose()


                Dim cmd4 As SqlCommand = New SqlCommand("Update " + s + "A set [Quantity]=@count where [BloodName]=@BloodName", con)
                cmd4.Parameters.AddWithValue("@count", Oldcount - 1)
                cmd4.Parameters.AddWithValue("@BloodName", OldBloodName)
                cmd4.ExecuteNonQuery()
                cmd4.Dispose()

                Dim cmd3 As SqlCommand = New SqlCommand("Update " + s + "A set [Quantity]=@count where [BloodName]=@BloodName", con)

                cmd3.Parameters.AddWithValue("@count", count + 1)
                cmd3.Parameters.AddWithValue("@BloodName", BloodName.SelectedItem.ToString)
                cmd3.ExecuteNonQuery()
                cmd3.Dispose()

                Dim InsertCommand As SqlCommand = New SqlCommand("UPDATE BloodAvailable set [" + BloodName.SelectedItem.ToString + "]=@count where [Unicode]='" + s + "'", con)
                Dim InsertCommand2 As SqlCommand = New SqlCommand("UPDATE BloodAvailable set [" + OldBloodName.Trim + "]=@count where [Unicode]='" + s + "'", con)
                InsertCommand2.Parameters.AddWithValue("@count", Oldcount - 1)
                InsertCommand2.ExecuteNonQuery()
                InsertCommand.Parameters.AddWithValue("@count", count + 1)
                InsertCommand.ExecuteNonQuery()


                Dim updatedata As String = "Update " + s + " set BloodName= '" + BloodName.SelectedItem.ToString + "' ,BloodType= '" + BloodType.SelectedItem.ToString + "' ,BloodInMl= " + BloodInMl.Text + " ,DateofEnrolment= '" + BloodCollection.Text + "' ,DateofExpiry= '" + BloodExpiry.Text + "' ,Description= '" + Desc.Text + "' where ID= " + id.Text
                Dim cmd As New SqlCommand(updatedata, con)
                cmd.ExecuteNonQuery()
                cmd.Dispose()

                Dim MainCount1 As Integer
                Dim BloodBankCommand1 As SqlCommand = New SqlCommand("Select [Quantity] from [" + s + "A] where [BloodName] =@BloodName", con)
                BloodBankCommand1.Parameters.AddWithValue("@BloodName", BloodName.SelectedItem.ToString)
                Dim BloodBankrdr1 As SqlDataReader = BloodBankCommand1.ExecuteReader
                While BloodBankrdr1.Read()
                    MainCount1 = BloodBankrdr1(0)
                End While
                BloodBankrdr1.Close()
                If MainCount1 <> 0 Then
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + BloodName.SelectedItem.ToString + "]=1 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                Else
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + BloodName.SelectedItem.ToString + "]=0 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                End If

                BloodBankCommand1.Dispose()

                Dim MainCount2 As Integer
                Dim BloodBankCommand2 As SqlCommand = New SqlCommand("Select [Quantity] from [" + s + "A] where [BloodName] =@BloodName", con)
                BloodBankCommand2.Parameters.AddWithValue("@BloodName", OldBloodName)
                Dim BloodBankrdr2 As SqlDataReader = BloodBankCommand2.ExecuteReader
                While BloodBankrdr2.Read()
                    MainCount2 = BloodBankrdr2(0)
                End While
                BloodBankrdr2.Close()
                If MainCount2 <> 0 Then
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + OldBloodName + "]=1 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                Else
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + OldBloodName + "]=0 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                End If

                BloodBankCommand2.Dispose()

                GridView1.EditIndex = -1
                SqlDataSource2.DataBind()
                GridView1.DataSource = SqlDataSource2
                GridView1.DataBind()

            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            con.Close()
        End Try
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting

        Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
        Dim BloodName As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodNametxt")
        Dim BloodType As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodTypetxt")
        Dim BloodInMl As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodInMltxt")
        Dim BloodCollection As Label = GridView1.Rows(e.RowIndex).FindControl("ItemDateofCollectiontxt")
        Dim BloodExpiry As Label = GridView1.Rows(e.RowIndex).FindControl("ItemDateofExpirytxt")
        Dim Desc As Label = GridView1.Rows(e.RowIndex).FindControl("ItemDescriptiontxt")

        Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
        Dim con As New SqlConnection(mycon)
        con.Open()

        Dim HistoryBackup As String = "Insert into " + s + "B(BloodName,BloodType,BloodInMl,DateofEnrolment,DateofExpiry,Description,DateTime) values(@BloodName,@BloodType,@BloodInMl,@DateofEnrolment,@DateofExpiry,@Description,@DateTime)"
        Dim Historycmd As New SqlCommand(HistoryBackup, con)
        Historycmd.Parameters.AddWithValue("@BloodName", BloodName.Text)
        Historycmd.Parameters.AddWithValue("@BloodType", BloodType.Text)
        Historycmd.Parameters.AddWithValue("@BloodInMl", BloodInMl.Text)

        Historycmd.Parameters.AddWithValue("@DateofEnrolment", BloodCollection.Text)
        Historycmd.Parameters.AddWithValue("@DateofExpiry", BloodExpiry.Text)
        Historycmd.Parameters.AddWithValue("@Description", Desc.Text)
        Historycmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
        Historycmd.ExecuteNonQuery()
        Historycmd.Dispose()

        Dim updatedata As String = "Delete from " + s + " where ID= " + id.Text

        Dim cmd As New SqlCommand(updatedata, con)
        Dim n As Integer = cmd.ExecuteNonQuery()

        Dim count As Integer
        Dim ID2 As Integer
        If n = 1 Then
            Try
                Dim cmd2 As SqlCommand = New SqlCommand("Select ID,Quantity from " + s + "A where BloodName = @BloodName", con)
                cmd2.Parameters.AddWithValue("@BloodName", BloodName.Text)
                Dim rdr As SqlDataReader = cmd2.ExecuteReader
                While rdr.Read()
                    ID2 = rdr(0)
                    count = rdr(1)
                End While
                rdr.Close()
                cmd2.Dispose()

                Dim cmd3 As SqlCommand = New SqlCommand("Update [" + s + "A] set [Quantity]=@count where [ID]=@Id", con)

                Dim DeleteCommand As SqlCommand = New SqlCommand("UPDATE BloodAvailable set [" + BloodName.Text + "] = @count where [Unicode]='" + s + "'", con)
                DeleteCommand.Parameters.AddWithValue("@count", count - 1)
                DeleteCommand.ExecuteNonQuery()

                cmd3.Parameters.AddWithValue("@count", count - 1)
                cmd3.Parameters.AddWithValue("@Id", ID2)
                cmd3.ExecuteNonQuery()
                cmd3.Dispose()

                Dim MainCount As Integer
                Dim BloodBankCommand As SqlCommand = New SqlCommand("Select [Quantity] from [" + s + "A] where [BloodName] =@BloodName", con)
                BloodBankCommand.Parameters.AddWithValue("@BloodName", BloodName.Text)
                Dim BloodBankrdr As SqlDataReader = BloodBankCommand.ExecuteReader
                While BloodBankrdr.Read()
                    MainCount = BloodBankrdr(0)
                End While
                BloodBankrdr.Close()

                If MainCount <> 0 Then
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + BloodName.Text + "]=1 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                Else
                    Dim UpdateMainCmd As New SqlCommand("Update BloodBank set [" + BloodName.Text + "]=0 where [Unicode]=@uni", con)
                    UpdateMainCmd.Parameters.AddWithValue("@uni", s)
                    UpdateMainCmd.ExecuteNonQuery()
                    UpdateMainCmd.Dispose()
                End If
                BloodBankCommand.Dispose()
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

        End If
        GridView1.EditIndex = -1
        SqlDataSource2.DataBind()
        GridView1.DataSource = SqlDataSource2
        GridView1.DataBind()

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

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        SqlDataSource2.DataBind()
        GridView1.DataSource = SqlDataSource2
        GridView1.DataBind()
    End Sub

    Protected Sub SearchBtn_Click(sender As Object, e As EventArgs) Handles SearchBtn.Click
        Try
            con.Open()
            If SearchText.Text = "" Then

                Dim search As String = SearchText.Text.Trim
                Dim da As New SqlDataAdapter("Select * from " + s, con)

                Dim ds As New DataSet
                da.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()

            Else

                Dim search As String = SearchText.Text.Trim
                Dim da As New SqlDataAdapter("Select * from " + s + " where BloodName='" + search + "'", con)

                Dim ds As New DataSet
                da.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()

            End If

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try


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
