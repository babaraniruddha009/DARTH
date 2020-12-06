Imports System.Data
Imports System.Data.SqlClient
Partial Class HospitalReport
        Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Protected Sub ImageButton1_Click(sender As Object, e As EventArgs)
            Dim grdrow As GridViewRow = (sender).NamingContainer
            Dim rowNumber As Label = grdrow.FindControl("ID")
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            con.Open()
        Dim cmd As New SqlCommand("Select Message from HospitalReport where Id=@id", con)
        cmd.Parameters.AddWithValue("@id", rowNumber.Text)
            Dim rdr As SqlDataReader = cmd.ExecuteReader
            rdr.Read()
            Dim s As String = rdr(0)
            rdr.Close()
            alert("alert('" + s + "')")
            cmd.Dispose()
            con.Close()

        End Sub
        Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting

            Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ID")

            Try
                Dim mycon As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
                Dim con As New SqlConnection(mycon)
                con.Open()

            Dim updatedata As String = "Delete from HospitalReport where [ID]= " + id.Text

            Dim cmd As New SqlCommand(updatedata, con)
                Dim n As Integer = cmd.ExecuteNonQuery()

                GridView1.EditIndex = -1
                GridView1.DataSource = SqlDataSource2
                GridView1.DataBind()
                con.Close()
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

        End Sub
        Public Sub alert(ByVal s As String)
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
        End Sub
        Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
            GridView1.DataBind()
        End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Id") IsNot vbNullString And Session("FName") IsNot vbNullString Then
            UserLabel.Text = Session("FName").ToString
            GridView1.DataSource = SqlDataSource2
            GridView1.DataBind()
        Else
            Response.Redirect("~/Index.aspx")
        End If
    End Sub
    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
