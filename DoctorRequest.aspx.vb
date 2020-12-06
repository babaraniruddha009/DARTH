Imports System.Data
Imports System.Data.SqlClient
Imports QRCoder
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail
Imports System.Net
Partial Class DoctorRequest
    Inherits System.Web.UI.Page
    Dim S As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Unicode") IsNot vbNullString And Session("HospitalName") IsNot vbNullString Then
            S = Session("Unicode").ToString
            SqlDataSource2.SelectCommand = "Select * from [" + S + "A]"

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
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim id As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
        Dim BloodBankName As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodBank")
        Dim PatientName As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatient")
        Dim PatientAge As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatientDOB")
        Dim BloodGroup As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodGroup")
        Dim BloodType As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodType")
        Dim BloodUnit As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodUnits")
        Dim PatRelName As Label = GridView1.Rows(e.RowIndex).FindControl("ItemRelName")
        Dim Email As Label = GridView1.Rows(e.RowIndex).FindControl("ItemEmail")
        Dim Status As Label = GridView1.Rows(e.RowIndex).FindControl("ItemStatus")
        Dim Contact As Label = GridView1.Rows(e.RowIndex).FindControl("ItemContact")
        Dim Address As Label = GridView1.Rows(e.RowIndex).FindControl("ItemAddress")

        Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        Try
            con.Open()
            Dim BBloodName As String = BloodBankName.Text
            Dim PatName As String = PatientName.Text
            Dim PatAge As String = PatientAge.Text
            Dim BGroup As String = BloodGroup.Text
            Dim BType As String = BloodType.Text
            Dim BUnit As String = BloodUnit.Text
            Dim PRelName As String = PatRelName.Text
            Dim Eml As String = Email.Text
            Dim Cont As String = Contact.Text
            Dim Addr As String = Address.Text
            Dim sat As String = Status.Text
            Dim cmd As New SqlCommand("Select Report from " + S + "A where [BloodBankName]=@BloodBName and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@Bgrp and [BloodType]=@Btype and [BloodUnits]=@Bunits and [Email]=@Eml", con)
            cmd.Parameters.AddWithValue("@BloodBName", BBloodName)
            cmd.Parameters.AddWithValue("@PatName", PatName)
            cmd.Parameters.AddWithValue("@PatAge", PatAge)
            cmd.Parameters.AddWithValue("@Bgrp", BGroup)
            cmd.Parameters.AddWithValue("@BType", BType)
            cmd.Parameters.AddWithValue("@BUnits", BUnit)
            cmd.Parameters.AddWithValue("@Eml", Eml)

            Dim rs As SqlDataReader = cmd.ExecuteReader()
            rs.Read()
            Dim bytes As Byte()
            bytes = rs(0)
            rs.Close()
            cmd.Dispose()


            Dim cmd2 As New SqlCommand("Insert into HS617633B(BloodBankName,PatientName,PatientAge,BloodGroup,BloodType,Report,BloodUnits,PatientRelName,Email,Contact,Address,Status,DateTime) values(@BloodName,@PatNm,@PatAg,@BloodGrp,@BloodTyp,@Report,@BloodUnits,@PatRelName,@Email,@Contact,@Address,@Status,@DateTime)", con)
            cmd2.Parameters.AddWithValue("@BloodName", BBloodName)
            cmd2.Parameters.AddWithValue("@PatNm", PatName)
            cmd2.Parameters.AddWithValue("@PatAg", PatAge)

            cmd2.Parameters.AddWithValue("@BloodGrp", BGroup)
            cmd2.Parameters.AddWithValue("@BloodTyp", BType)
            cmd2.Parameters.AddWithValue("@Report", bytes)
            cmd2.Parameters.AddWithValue("@BloodUnits", BUnit)
            cmd2.Parameters.AddWithValue("@PatRelName", PRelName)
            cmd2.Parameters.AddWithValue("@Email", Eml)
            cmd2.Parameters.AddWithValue("@Contact", Cont)
            cmd2.Parameters.AddWithValue("@Address", Addr)
            cmd2.Parameters.AddWithValue("@Status", "Canceled")
            cmd2.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
            cmd2.ExecuteNonQuery()

            Dim cmd3 As New SqlCommand("Delete from [" + S + "A] where Id=@id", con)
            cmd3.Parameters.AddWithValue("@id", id.Text.Trim)
            Dim n As Integer = cmd3.ExecuteNonQuery
            If n = 1 Then
                Dim SelectCommand As New SqlCommand("Select Unicode from BloodBank Where BloodBank_Name=@BBName", con)
                SelectCommand.Parameters.AddWithValue("@BBName", BBloodName)
                Dim SelectRead As SqlDataReader = SelectCommand.ExecuteReader
                SelectRead.Read()
                Dim Uni As String = SelectRead(0)
                SelectRead.Close()
                SelectCommand.Dispose()

                Dim DeleteCmd As New SqlCommand("Delete from " + Uni + "C where PatientName=@PName and PatientAge=@PAge and BloodGroup=@BGroup and BloodType=@BloodType and BloodUnits=@BloodUnits and Email=@Email and Status=@Status", con)
                DeleteCmd.Parameters.AddWithValue("@PName", PatName)
                DeleteCmd.Parameters.AddWithValue("@PAge", PatAge)
                DeleteCmd.Parameters.AddWithValue("@BGroup", BGroup)
                DeleteCmd.Parameters.AddWithValue("@BloodType", BType)
                DeleteCmd.Parameters.AddWithValue("@BloodUnits", BUnit)
                DeleteCmd.Parameters.AddWithValue("@Email", Eml)
                DeleteCmd.Parameters.AddWithValue("@Status", sat)
                DeleteCmd.ExecuteNonQuery()
                DeleteCmd.Dispose()

            End If
            con.Close()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim LbRequest As LinkButton = TryCast(e.Row.FindControl("DeliverBtn"), LinkButton)
            Dim LbCancel As LinkButton = TryCast(e.Row.FindControl("CancelBtn"), LinkButton)
            Dim LbResend As LinkButton = TryCast(e.Row.FindControl("ResendBtn"), LinkButton)
            Dim lbl As Label = TryCast(e.Row.FindControl("ItemStatus"), Label)
            If lbl.Text = "Accepted" Then
                LbRequest.Visible = True
                LbCancel.Visible = False

            ElseIf lbl.Text = "Requested" Then
                LbCancel.Visible = True
                LbRequest.Visible = False

            ElseIf lbl.Text = "Declined" Or lbl.Text = "Time Out!" Then
                LbResend.Visible = True
                LbCancel.Visible = True
                LbRequest.Visible = False
            End If
        End If

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "Resend" Then
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            Dim id As Label = row.FindControl("ItemId")

            Dim Unicode As Label = row.FindControl("ItemUnicode")
            Dim BloodBankName As Label = row.FindControl("ItemBloodBank")
            Dim PatientName As Label = row.FindControl("ItemPatient")
            Dim PatientAge As Label = row.FindControl("ItemPatientDOB")
            Dim BloodGroup As Label = row.FindControl("ItemBloodGroup")
            Dim BloodType As Label = row.FindControl("ItemBloodType")
            Dim BloodUnit As Label = row.FindControl("ItemBloodUnits")
            Dim PatRelName As Label = row.FindControl("ItemRelName")
            Dim Email As Label = row.FindControl("ItemEmail")
            Dim Contact As Label = row.FindControl("ItemContact")
            Dim Address As Label = row.FindControl("ItemAddress")
            Dim Status As Label = row.FindControl("ItemStatus")
            Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
            Try
                con.Open()
                Dim uni As String = Unicode.Text

                Dim BBloodName As String = BloodBankName.Text
                Dim PatName As String = PatientName.Text
                Dim PatAge As String = PatientAge.Text
                Dim BGroup As String = BloodGroup.Text
                Dim BType As String = BloodType.Text
                Dim BUnit As String = BloodUnit.Text
                Dim PRelName As String = PatRelName.Text
                Dim Eml As String = Email.Text
                Dim Cont As String = Contact.Text
                Dim Addr As String = Address.Text
                Dim Sat As String = Status.Text
                Dim cmd As New SqlCommand("Select Report from [" + S + "A] where [BloodBankName]=@BloodBName and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@Bgrp and [BloodType]=@Btype and [BloodUnits]=@Bunits and [Email]=@Eml", con)
                cmd.Parameters.AddWithValue("@BloodBName", BBloodName)
                cmd.Parameters.AddWithValue("@PatName", PatName)
                cmd.Parameters.AddWithValue("@PatAge", PatAge)
                cmd.Parameters.AddWithValue("@Bgrp", BGroup)
                cmd.Parameters.AddWithValue("@BType", BType)
                cmd.Parameters.AddWithValue("@BUnits", BUnit)
                cmd.Parameters.AddWithValue("@Eml", Eml)

                Dim rs As SqlDataReader = cmd.ExecuteReader()
                rs.Read()
                Dim bytes As Byte()
                bytes = rs(0)
                rs.Close()
                cmd.Dispose()


                Dim cmd2 As New SqlCommand("Select Hospital_Name,Doctor_Name,Contact_No,Landline,Address from [Hospital] where Unicode='" + S + "'", con)
                Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
                rdr2.Read()
                Dim HospName As String = rdr2(0).ToString
                Dim DoctName As String = rdr2(1).ToString
                Dim ContactNo As String = rdr2(2).ToString
                Dim Landline As String = rdr2(3).ToString
                Dim Add As String = rdr2(4).ToString
                rdr2.Close()
                cmd2.Dispose()

                Dim cmd3 As New SqlCommand("Insert Into " + uni + "C(HospitalName,DoctorName,ContactNo,Landline,Address,PatientName,PatientAge,BloodGroup,BloodType,BloodUnits,Report,PatientRelName,Email,PatientContact,Status,DateTime,DeleteRequestTime) values(@HName,@DName,@CNo,@LadLine,@Addr,@PatNm,@PatAge,@BGroup,@BType,@BUnits,@Report,@PatRelName,@Email,@PatContact,@Status,@DateTime,@DeleteRequestTime)", con)
                cmd3.Parameters.AddWithValue("@HName", HospName)
                cmd3.Parameters.AddWithValue("@DName", DoctName)
                cmd3.Parameters.AddWithValue("@CNo", ContactNo)
                cmd3.Parameters.AddWithValue("@LadLine", Landline)
                cmd3.Parameters.AddWithValue("@Addr", Addr)
                cmd3.Parameters.AddWithValue("@PatNm", PatName)
                cmd3.Parameters.AddWithValue("@PatAge", PatAge)
                cmd3.Parameters.AddWithValue("@BGroup", BGroup)
                cmd3.Parameters.AddWithValue("@BType", BType)
                cmd3.Parameters.AddWithValue("@Report", bytes)
                cmd3.Parameters.AddWithValue("@BUnits", BUnit)
                cmd3.Parameters.AddWithValue("@PatRelName", PRelName)
                cmd3.Parameters.AddWithValue("@Email", Eml)
                cmd3.Parameters.AddWithValue("@PatContact", Cont)
                cmd3.Parameters.AddWithValue("@Status", "Requested")
                cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                cmd3.Parameters.AddWithValue("@DeleteRequestTime", DateTime.Now.AddMinutes(5).ToString)
                cmd3.ExecuteNonQuery()
                Dim UpdateCommand As New SqlCommand("Update " + S + "A set Status='Requested' where BloodBankName=@BName and PatientName=@PatName and PatientAge=@PatAge and BloodGroup=@BGroup and BloodType=@BType and BloodUnits=@BUnits and Email=@Email and Status=@Status", con)
                UpdateCommand.Parameters.AddWithValue("@BName", BBloodName)
                UpdateCommand.Parameters.AddWithValue("@PatName", PatName)
                UpdateCommand.Parameters.AddWithValue("@PatAge", PatAge)
                UpdateCommand.Parameters.AddWithValue("@BGroup", BGroup)
                UpdateCommand.Parameters.AddWithValue("@BType", BType)
                UpdateCommand.Parameters.AddWithValue("@BUnits", BUnit)
                UpdateCommand.Parameters.AddWithValue("@Email", Eml)
                UpdateCommand.Parameters.AddWithValue("@Status", Sat)
                UpdateCommand.ExecuteNonQuery()

            Catch ex As Exception
                MsgBox(ex.ToString)
            Finally
                con.Close()
            End Try

        ElseIf e.CommandName = "Deliver" Then
            Try
                Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")


                Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As GridViewRow = GridView1.Rows(rowIndex)
                Dim id As Label = row.FindControl("ItemId")
                Dim Unicode As Label = row.FindControl("ItemUnicode")
                Dim BloodBankName As Label = row.FindControl("ItemBloodBank")
                Dim PatientName As Label = row.FindControl("ItemPatient")
                Dim PatientAge As Label = row.FindControl("ItemPatientDOB")
                Dim BloodGroup As Label = row.FindControl("ItemBloodGroup")
                Dim BloodType As Label = row.FindControl("ItemBloodType")
                Dim BloodUnit As Label = row.FindControl("ItemBloodUnits")
                Dim PatRelName As Label = row.FindControl("ItemRelName")
                Dim Email As Label = row.FindControl("ItemEmail")
                Dim Contact As Label = row.FindControl("ItemContact")
                Dim Address As Label = row.FindControl("ItemAddress")


                Dim uni As String = Unicode.Text.Trim
                Dim BBloodName As String = BloodBankName.Text
                Dim PatName As String = PatientName.Text
                Dim PatAge As String = PatientAge.Text
                Dim BGroup As String = BloodGroup.Text
                Dim BType As String = BloodType.Text
                Dim BUnit As String = BloodUnit.Text
                Dim PRelName As String = PatRelName.Text
                Dim Eml As String = Email.Text
                Dim Cont As String = Contact.Text
                Dim Addr As String = Address.Text

                con.Open()
                Dim cmd As New SqlCommand("Select Report from " + S + "A where [BloodBankName]=@BloodBName and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@Bgrp and [BloodType]=@Btype and [BloodUnits]=@Bunits and [Email]=@Eml", con)
                cmd.Parameters.AddWithValue("@BloodBName", BBloodName)
                cmd.Parameters.AddWithValue("@PatName", PatName)
                cmd.Parameters.AddWithValue("@PatAge", PatAge)
                cmd.Parameters.AddWithValue("@Bgrp", BGroup)
                cmd.Parameters.AddWithValue("@BType", BType)
                cmd.Parameters.AddWithValue("@BUnits", BUnit)
                cmd.Parameters.AddWithValue("@Eml", Eml)
                Dim rs As SqlDataReader = cmd.ExecuteReader()
                rs.Read()
                Dim bytes As Byte()
                bytes = rs(0)
                rs.Close()
                cmd.Dispose()

                Dim cmd2 As New SqlCommand("Select Hospital_Name,Doctor_Name,Address from Hospital where [Unicode]='" + S + "'", con)
                Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
                rdr2.Read()
                Dim HospName As String = rdr2(0).ToString
                Dim DoctName As String = rdr2(1).ToString
                Dim Adr As String = rdr2(2).ToString
                rdr2.Close()
                cmd2.Dispose()


                Dim InsertCmd As New SqlCommand("Insert into " + S + "B(BloodBankName,PatientName,PatientAge,BloodGroup,BloodType,Report,BloodUnits,PatientRelName,Email,Contact,Address,Status,DateTime) values(@BloodBankName,@PatNm,@PatAge,@BGroup,@BType,@Rep,@BUnits,@PatRelName,@Email,@PatContact,@Address,@Status,@DateTime)", con)
                InsertCmd.Parameters.AddWithValue("@BloodBankName", BBloodName)
                InsertCmd.Parameters.AddWithValue("@PatNm", PatName)
                InsertCmd.Parameters.AddWithValue("@PatAge", PatAge)
                InsertCmd.Parameters.AddWithValue("@BGroup", BGroup)
                InsertCmd.Parameters.AddWithValue("@BType", BType)
                InsertCmd.Parameters.AddWithValue("@Rep", bytes)
                InsertCmd.Parameters.AddWithValue("@BUnits", BUnit)
                InsertCmd.Parameters.AddWithValue("@PatRelName", PRelName)
                InsertCmd.Parameters.AddWithValue("@Email", Eml)
                InsertCmd.Parameters.AddWithValue("@PatContact", Cont)
                InsertCmd.Parameters.AddWithValue("@Address", Adr)
                InsertCmd.Parameters.AddWithValue("@Status", "Delivered")
                InsertCmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                InsertCmd.ExecuteNonQuery()



                Dim UpdateCommand2 As New SqlCommand("Update " + Unicode.Text.Trim + "D set Status='Delivered' where HospitalName=@HospName and DoctorName=@DoctName and PatientName=@PatName and PatientAge=@PatAge and BloodGroup=@BGroup and BloodType=@BType and BloodUnits=@BUnits and Email=@Email and Status='Accepted'", con)

                UpdateCommand2.Parameters.AddWithValue("@HospName", HospName)
                UpdateCommand2.Parameters.AddWithValue("@DoctName", DoctName)
                UpdateCommand2.Parameters.AddWithValue("@PatName", PatName)
                UpdateCommand2.Parameters.AddWithValue("@PatAge", PatAge)
                UpdateCommand2.Parameters.AddWithValue("@BGroup", BGroup)
                UpdateCommand2.Parameters.AddWithValue("@BType", BType)
                UpdateCommand2.Parameters.AddWithValue("@BUnits", BUnit)
                UpdateCommand2.Parameters.AddWithValue("@Email", Eml)
                UpdateCommand2.ExecuteNonQuery()

                Dim DeleteCommand As New SqlCommand("Delete from " + S + "A where Id=@Id", con)
                DeleteCommand.Parameters.AddWithValue("@Id", id.Text)
                Dim n As Integer = DeleteCommand.ExecuteNonQuery()
                If n = 1 Then

                    Dim Units As Integer = CInt(BUnit.Substring(0, 1))
                    Dim SelectAvailableCmd As New SqlCommand("Select [" + BGroup + "] from BloodAvailable where Unicode=@Unicode", con)
                    SelectAvailableCmd.Parameters.AddWithValue("@Unicode", uni)
                    Dim SelectReader As SqlDataReader = SelectAvailableCmd.ExecuteReader
                    SelectReader.Read()
                    Dim AvailableUnits As Integer = CInt(SelectReader(0))
                    SelectReader.Close()

                    Dim Update1 As New SqlCommand("Update BloodAvailable set [" + BGroup + "] =@BloodGroup", con)
                    Update1.Parameters.AddWithValue("@BloodGroup", AvailableUnits - Units)
                    Update1.ExecuteNonQuery()

                    Dim Update2 As New SqlCommand("Update [" + uni + "A] set Quantity=@Units where BloodName=@BloodName", con)
                    Update2.Parameters.AddWithValue("@Units", AvailableUnits - Units)
                    Update2.Parameters.AddWithValue("@BloodName", BGroup)
                    Update2.ExecuteNonQuery()

                    Dim SelectMainCmd As New SqlCommand("Select [" + BGroup + "] from BloodAvailable where Unicode=@Unicode", con)
                    SelectMainCmd.Parameters.AddWithValue("@Unicode", uni)
                    Dim SelectMainReader As SqlDataReader = SelectAvailableCmd.ExecuteReader
                    SelectMainReader.Read()
                    Dim MainUnits As Integer = CInt(SelectMainReader(0))
                    SelectMainReader.Close()
                    If MainUnits = 0 Then
                        Dim UpdateMain As New SqlCommand("Update BloodBank set [" + BGroup + "]=0 where Unicode=@Unicode", con)
                        UpdateMain.Parameters.AddWithValue("@Unicode", uni)
                        UpdateMain.ExecuteNonQuery()

                    End If
                    Dim DeleteBloodDetails As New SqlCommand("Delete Top(" + Units.ToString + ") from [" + uni + "] where BloodName=@BName", con)
                    DeleteBloodDetails.Parameters.AddWithValue("@BName", BGroup)
                    DeleteBloodDetails.ExecuteNonQuery()


                    Dim code As String = HospName + ", " + DoctName + ", " + BBloodName + ", " + PatName + ", " + PatAge + ", " + BGroup + ", " + BType + ", " + BUnit + ", " + Cont + ", " + Date.Now.ToString
                    Dim qrGenerator As New QRCodeGenerator()
                    Dim qrCode As QRCodeGenerator.QRCode = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q)
                    Dim imgBarCode As New System.Web.UI.WebControls.Image()
                    imgBarCode.Height = 150
                    imgBarCode.Width = 150

                    Using bitMap As Bitmap = qrCode.GetGraphic(20)
                        Using ms As New MemoryStream()
                            bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png)
                            bitMap.Save(Server.MapPath("~/Images/qrcode.png"), System.Drawing.Imaging.ImageFormat.Png)
                        End Using
                    End Using

                    Dim password As String = "DARTH271517"
                    Dim subject As String = "DARTH Blood."

                    Dim mm As New MailMessage("darthblood16@gmail.com", Eml, subject, "Hey ! This Is DARTH.We had send a coupen on your email. Please redim this coupen by donating blood in your nearest blood bank & get your concession.<br/> Note : This coupen is valid up to " + Date.Now.AddDays(5))
                    mm.IsBodyHtml = True
                    mm.Attachments.Add(New Attachment("F:\VB Programs\DARTH\Images\qrcode.png"))
                    Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                    smtp.EnableSsl = True
                    smtp.UseDefaultCredentials = True
                    Dim netcred As New NetworkCredential("darthblood16@gmail.com", password)
                    smtp.Credentials = netcred
                    smtp.Send(mm)
                End If
            Catch ex As Exception
                msgbox(ex.ToString)
            End Try
        End If
    End Sub
    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub
    Protected Sub LogoutBtn_Click(sender As Object, e As EventArgs) Handles LogoutBtn.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Index.aspx")
    End Sub
End Class
