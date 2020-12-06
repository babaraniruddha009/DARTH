Imports System.Data
Imports System.Data.SqlClient
Partial Class BloodDetails
    Inherits System.Web.UI.Page
    Private con As SqlConnection
    Dim s As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            s = Session("Unicode").ToString
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")

        Else
            Response.Redirect("~/Index.aspx")
        End If

    End Sub

    Public Shared Function CheckPhoneNumber(ByVal PhoneNumber As String) As Boolean
        Dim MatchPhoneNumberPattern As String = "[0-9]"
        If PhoneNumber IsNot Nothing Then
            Return Regex.IsMatch(PhoneNumber, MatchPhoneNumberPattern)
        Else
            Return False
        End If
    End Function

    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        If CheckPhoneNumber(CDbl(BloodMlTxt.text)) Then

            If BloodNameDropDown.SelectedValue <> -1 Or BloodTypeDropDown.SelectedValue <> -1 Then
                Try
                    con.Open()
                    Dim BloodName As String = BloodNameDropDown.SelectedItem.ToString
                    Dim BloodType As String = BloodTypeDropDown.SelectedItem.ToString
                    Dim BloodInMl As Integer = CInt(BloodMlTxt.Text)
                    Dim CollectionDate As String = EnrolTxt.Text
                    Dim Expiry As String = ExpiryTxt.Text
                    Dim BloodDesc As String = DescTxt.Text

                    Dim cmd As SqlCommand = New SqlCommand("Insert into " + s + "(BloodName,BloodType,BloodInMl,DateofEnrolment,DateofExpiry,Description,DateTime) values(@BloodName,@BloodType,@BloodInMl,@DateofEnrolment,@DateofExpiry,@Description,@DateTime)", con)
                    cmd.Parameters.AddWithValue("@BloodName", BloodName)
                    cmd.Parameters.AddWithValue("@BloodType", BloodType)
                    cmd.Parameters.AddWithValue("@BloodInMl", BloodInMl)
                    cmd.Parameters.AddWithValue("@DateofEnrolment", CollectionDate)
                    cmd.Parameters.AddWithValue("@DateofExpiry", Expiry)
                    cmd.Parameters.AddWithValue("@Description", BloodDesc)
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"))
                    Dim n As Integer = cmd.ExecuteNonQuery()
                    cmd.Dispose()
                    Dim count As Integer
                    If n = 1 Then
                        Dim cmd2 As SqlCommand = New SqlCommand("Select Quantity from " + s + "A where BloodName =@BloodName", con)
                        cmd2.Parameters.AddWithValue("@BloodName", BloodName)
                        Dim rdr As SqlDataReader = cmd2.ExecuteReader
                        While rdr.Read()
                            count = rdr(0)
                        End While
                        rdr.Close()
                        cmd2.Dispose()

                        Dim cmd3 As SqlCommand = New SqlCommand("Update " + s + "A set Quantity=@count where BloodName=@BloodName", con)

                        Dim InsertCommand As SqlCommand = New SqlCommand("UPDATE BloodAvailable set [" + BloodName.ToUpper.Trim + "]=@count where [Unicode]='" + s + "'", con)
                        InsertCommand.Parameters.AddWithValue("@count", count + 1)
                        InsertCommand.ExecuteNonQuery()

                        cmd3.Parameters.AddWithValue("@count", count + 1)
                        cmd3.Parameters.AddWithValue("@BloodName", BloodName)
                        cmd3.ExecuteNonQuery()

                        Dim InsertMainCommand As SqlCommand = New SqlCommand("UPDATE BloodBank set [" + BloodName.ToUpper.Trim + "]=@count where [Unicode]='" + s + "'", con)
                        InsertMainCommand.Parameters.AddWithValue("@count", 1)
                        InsertMainCommand.ExecuteNonQuery()


                        alert("alert('Data Inserted Successfully.')")

                        cmd3.Dispose()
                        BloodNameDropDown.SelectedValue = -1
                        BloodTypeDropDown.SelectedValue = -1
                        BloodMlTxt.Text = String.Empty
                        EnrolTxt.Text = String.Empty
                        ExpiryTxt.Text = String.Empty
                        DescTxt.Text = String.Empty
                    End If
                Catch ex As Exception
                    alert("alert('Invalid Data..')")
                Finally
                    con.Close()
                End Try
            Else
                alert("alert('Fields are empty.')")
            End If
        Else
            alert("alert('Enter correct value..')")

        End If


    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub

End Class
