Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Net
Imports System.IO
Partial Class BloodBankRequest
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim S As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("unicode") IsNot vbNullString And Session("BloodBankName") IsNot vbNullString Then
            S = Session("Unicode").ToString
            SqlDataSource2.SelectCommand = "Select * from [" + S + "C]"
            con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        Else
            Response.Redirect("~/Index.aspx")
        End If

    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim date2 As Label = TryCast(e.Row.FindControl("ItemDate"), Label)
            Dim lbl As Label = TryCast(e.Row.FindControl("ItemStatus"), Label)
            Dim DeleteRequest As Label = TryCast(e.Row.FindControl("ItemDeleteDate"), Label)

            Dim timer_arr2(3) As String
            Dim timer2 As String = DeleteRequest.text.trim.Substring(12)
            timer_arr2 = timer2.Split(":")
            Dim h2 As String = timer_arr2(0)
            Dim m2 As String = timer_arr2(1)
            Dim s2 As String = timer_arr2(2)
            Dim t2 As String = h2 + m2 + s2
            Dim DeleteTime As Integer = CInt(t2)

            Dim timer_arr(3) As String
            Dim time As String = DateTime.Now.ToString.SubString(12)
            timer_arr = time.Split(":")
            Dim h As String = timer_arr(0)
            Dim m As String = timer_arr(1)
            Dim sec As String = timer_arr(2)
            Dim t As String = h + m + sec
            Dim NowCompare As Integer = CInt(t)
            If lbl.Text = "Requested" Then
                If DeleteTime <= NowCompare Then
                    Try


                        Dim Id2 As Label = e.Row.FindControl("ItemId")
                        Dim HospName2 As Label = e.Row.FindControl("ItemHospitalName")
                        Dim DoctName2 As Label = e.Row.FindControl("ItemDoctor")

                        Dim ContactNo2 As Label = e.Row.FindControl("ItemContact")
                        Dim Landline2 As Label = e.Row.FindControl("ItemLandline")
                        Dim Address2 As Label = e.Row.FindControl("ItemAddress")
                        Dim PatientName2 As Label = e.Row.FindControl("ItemPatientName")
                        Dim PatientAge2 As Label = e.Row.FindControl("ItemAge")
                        Dim BloodGroup2 As Label = e.Row.FindControl("ItemBloodGroup")
                        Dim BloodType2 As Label = e.Row.FindControl("ItemBloodType")
                        Dim BloodUnits2 As Label = e.Row.FindControl("ItemBloodUnits")
                        Dim Email2 As Label = e.Row.FindControl("ItemEmail")
                        Dim PatientRelName2 As Label = e.Row.FindControl("ItemRelName")
                        Dim PatientContact2 As Label = e.Row.FindControl("ItemPatContact")

                        Dim Id As Integer = Id2.Text
                        Dim HospName As String = HospName2.Text
                        Dim DoctName As String = DoctName2.Text
                        Dim ContactNo As String = ContactNo2.Text
                        Dim Landline As String = Landline2.Text

                        Dim Address As String = Address2.Text
                        Dim PatientName As String = PatientName2.Text
                        Dim PatientAge As String = PatientAge2.Text
                        Dim BloodGroup As String = BloodGroup2.Text
                        Dim BloodType As String = BloodType2.Text
                        Dim BloodUnits As String = BloodUnits2.Text
                        Dim Email As String = Email2.Text
                        Dim PatientRelName As String = PatientRelName2.Text
                        Dim PatientContact As String = PatientContact2.Text

                        con.Open()

                        Dim cmd As New SqlCommand("Select Report from [" + S + "C] where [HospitalName]=@HospitalNm and [DoctorName]=@DoctorNm and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@BGroup and [BloodType]=@BType and [BloodUnits]=@BUnits and [Email]=@Email", con)
                        cmd.Parameters.AddWithValue("@HospitalNm", HospName)
                        cmd.Parameters.AddWithValue("@DoctorNm", DoctName)
                        cmd.Parameters.AddWithValue("@PatName", PatientName)
                        cmd.Parameters.AddWithValue("@PatAge", PatientAge)
                        cmd.Parameters.AddWithValue("@BGroup", BloodGroup)
                        cmd.Parameters.AddWithValue("@BType", BloodType)
                        cmd.Parameters.AddWithValue("@BUnits", BloodUnits)
                        cmd.Parameters.AddWithValue("@Email", Email)
                        Dim rs As SqlDataReader = cmd.ExecuteReader()
                        rs.Read()
                        Dim bytes As Byte()
                        bytes = rs(0)
                        rs.Close()
                        cmd.Dispose()

                        Dim cmd3 As New SqlCommand("Insert Into " + S + "D(HospitalName,DoctorName,ContactNo,Landline,Address,PatientName,PatientAge,BloodGroup,BloodType,BloodUnits,Report,PatientRelName,Email,PatientContact,Status,DateTime) values(@HName,@DName,@CNo,@LadLine,@Addr,@PatNm,@PatAge,@BGroup,@BType,@BUnits,@Report,@PatRelName,@Email,@PatContact,@Status,@DateTime)", con)

                        cmd3.Parameters.AddWithValue("@HName", HospName)
                        cmd3.Parameters.AddWithValue("@DName", DoctName)
                        cmd3.Parameters.AddWithValue("@CNo", ContactNo)
                        cmd3.Parameters.AddWithValue("@LadLine", Landline)
                        cmd3.Parameters.AddWithValue("@Addr", Address)
                        cmd3.Parameters.AddWithValue("@PatNm", PatientName)
                        cmd3.Parameters.AddWithValue("@PatAge", PatientAge)
                        cmd3.Parameters.AddWithValue("@BGroup", BloodGroup)
                        cmd3.Parameters.AddWithValue("@BType", BloodType)
                        cmd3.Parameters.AddWithValue("@BUnits", BloodUnits)
                        cmd3.Parameters.AddWithValue("@Report", bytes)
                        cmd3.Parameters.AddWithValue("@PatRelName", PatientRelName)
                        cmd3.Parameters.AddWithValue("@Email", Email)
                        cmd3.Parameters.AddWithValue("@PatContact", PatientContact)
                        cmd3.Parameters.AddWithValue("@Status", "Time Out!")
                        cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                        cmd3.ExecuteNonQuery()
                        cmd3.Dispose()

                        Dim cmd2 As New SqlCommand("Select Unicode from Hospital where Hospital_Name=@HospNm and Doctor_Name=@DocName and Contact_No=@Contact", con)
                        cmd2.Parameters.AddWithValue("@HospNm", HospName)
                        cmd2.Parameters.AddWithValue("@DocName", DoctName)
                        cmd2.Parameters.AddWithValue("@Contact", ContactNo)

                        Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
                        rdr2.Read()
                        Dim Unicode As String = rdr2(0).ToString
                        rdr2.Close()
                        cmd2.Dispose()

                        Dim UpdateCmd As New SqlCommand("Update " + Unicode + "A set Status='Time Out!', Unicode=@Uni where PatientName=@PatName and PatientAge=@PatAge and BloodGroup=@BGroup and BloodType=@BType and BloodUnits=@BUnits and Email=@Email", con)
                        UpdateCmd.Parameters.AddWithValue("@Uni", S)
                        UpdateCmd.Parameters.AddWithValue("@PatName", PatientName)
                        UpdateCmd.Parameters.AddWithValue("@PatAge", PatientAge)
                        UpdateCmd.Parameters.AddWithValue("@BGroup", BloodGroup)
                        UpdateCmd.Parameters.AddWithValue("@BType", BloodType)
                        UpdateCmd.Parameters.AddWithValue("@BUnits", BloodUnits)
                        UpdateCmd.Parameters.AddWithValue("@Email", Email)
                        UpdateCmd.ExecuteNonQuery()
                        UpdateCmd.Dispose()

                        Dim DeleteCmd As New SqlCommand("Delete from " + S + "C where Id=@id", con)
                        DeleteCmd.Parameters.AddWithValue("@id", Id)
                        DeleteCmd.ExecuteNonQuery()

                    Catch ex As Exception
                        MsgBox(ex.ToString)
                    Finally
                        con.Close()
                    End Try

                End If
            End If
        End If
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Try


            Dim Id2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
            Dim HospName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemHospitalName")
            Dim DoctName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemDoctor")

            Dim ContactNo2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemContact")
            Dim Landline2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemLandline")
            Dim Address2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemAddress")
            Dim PatientName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatientName")
            Dim PatientAge2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemAge")
            Dim BloodGroup2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodGroup")
            Dim BloodType2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodType")
            Dim BloodUnits2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodUnits")
            Dim Email2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemEmail")
            Dim PatientRelName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemRelName")
            Dim PatientContact2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatContact")

            Dim Id As Integer = Id2.Text
            Dim HospName As String = HospName2.Text
            Dim DoctName As String = DoctName2.Text
            Dim ContactNo As String = ContactNo2.Text
            Dim Landline As String = Landline2.Text

            Dim Address As String = Address2.Text
            Dim PatientName As String = PatientName2.Text
            Dim PatientAge As String = PatientAge2.Text
            Dim BloodGroup As String = BloodGroup2.Text
            Dim BloodType As String = BloodType2.Text
            Dim BloodUnits As String = BloodUnits2.Text
            Dim Email As String = Email2.Text
            Dim PatientRelName As String = PatientRelName2.Text
            Dim PatientContact As String = PatientContact2.Text

            con.Open()

            Dim cmd As New SqlCommand("Select Report from [" + S + "C] where [HospitalName]=@HospitalNm and [DoctorName]=@DoctorNm and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@BGroup and [BloodType]=@BType and [BloodUnits]=@BUnits and [Email]=@Email", con)
            cmd.Parameters.AddWithValue("@HospitalNm", HospName)
            cmd.Parameters.AddWithValue("@DoctorNm", DoctName)
            cmd.Parameters.AddWithValue("@PatName", PatientName)
            cmd.Parameters.AddWithValue("@PatAge", PatientAge)
            cmd.Parameters.AddWithValue("@BGroup", BloodGroup)
            cmd.Parameters.AddWithValue("@BType", BloodType)
            cmd.Parameters.AddWithValue("@BUnits", BloodUnits)
            cmd.Parameters.AddWithValue("@Email", Email)
            Dim rs As SqlDataReader = cmd.ExecuteReader()
            rs.Read()
            Dim bytes As Byte()
            bytes = rs(0)
            rs.Close()
            cmd.Dispose()

            Dim cmd3 As New SqlCommand("Insert Into " + S + "D(HospitalName,DoctorName,ContactNo,Landline,Address,PatientName,PatientAge,BloodGroup,BloodType,BloodUnits,Report,PatientRelName,Email,PatientContact,Status,DateTime) values(@HName,@DName,@CNo,@LadLine,@Addr,@PatNm,@PatAge,@BGroup,@BType,@BUnits,@Report,@PatRelName,@Email,@PatContact,@Status,@DateTime)", con)

            cmd3.Parameters.AddWithValue("@HName", HospName)
            cmd3.Parameters.AddWithValue("@DName", DoctName)
            cmd3.Parameters.AddWithValue("@CNo", ContactNo)
            cmd3.Parameters.AddWithValue("@LadLine", Landline)
            cmd3.Parameters.AddWithValue("@Addr", Address)
            cmd3.Parameters.AddWithValue("@PatNm", PatientName)
            cmd3.Parameters.AddWithValue("@PatAge", PatientAge)
            cmd3.Parameters.AddWithValue("@BGroup", BloodGroup)
            cmd3.Parameters.AddWithValue("@BType", BloodType)
            cmd3.Parameters.AddWithValue("@BUnits", BloodUnits)
            cmd3.Parameters.AddWithValue("@Report", bytes)
            cmd3.Parameters.AddWithValue("@PatRelName", PatientRelName)
            cmd3.Parameters.AddWithValue("@Email", Email)
            cmd3.Parameters.AddWithValue("@PatContact", PatientContact)
            cmd3.Parameters.AddWithValue("@Status", "Accepted")
            cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
            cmd3.ExecuteNonQuery()
            cmd3.Dispose()

            Dim cmd2 As New SqlCommand("Select Unicode from Hospital where Hospital_Name=@HospNm and Doctor_Name=@DocName and Contact_No=@Contact", con)
            cmd2.Parameters.AddWithValue("@HospNm", HospName)
            cmd2.Parameters.AddWithValue("@DocName", DoctName)
            cmd2.Parameters.AddWithValue("@Contact", ContactNo)

            Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
            rdr2.Read()
            Dim Unicode As String = rdr2(0).ToString
            rdr2.Close()
            cmd2.Dispose()



            Dim UpdateCmd As New SqlCommand("Update " + Unicode + "A set Status='Accepted',Unicode=@Uni where PatientName=@PatName and PatientAge=@PatAge and BloodGroup=@BGroup and BloodType=@BType and BloodUnits=@BUnits and Email=@Email", con)
            UpdateCmd.Parameters.AddWithValue("@Uni", S)
            UpdateCmd.Parameters.AddWithValue("@PatName", PatientName)
            UpdateCmd.Parameters.AddWithValue("@PatAge", PatientAge)
            UpdateCmd.Parameters.AddWithValue("@BGroup", BloodGroup)
            UpdateCmd.Parameters.AddWithValue("@BType", BloodType)
            UpdateCmd.Parameters.AddWithValue("@BUnits", BloodUnits)
            UpdateCmd.Parameters.AddWithValue("@Email", Email)
            UpdateCmd.ExecuteNonQuery()
            UpdateCmd.Dispose()

            Dim DeleteCmd As New SqlCommand("Delete from " + S + "C where Id=@id", con)
            DeleteCmd.Parameters.AddWithValue("@id", Id)
            DeleteCmd.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            con.Close()
        End Try
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try


            Dim Id2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemId")
            Dim HospName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemHospitalName")
            Dim DoctName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemDoctor")

            Dim ContactNo2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemContact")
            Dim Landline2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemLandline")
            Dim Address2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemAddress")
            Dim PatientName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatientName")
            Dim PatientAge2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemAge")
            Dim BloodGroup2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodGroup")
            Dim BloodType2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodType")
            Dim BloodUnits2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemBloodUnits")
            Dim Email2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemEmail")
            Dim PatientRelName2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemRelName")
            Dim PatientContact2 As Label = GridView1.Rows(e.RowIndex).FindControl("ItemPatContact")

            Dim Id As Integer = Id2.Text
            Dim HospName As String = HospName2.Text
            Dim DoctName As String = DoctName2.Text
            Dim ContactNo As String = ContactNo2.Text
            Dim Landline As String = Landline2.Text

            Dim Address As String = Address2.Text
            Dim PatientName As String = PatientName2.Text
            Dim PatientAge As String = PatientAge2.Text
            Dim BloodGroup As String = BloodGroup2.Text
            Dim BloodType As String = BloodType2.Text
            Dim BloodUnits As String = BloodUnits2.Text
            Dim Email As String = Email2.Text
            Dim PatientRelName As String = PatientRelName2.Text
            Dim PatientContact As String = PatientContact2.Text

            con.Open()

            Dim cmd As New SqlCommand("Select Report from [" + S + "C] where [HospitalName]=@HospitalNm and [DoctorName]=@DoctorNm and [PatientName]=@PatName and [PatientAge]=@PatAge and [BloodGroup]=@BGroup and [BloodType]=@BType and [BloodUnits]=@BUnits and [Email]=@Email", con)
            cmd.Parameters.AddWithValue("@HospitalNm", HospName)
            cmd.Parameters.AddWithValue("@DoctorNm", DoctName)
            cmd.Parameters.AddWithValue("@PatName", PatientName)
            cmd.Parameters.AddWithValue("@PatAge", PatientAge)
            cmd.Parameters.AddWithValue("@BGroup", BloodGroup)
            cmd.Parameters.AddWithValue("@BType", BloodType)
            cmd.Parameters.AddWithValue("@BUnits", BloodUnits)
            cmd.Parameters.AddWithValue("@Email", Email)
            Dim rs As SqlDataReader = cmd.ExecuteReader()
            rs.Read()
            Dim bytes As Byte()
            bytes = rs(0)
            rs.Close()
            cmd.Dispose()

            Dim cmd3 As New SqlCommand("Insert Into " + S + "D(HospitalName,DoctorName,ContactNo,Landline,Address,PatientName,PatientAge,BloodGroup,BloodType,BloodUnits,Report,PatientRelName,Email,PatientContact,Status,DateTime) values(@HName,@DName,@CNo,@LadLine,@Addr,@PatNm,@PatAge,@BGroup,@BType,@BUnits,@Report,@PatRelName,@Email,@PatContact,@Status,@DateTime)", con)

            cmd3.Parameters.AddWithValue("@HName", HospName)
            cmd3.Parameters.AddWithValue("@DName", DoctName)
            cmd3.Parameters.AddWithValue("@CNo", ContactNo)
            cmd3.Parameters.AddWithValue("@LadLine", Landline)
            cmd3.Parameters.AddWithValue("@Addr", Address)
            cmd3.Parameters.AddWithValue("@PatNm", PatientName)
            cmd3.Parameters.AddWithValue("@PatAge", PatientAge)
            cmd3.Parameters.AddWithValue("@BGroup", BloodGroup)
            cmd3.Parameters.AddWithValue("@BType", BloodType)
            cmd3.Parameters.AddWithValue("@BUnits", BloodUnits)
            cmd3.Parameters.AddWithValue("@Report", bytes)
            cmd3.Parameters.AddWithValue("@PatRelName", PatientRelName)
            cmd3.Parameters.AddWithValue("@Email", Email)
            cmd3.Parameters.AddWithValue("@PatContact", PatientContact)
            cmd3.Parameters.AddWithValue("@Status", "Declined")
            cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
            cmd3.ExecuteNonQuery()
            cmd3.Dispose()

            Dim cmd2 As New SqlCommand("Select Unicode from Hospital where Hospital_Name=@HospNm and Doctor_Name=@DocName and Contact_No=@Contact", con)
            cmd2.Parameters.AddWithValue("@HospNm", HospName)
            cmd2.Parameters.AddWithValue("@DocName", DoctName)
            cmd2.Parameters.AddWithValue("@Contact", ContactNo)

            Dim rdr2 As SqlDataReader = cmd2.ExecuteReader
            rdr2.Read()
            Dim Unicode As String = rdr2(0).ToString
            rdr2.Close()
            cmd2.Dispose()

            Dim UpdateCmd As New SqlCommand("Update " + Unicode + "A set Status='Declined', Unicode=@Uni where PatientName=@PatName and PatientAge=@PatAge and BloodGroup=@BGroup and BloodType=@BType and BloodUnits=@BUnits and Email=@Email", con)
            UpdateCmd.Parameters.AddWithValue("@Uni", S)
            UpdateCmd.Parameters.AddWithValue("@PatName", PatientName)
            UpdateCmd.Parameters.AddWithValue("@PatAge", PatientAge)
            UpdateCmd.Parameters.AddWithValue("@BGroup", BloodGroup)
            UpdateCmd.Parameters.AddWithValue("@BType", BloodType)
            UpdateCmd.Parameters.AddWithValue("@BUnits", BloodUnits)
            UpdateCmd.Parameters.AddWithValue("@Email", Email)
            UpdateCmd.ExecuteNonQuery()
            UpdateCmd.Dispose()

            Dim DeleteCmd As New SqlCommand("Delete from " + S + "C where Id=@id", con)
            DeleteCmd.Parameters.AddWithValue("@id", Id)
            DeleteCmd.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            con.Close()
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
End Class
