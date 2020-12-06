﻿Imports System.Data.SqlClient
Imports System.Data
Partial Class BloodBankTable
    Inherits System.Web.UI.Page
    Dim con As SqlConnection

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        If Session("Id") IsNot vbNullString And Session("FName") IsNot vbNullString Then
            UserLabel.Text = Session("FName").ToString
            SqlDataSource1.SelectCommand = "SELECT * FROM BloodBank order by [DateTime]"

            If Not Page.IsPostBack Then
                GridView1.DataSource = SqlDataSource1
                GridView1.DataBind()
            End If
        Else
            Response.Redirect("~/Index.aspx")
        End If
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing

        GridView1.EditIndex = e.NewEditIndex
        GridView1.DataSource = SqlDataSource1
        GridView1.DataBind()

    End Sub
    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        GridView1.DataSource = SqlDataSource1
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Try
            Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
            Dim con As New SqlConnection(mycon)
            con.Open()

            Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("EditId")
            Dim BloodBankName As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditBloodBankName")
            Dim BloodBankType As DropDownList = GridView1.Rows(e.RowIndex).FindControl("EditBloodBankType")
            Dim Address As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditAddress")
            Dim Cit As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditCity")
            Dim State As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditState")
            Dim Pincode As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditPincode")
            Dim Latitude As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditLatitude")
            Dim Longitude As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditLongitude")
            Dim License As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditLicense")
            Dim LicenseDate As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditLicenseDate")
            Dim LicenseRenewal As TextBox = GridView1.Rows(e.RowIndex).FindControl("EditRenewalDate")

            Dim Unicode As String = id.text.trim
            Dim BloodBnkName As String = BloodBankName.text.trim
            Dim BloodBnkType As String = BloodBankType.SelectedItem.Text
            Dim Addr As String = Address.text.trim
            Dim City As String = Cit.text.trim
            Dim Stat As String = State.text.trim
            Dim Pin As String = Pincode.text.trim
            Dim Lat As String = Latitude.text.trim
            Dim Lng As String = Longitude.text.trim
            Dim Licen As String = License.text.trim
            Dim LicenDate As String = LicenseDate.text.trim
            Dim LicenRenewal As String = LicenseRenewal.text.trim

            If BloodBnkType = "Select Blood Bank Type" Then

            Else
                Dim UpdateCmd As New sqlcommand("Update BloodBank set BloodBank_Name=@BloodBank_Name,BloodBank_Type=@BloodBank_Type,Address=@Address,City=@City,State=@State,Pin_Code=@Pincode,Latitude=@Latitude,Longitude=@Longitude,License_No=@LicenseNo,Date_of_License=@DateofLicense,Date_of_Renewal=@DateofRenewal where Unicode=@Unic", con)
                UpdateCmd.Parameters.AddWithValue("@Unic", Unicode)
                UpdateCmd.Parameters.AddWithValue("@BloodBank_Name", BloodBnkName)
                UpdateCmd.Parameters.AddWithValue("@BloodBank_Type", BloodBnkType)
                UpdateCmd.Parameters.AddWithValue("@Address", Addr)
                UpdateCmd.Parameters.AddWithValue("@City", City)
                UpdateCmd.Parameters.AddWithValue("@State", Stat)
                UpdateCmd.Parameters.AddWithValue("@Pincode", Pin)
                UpdateCmd.Parameters.AddWithValue("@Latitude", Lat)
                UpdateCmd.Parameters.AddWithValue("@Longitude", Lng)
                UpdateCmd.Parameters.AddWithValue("@LicenseNo", Licen)
                UpdateCmd.Parameters.AddWithValue("@DateofLicense", LicenDate)
                UpdateCmd.Parameters.AddWithValue("@DateofRenewal", LicenRenewal)
                UpdateCmd.ExecuteNonQuery()

                Dim UpdateCmd2 As New sqlcommand("Update BloodAvailable set BloodBank_Name=@BloodBank_Name,BloodBank_Type=@BloodBank_Type,Address=@Address,City=@City,State=@State,Pin_Code=@Pincode where Unicode=@Unic", con)
                UpdateCmd2.Parameters.AddWithValue("@Unic", Unicode)
                UpdateCmd2.Parameters.AddWithValue("@BloodBank_Name", BloodBnkName)
                UpdateCmd2.Parameters.AddWithValue("@BloodBank_Type", BloodBnkType)
                UpdateCmd2.Parameters.AddWithValue("@Address", Addr)
                UpdateCmd2.Parameters.AddWithValue("@City", City)
                UpdateCmd2.Parameters.AddWithValue("@State", Stat)
                UpdateCmd2.Parameters.AddWithValue("@Pincode", Pin)
                UpdateCmd2.ExecuteNonQuery()

                GridView1.EditIndex = -1
                GridView1.DataSource = SqlDataSource1
                GridView1.DataBind()
                con.Close()
            End If

        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            con.Close()
        End Try

    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting


        Try
            Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
            Dim con As New SqlConnection(mycon)
            con.Open()
            Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
            Dim DateT As label = GridView1.Rows(e.RowIndex).FindControl("ItemDateTime")
            If DateT.text = "" Then
                alert("Can't deleted account...")
            Else
                Dim DeleteCmd As New sqlcommand("Delete from BloodBank where Unicode=@Unicode", con)
                DeleteCmd.Parameters.AddWithValue("@Unicode", id.text.trim)
                Dim n As Integer = DeleteCmd.ExecuteNonQuery()

                Dim DeleteCmd2 As New SqlCommand("Delete from BloodAvailable where Unicode=@Unicode", con)
                DeleteCmd2.Parameters.AddWithValue("@Unicode", id.Text.Trim)
                DeleteCmd2.ExecuteNonQuery()


                If n = 1 Then
                    Dim DropTable1 As New SqlCommand("Drop Table " + id.text.trim + "", con)
                    DropTable1.ExecuteNonQuery()
                    Dim DropTable2 As New SqlCommand("Drop Table " + id.text.trim + "A", con)
                    DropTable2.ExecuteNonQuery()
                    Dim DropTable3 As New SqlCommand("Drop Table " + id.text.trim + "B", con)
                    DropTable3.ExecuteNonQuery()
                    Dim DropTable4 As New SqlCommand("Drop Table " + id.text.trim + "C", con)
                    DropTable4.ExecuteNonQuery()
                    Dim DropTable5 As New SqlCommand("Drop Table " + id.text.trim + "D", con)
                    DropTable5.ExecuteNonQuery()
                End If
                GridView1.EditIndex = -1
                GridView1.DataSource = SqlDataSource1

                GridView1.DataBind()
                con.close()
            End If

        Catch ex As Exception
            msgbox(ex.toString)
        End Try
    End Sub



    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataSource = SqlDataSource1
        GridView1.DataBind()
    End Sub


    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub
    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class



