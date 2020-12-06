Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Partial Class DoctorRequestPage
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim S As String
    Dim Unicode As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
            S = Session("Unicode").ToString
            Unicode = Request.QueryString("UC").Substring(2, 8).ToString
            Dim BloodBankName As String = Request.QueryString("Nm").ToString
            BloodBankNameTxt.Text = BloodBankName
            BloodBankNameTxt.ReadOnly = True
            BloodBankNameTxt.BackColor = Drawing.Color.White
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")

        Else
            Response.Redirect("~/Index.aspx")
        End If


    End Sub
    Protected Sub BtnRegister_Click(sender As Object, e As EventArgs) Handles BtnRegister.Click
        Dim n As Integer
        If (Not FileUploader1.HasFile) Or BloodDropdown.SelectedValue = "-1" Or BloodDropList.SelectedValue = "-1" Or BloodTypeDropDown.SelectedValue = "-1" Then

            alert("alert('Fields are empty.')")
        Else


            Dim ext As String = Path.GetExtension(FileUploader1.PostedFile.FileName)

            If (ext.Equals(".png") Or ext.Equals(".jpeg") Or ext.Equals(".jpg")) Then


                Dim BloodBankName As String = BloodBankNameTxt.Text.Trim
                Dim PatientName As String = TxtPatient.Text.Trim
                Dim PatientAge As String = TxtPatientAge.Text.Trim.ToString
                Dim BloodGroup As String = BloodDropdown.SelectedItem.ToString
                Dim BloodType As String = BloodTypeDropDown.SelectedItem.ToString
                Dim BloodUnit As String = BloodDropList.SelectedItem.ToString
                Dim PatRelName As String = TxtRelativeName.Text.Trim
                Dim Email As String = EmailTxt.Text.Trim
                Dim Contact As String = TxtContact.Text.Trim
                Dim Address As String = AddressTxt.Text.Trim

                con.Open()
                Dim Units As Integer = CInt(BloodDropList.SelectedItem.ToString.Substring(0, 1))
                Dim SelectAvailableCmd As New SqlCommand("Select [" + BloodGroup + "] from BloodAvailable where Unicode=@Unicode", con)
                SelectAvailableCmd.Parameters.AddWithValue("@Unicode", Unicode)
                Dim SelectReader As SqlDataReader = SelectAvailableCmd.ExecuteReader
                SelectReader.Read()
                Dim AvailableUnits As Integer = CInt(SelectReader(0))
                SelectReader.Close()

                If Units <= AvailableUnits Then
                    Try
                        Dim bytes As Byte()
                        Using br As BinaryReader = New BinaryReader(FileUploader1.PostedFile.InputStream)
                            bytes = br.ReadBytes(FileUploader1.PostedFile.ContentLength)
                        End Using

                        Dim sql As String = "INSERT INTO " + S + "A(BloodBankName,PatientName,PatientAge,BloodGroup,BloodType,Report,ReportType,BloodUnits,PatientRelName,Email,Contact,Address,Status,DateTime) VALUES(@BloodBankName,@PatientName,@PatientAge,@BloodGroup,@BloodType,@Report,@ReportType,@BloodUnits,@PatientRelName,@Email,@Contact,@Address,@Status,@DateTime)"
                        Using cmd As SqlCommand = New SqlCommand(sql, con)


                            cmd.Parameters.AddWithValue("@BloodBankName", BloodBankName)
                            cmd.Parameters.AddWithValue("@PatientName", PatientName)
                            cmd.Parameters.AddWithValue("@PatientAge", PatientAge)
                            cmd.Parameters.AddWithValue("@BloodGroup", BloodGroup)
                            cmd.Parameters.AddWithValue("@BloodType", BloodType)
                            cmd.Parameters.AddWithValue("@Report", bytes)
                            cmd.Parameters.AddWithValue("@ReportType", Path.GetFileName(FileUploader1.PostedFile.FileName).ToString)
                            cmd.Parameters.AddWithValue("@BloodUnits", BloodUnit)
                            cmd.Parameters.AddWithValue("@PatientRelName", PatRelName)
                            cmd.Parameters.AddWithValue("@Email", Email)
                            cmd.Parameters.AddWithValue("@Contact", Contact)
                            cmd.Parameters.AddWithValue("@Address", Address)

                            cmd.Parameters.AddWithValue("@Status", "Requested")
                            cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"))

                            n = cmd.ExecuteNonQuery()
                            cmd.Dispose()

                            If n = 1 Then



                                Dim cmd2 As New SqlCommand("Select Hospital_Name,Doctor_Name,Contact_No,Landline,Address from [Hospital] where Unicode='" + S + "'", con)
                                Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
                                rdr2.Read()
                                Dim HospName As String = rdr2(0).ToString
                                Dim DoctName As String = rdr2(1).ToString
                                Dim ContactNo As String = rdr2(2).ToString
                                Dim Landline As String = rdr2(3).ToString
                                Dim Addr As String = rdr2(4).ToString
                                rdr2.Close()
                                cmd2.Dispose()

                                Dim cmd3 As New SqlCommand("Insert Into " + Unicode + "C(HospitalName,DoctorName,ContactNo,Landline,Address,PatientName,PatientAge,BloodGroup,BloodType,BloodUnits,Report,PatientRelName,Email,PatientContact,Status,DateTime,DeleteRequestTime) values(@HName,@DName,@CNo,@LadLine,@Addr,@PatNm,@PatAge,@BGroup,@BType,@BUnits,@Report,@PatRelName,@Email,@PatContact,@Status,@DateTime,@DeleteRequestTime)", con)
                                cmd3.Parameters.AddWithValue("@HName", HospName)
                                cmd3.Parameters.AddWithValue("@DName", DoctName)
                                cmd3.Parameters.AddWithValue("@CNo", ContactNo)
                                cmd3.Parameters.AddWithValue("@LadLine", Landline)
                                cmd3.Parameters.AddWithValue("@Addr", Addr)
                                cmd3.Parameters.AddWithValue("@PatNm", PatientName)
                                cmd3.Parameters.AddWithValue("@PatAge", PatientAge)
                                cmd3.Parameters.AddWithValue("@BGroup", BloodGroup)
                                cmd3.Parameters.AddWithValue("@BType", BloodType)
                                cmd3.Parameters.AddWithValue("@BUnits", BloodUnit)
                                cmd3.Parameters.AddWithValue("@Report", bytes)
                                cmd3.Parameters.AddWithValue("@PatRelName", PatRelName)
                                cmd3.Parameters.AddWithValue("@Email", Email)
                                cmd3.Parameters.AddWithValue("@PatContact", Contact)
                                cmd3.Parameters.AddWithValue("@Status", "Requested")
                                cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                                cmd3.Parameters.AddWithValue("@DeleteRequestTime", DateTime.Now.AddMinutes(5).ToString)
                                cmd3.ExecuteNonQuery()
                                cmd3.Dispose()

                                alert("alert('Details uploaded successfully.')")
                                BloodBankNameTxt.Text = String.Empty
                                TxtPatient.Text = String.Empty
                                TxtPatientAge.Text = String.Empty
                                BloodDropdown.SelectedValue = "-1"
                                BloodTypeDropDown.SelectedValue = "-1"
                                BloodDropList.SelectedValue = "-1"
                                TxtRelativeName.Text = String.Empty
                                EmailTxt.Text = String.Empty
                                TxtContact.Text = String.Empty
                                AddressTxt.Text = String.Empty
                            End If
                        End Using
                    Catch ex As Exception
                        MsgBox(ex.ToString)
                        'alert("alert('File not found...Please try again.')")
                    Finally

                    End Try
                Else
                    alert("alert('Blood units not available..')")
                End If
            Else
                alert("alert('Please upload only png or jpeg file.')")
                BloodBankNameTxt.Text = String.Empty
                TxtPatient.Text = String.Empty
                TxtPatientAge.Text = String.Empty
                BloodDropdown.SelectedValue = "-1"
                BloodTypeDropDown.SelectedValue = "-1"
                BloodDropList.SelectedValue = "-1"
                TxtRelativeName.Text = String.Empty
                EmailTxt.Text = String.Empty
                TxtContact.Text = String.Empty
                AddressTxt.Text = String.Empty
            End If
        End If

    End Sub

    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
End Class
