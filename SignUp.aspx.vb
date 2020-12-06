Imports System.Data.SqlClient
Imports System.data
Imports System.Net
Imports System.Net.Mail
Imports System.Threading.Thread
Partial Class SignIn
    Inherits System.Web.UI.Page
    Private con As SqlConnection
    Public Shared otp As String = String.Empty
    Public Shared timer, timer_arr(3) As String
    Public Shared seconds As Double
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
        If Not Page.IsPostBack Then
            Timer1.Enabled = False
        End If
    End Sub

    Public Shared Function CheckPhoneNumber(ByVal PhoneNumber As String) As Boolean
        Dim MatchPhoneNumberPattern As String = "[0-9]{10}"
        If PhoneNumber IsNot Nothing Then
            Return Regex.IsMatch(PhoneNumber, MatchPhoneNumberPattern)
        Else
            Return False
        End If
    End Function
    Public Shared Function CheckEmail(ByVal email As String) As Boolean
        Dim MatchEmailPattern As String = "\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        If email IsNot Nothing Then
            Return Regex.IsMatch(email, MatchEmailPattern)
        Else
            Return False
        End If
    End Function

    Public Shared Function CheckPassword(ByVal password As String) As Boolean
        Dim MatchPasswordPattern As String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"
        If password IsNot Nothing Then
            Return Regex.IsMatch(password, MatchPasswordPattern)
        Else
            Return False
        End If
    End Function
    Protected Sub Btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnsubmit.Click
        Dim Unicode As String = TxtUnicode.Text
        Dim occ As String = DdlOccupation.SelectedItem().ToString
        Dim email As String = (txtEmailId.Text).Trim
        Dim pass As String = txtPassword.Text
        Dim cpass As String = txtConfirmpassword.Text
        Dim username As String = txtUsername.Text


        If (DdlOccupation.SelectedIndex() > 0) Then
            If CheckEmail(email) Then
                If CheckPhoneNumber(txtContact.Text.Trim) Then
                    If CheckPhoneNumber(Txtland.text.trim) Or Txtland.text.trim = "" Then

                        If CheckPassword(txtPassword.Text) Then

                            Try
                                Dim sql1 As String = "Select Unicode,Reg_or_Not from BloodBank where Unicode=@unicode"
                                Dim sql2 As String = "Select Unicode,Reg_or_Not from Hospital where Unicode=@unicode"
                                Dim sql3 As String = "Select Username from BloodBank where Username= @username"
                                Dim sql4 As String = "Select Username from Hospital where Username= @username"
                                Dim con1 As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                                con1.Open()

                                If (occ.Equals("Blood Bank")) Then



                                    Dim cmd1 As New SqlCommand(sql1, con1)
                                    cmd1.Parameters.AddWithValue("@unicode", Unicode)
                                    Dim rd As SqlDataReader = cmd1.ExecuteReader

                                    If rd.Read Then
                                        Dim reg As Integer = rd.GetInt32(1)
                                        If reg = 0 Then
                                            rd.Close()

                                            Dim cmd2 As New SqlCommand(sql3, con1)
                                            cmd2.Parameters.AddWithValue("@username", username)

                                            Dim rd2 As SqlDataReader = cmd2.ExecuteReader
                                            If (rd2.Read) Then
                                                alert("alert('UserName already exists')")
                                            Else
                                                If (pass.Equals(cpass)) Then
                                                    Dim numbers As String = "1234567890"
                                                    Dim characters As String = numbers
                                                    otp = String.Empty

                                                    Dim length As Integer = 5

                                                    For i As Integer = 0 To length - 1
                                                        Dim character As String = String.Empty
                                                        Do
                                                            Dim index As Integer = New Random().Next(0, characters.Length)
                                                            character = characters.ToCharArray()(index).ToString()
                                                        Loop While otp.IndexOf(character) <> -1
                                                        otp += character
                                                    Next
                                                    'code for sending OTP
                                                    Dim emailto As String = email
                                                    Dim subject As String = "Sending an otp for confirmation"
                                                    Dim email_body As String = "Hi ! This is DARTH you have requested for an OTP. Your requested OTP is " + otp + " ."
                                                    Dim email_from As String = "aniruddha.babar273@gmail.com"
                                                    Dim email_password As String = "aniruddha@273"
                                                    Dim mm As New MailMessage(email_from, emailto, subject, email_body)
                                                    mm.IsBodyHtml = True

                                                    Dim nc As New NetworkCredential(email_from, email_password)
                                                    Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                                                    smtp.UseDefaultCredentials = True
                                                    smtp.EnableSsl = True
                                                    smtp.Credentials = nc
                                                    smtp.Send(mm)

                                                    OtpLabel.Visible = True
                                                    TxtOTP.Visible = True
                                                    RegisterBtn.Visible = True
                                                    Btnsubmit.Visible = False
                                                    ResendBtn.Visible = True
                                                    OtpLabel.Visible = True
                                                    ResendBtn.Visible = True
                                                    Slash.Visible = True
                                                    HomeBtn2.Visible = True
                                                    HomeBtn.Visible = False
                                                    Label1.Visible = True
                                                    Label2.Visible = True

                                                    Timer1.Enabled = True
                                                Else
                                                    alert("alert('Password and confirm password must be same.')")

                                                End If
                                            End If
                                        Else
                                            alert("alert('you have already registered')")
                                        End If
                                    Else
                                        alert("alert('Invalid Unicode...')")
                                    End If

                                Else
                                    If (occ.Equals("Hospital")) Then



                                        Dim cmd1 As New SqlCommand(sql2, con1)
                                        cmd1.Parameters.AddWithValue("@Unicode", Unicode)
                                        Dim rd As SqlDataReader = cmd1.ExecuteReader
                                        If rd.Read Then
                                            Dim reg As Integer = rd.GetInt32(1)
                                            If reg = 0 Then
                                                rd.Close()

                                                Dim cmd3 As New SqlCommand(sql4, con1)
                                                cmd3.Parameters.AddWithValue("@username", username)

                                                Dim rd3 As SqlDataReader = cmd3.ExecuteReader


                                                If (rd3.Read) Then
                                                    alert("alert('UserName already exists')")
                                                Else
                                                    If (pass.Equals(cpass)) Then
                                                        Dim numbers As String = "1234567890"
                                                        Dim characters As String = numbers
                                                        otp = String.Empty

                                                        Dim length As Integer = 5

                                                        For i As Integer = 0 To length - 1
                                                            Dim character As String = String.Empty
                                                            Do
                                                                Dim index As Integer = New Random().Next(0, characters.Length)
                                                                character = characters.ToCharArray()(index).ToString()
                                                            Loop While otp.IndexOf(character) <> -1
                                                            otp += character
                                                        Next
                                                        'code for sending OTP
                                                        Dim emailto As String = email

                                                        Dim subject As String = "Sending an otp for confirmation"
                                                        Dim email_body As String = "Hi ! This is DARTH you have requested for an OTP. Your requested OTP is " + otp + " ."
                                                        Dim email_from As String = "aniruddha.babar273@gmail.com"
                                                        Dim email_password As String = "aniruddha@273"
                                                        Dim mm As New MailMessage(email_from, emailto, subject, email_body)
                                                        mm.IsBodyHtml = True

                                                        Dim nc As New NetworkCredential(email_from, email_password)
                                                        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                                                        smtp.UseDefaultCredentials = True
                                                        smtp.EnableSsl = True
                                                        smtp.Credentials = nc
                                                        smtp.Send(mm)


                                                        OtpLabel.Visible = True
                                                        TxtOTP.Visible = True
                                                        RegisterBtn.Visible = True
                                                        Btnsubmit.Visible = False
                                                        ResendBtn.Visible = True

                                                        ResendBtn.Visible = True
                                                        Slash.Visible = True
                                                        HomeBtn2.Visible = True
                                                        HomeBtn.Visible = False

                                                        't.Enabled = True
                                                        Timer1.Enabled = True
                                                        OtpLabel.Visible = True
                                                        Label1.Visible = True
                                                        Label2.Visible = True
                                                    Else
                                                        alert("alert('Password and confirm password must be same.')")
                                                    End If
                                                End If

                                            Else
                                                alert("alert('you are already registered')")
                                            End If
                                        Else
                                            alert("alert('Invalid Unicode...')")
                                        End If
                                    End If
                                End If
                            Catch ex As Exception
                                MsgBox(ex.Message())
                            End Try
                        Else
                            alert("alert('Password must contain one uppercase letter,one lowercase letter,one number ,one special character')")
                        End If
                    Else
                        alert("alert('Please Enter valid Landline number.')")
                    End If

                Else
                    alert("alert('Please Enter valid Mobile number.')")
                End If
            Else
                alert("alert('Please Enter Valid Email')")
            End If
        Else
            alert("alert('Please Select Occupation')")
        End If
    End Sub

    Public Sub alert(ByVal s As String)
        ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", s, True)
    End Sub

    Protected Sub ResendBtn_Click(sender As Object, e As EventArgs) Handles ResendBtn.Click
        OtpLabel.Text = "60"
        Label1.Visible = True
        Label2.Visible = True
        Timer1.Enabled = True
        Dim numbers As String = "1234567890"
        Dim characters As String = numbers
        otp = String.Empty
        Dim email As String = (txtEmailId.Text).Trim
        Dim length As Integer = 5

        For i As Integer = 0 To length - 1
            Dim character As String = String.Empty
            Do
                Dim index As Integer = New Random().Next(0, characters.Length)
                character = characters.ToCharArray()(index).ToString()
            Loop While otp.IndexOf(character) <> -1
            otp += character
        Next

        'code for sending OTP
        Dim emailto As String = email
        Dim subject As String = "Sending an otp for confirmation"
        Dim email_body As String = "Hi ! This is DARTH you have requested for an OTP. Your requested OTP is " + otp + " ."
        Dim email_from As String = "aniruddha.babar273@gmail.com"
        Dim email_password As String = "aniruddha@273"
        Dim mm As New MailMessage(email_from, emailto, subject, email_body)
        mm.IsBodyHtml = True

        Dim nc As New NetworkCredential(email_from, email_password)
        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.UseDefaultCredentials = True
        smtp.EnableSsl = True
        smtp.Credentials = nc
        smtp.Send(mm)
    End Sub
    Protected Sub RegisterBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegisterBtn.Click
        Dim unicode As String = TxtUnicode.Text
        Dim username As String = txtUsername.Text
        Dim Email As String = (txtEmailId.Text).Trim
        Dim Contac As Double = CDbl(txtContact.Text)
        Dim Landline As String = Txtland.Text
        Dim Password As String = txtPassword.Text
        Dim occ As String = DdlOccupation.SelectedItem().ToString
        Dim o As String = TxtOTP.Text.Trim

        Try
            If (o.Equals(otp)) Then
                Timer1.Enabled = False
                If (occ.Equals("Blood Bank")) Then
                    Dim sql As String = "update BloodBank set Username=@username,Email=@email,Contact_No=@contact,Landline=@landline,Password=@password,Reg_or_Not=@reg,DateTime=@DateTime where Unicode=@unicode"
                    Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                    con.Open()
                    Dim cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@unicode", unicode)
                    cmd.Parameters.AddWithValue("@username", username)
                    cmd.Parameters.AddWithValue("@email", Email)
                    cmd.Parameters.AddWithValue("@contact", Contac)
                    cmd.Parameters.AddWithValue("@landline", Landline)
                    cmd.Parameters.AddWithValue("@password", Password)
                    cmd.Parameters.AddWithValue("@reg", 1)
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                    Dim n As Integer = cmd.ExecuteNonQuery()
                    If n = 1 Then

                        Dim selectCmd As New SqlCommand("Select BloodBank_Name,BloodBank_Type,Address,City,State,Pin_Code,Email,Contact_No,Landline from BloodBank where Unicode= @unicode", con)
                            selectCmd.Parameters.AddWithValue("@unicode", unicode)
                            Dim rdr As SqlDataReader = selectCmd.ExecuteReader
                            rdr.Read()
                            Dim BName As String = rdr(0)
                            Dim Btype As String = rdr(1)
                            Dim Addr As String = rdr(2)
                            Dim City As String = rdr(3)
                            Dim State As String = rdr(4)
                            Dim Pin_Code As Decimal = rdr(5)
                            Dim EmailId As String = rdr(6)
                            Dim contact As Decimal = rdr(7)
                            Dim land As Decimal = rdr(8)
                            rdr.Close()
                            selectCmd.Dispose()

                            Dim InsertCommand As New SqlCommand("Insert into BloodAvailable(Unicode,BloodBank_Name,BloodBank_Type,Address,City,State,Pin_Code,Email,Contact_No,Landline) values(@Unicode,@BloodBank_Name,@BloodBank_Type,@Address,@City,@State,@Pin_Code,@Email,@Contact_No,@Landline)", con)
                            InsertCommand.Parameters.AddWithValue("@Unicode", unicode)
                            InsertCommand.Parameters.AddWithValue("@BloodBank_Name", BName)
                            InsertCommand.Parameters.AddWithValue("@BloodBank_Type", Btype)
                            InsertCommand.Parameters.AddWithValue("@Address", Addr)
                            InsertCommand.Parameters.AddWithValue("@City", City)
                            InsertCommand.Parameters.AddWithValue("@State", State)
                            InsertCommand.Parameters.AddWithValue("@Pin_Code", Pin_Code)
                            InsertCommand.Parameters.AddWithValue("@Email", EmailId)
                            InsertCommand.Parameters.AddWithValue("@Contact_No", contact)
                            InsertCommand.Parameters.AddWithValue("@Landline", land)
                            InsertCommand.ExecuteNonQuery()
                            InsertCommand.Dispose()



                        Dim createTable As String = "Create Table " + unicode + " (ID int IDENTITY ,BloodName Varchar(20),BloodType Varchar(30),BloodInMl decimal(6,0) Null,DateofEnrolment Varchar(20),DateofExpiry Varchar(20),Description Varchar(200),DateTime date)"
                        Dim createTable2 As String = "CREATE TABLE [dbo].[" & unicode & "A](ID int IDENTITY,BloodName VARCHAR(20) NULL,Quantity INT DEFAULT 0)"
                        Dim createTable3 As String = "CREATE TABLE [dbo].[" & unicode & "B]([ID] INT  IDENTITY NOT NULL,[BloodName]       VARCHAR (20)  NULL,[BloodType]       VARCHAR (30)  NULL,[BloodInMl]       DECIMAL (6)   NULL,[DateofEnrolment] VARCHAR (20)  NULL,[DateofExpiry]    VARCHAR (20)  NULL,[Description]  VARCHAR (200) NULL,[DateTime] VARCHAR (30)  NULL);"
                        Dim createTable4 As String = "CREATE TABLE [dbo].[" & unicode & "C] ( [Id]             INT             IDENTITY (1, 1) NOT NULL,[HospitalName]   VARCHAR (60)    NOT NULL, [DoctorName]    VARCHAR (40)    NOT NULL,[ContactNo]  DECIMAL (12)    NOT NULL,[Landline] DECIMAL (12)    NULL,[Address] VARCHAR (100)   NOT NULL,[PatientName] VARCHAR (40)    NOT NULL,[PatientAge] VARCHAR (20)    NOT NULL,[BloodGroup]  VARCHAR (10) NOT NULL,[BloodType]      VARCHAR (20)    NOT NULL,[BloodUnits]   VARCHAR (20)    NOT NULL,[Report]         VARBINARY (MAX) NOT NULL,[PatientRelName] VARCHAR (40)    NOT NULL,[Email]          VARCHAR (50)    NULL,[PatientContact] DECIMAL (12)    NULL,[Status] VARCHAR (20)    NULL,[DateTime]   VARCHAR (30)    NOT NULL, [DeleteRequestTime] VARCHAR (30)    NULL,PRIMARY KEY CLUSTERED ([Id] ASC));"
                        Dim createTable5 As String = "CREATE TABLE [dbo].[" & unicode & "D] ([Id]             INT             IDENTITY (1, 1) NOT NULL,[HospitalName]   VARCHAR (60)    NOT NULL,[DoctorName]     VARCHAR (40)    NOT NULL,[ContactNo]      DECIMAL (12)    NOT NULL, [Landline]       DECIMAL (12)    NULL,[Address]        VARCHAR (100)   NOT NULL,[PatientName]    VARCHAR (40)    NOT NULL,[PatientAge]     VARCHAR (20)    NOT NULL,[BloodGroup]     VARCHAR (10)    NOT NULL,[BloodType]      VARCHAR (20)    NOT NULL,[BloodUnits]     VARCHAR (20)    NOT NULL,[Report]         VARBINARY (MAX) NOT NULL,[PatientRelName] VARCHAR (40)    NOT NULL,[Email]          VARCHAR (50)    NULL,[PatientContact] DECIMAL (12)    NULL,[Status]         VARCHAR (20)    NULL,[DateTime]       VARCHAR (30)    NOT NULL,PRIMARY KEY CLUSTERED ([Id] ASC));"
                        Dim cmd2 As New SqlCommand(createTable, con)
                        Dim cmd3 As New SqlCommand(createTable2, con)
                        Dim cmd4 As New SqlCommand(createTable3, con)
                        Dim cmd5 As New SqlCommand(createTable4, con)
                        Dim cmd6 As New SqlCommand(createTable5, con)
                        cmd2.ExecuteNonQuery()
                        cmd3.ExecuteNonQuery()
                        cmd4.ExecuteNonQuery()
                        cmd5.ExecuteNonQuery()
                        cmd6.ExecuteNonQuery()

                        'Inserting values into unicode+A database
                        Dim insert1 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('A+')", con)
                        Dim insert2 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('A-')", con)
                        Dim insert3 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('B+')", con)
                        Dim insert4 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('B-')", con)
                        Dim insert5 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('AB+')", con)
                        Dim insert6 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('AB-')", con)
                        Dim insert7 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('O+')", con)
                        Dim insert8 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('O-')", con)
                        Dim insert9 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('Bombay+')", con)
                        Dim insert10 As New SqlCommand("Insert into " + unicode + "A(BloodName) values('Bombay-')", con)
                        insert1.ExecuteNonQuery()
                        insert2.ExecuteNonQuery()
                        insert3.ExecuteNonQuery()
                        insert4.ExecuteNonQuery()
                        insert5.ExecuteNonQuery()
                        insert6.ExecuteNonQuery()
                        insert7.ExecuteNonQuery()
                        insert8.ExecuteNonQuery()
                        insert9.ExecuteNonQuery()
                        insert10.ExecuteNonQuery()

                        alert("alert('Registration Successful !..')")
                        cmd2.Dispose()
                        cmd3.Dispose()
                        insert1.Dispose()
                        insert2.Dispose()
                        insert3.Dispose()
                        insert4.Dispose()
                        insert5.Dispose()

                        insert6.Dispose()
                        insert7.Dispose()
                        insert8.Dispose()
                        insert9.Dispose()
                        insert10.Dispose()
                        TxtUnicode.Text = String.Empty
                        txtUsername.Text = String.Empty
                        txtEmailId.Text = String.Empty
                        txtContact.Text = String.Empty
                        Txtland.Text = String.Empty
                        txtPassword.Text = String.Empty
                        txtConfirmpassword.Text = String.Empty
                        DdlOccupation.SelectedValue = "-1"
                        TxtOTP.Text = String.Empty

                        OtpLabel.Visible = False
                        TxtOTP.Visible = False
                        RegisterBtn.Visible = False
                        Btnsubmit.Visible = True
                        ResendBtn.Visible = False
                        Label1.Visible = False
                        Label2.Visible = False
                        Slash.Visible = False
                        HomeBtn2.Visible = False
                        HomeBtn.Visible = True


                    End If
                    cmd.Dispose()
                    con.Dispose()
                    con.Close()
                Else
                    Dim sql As String = "update Hospital set Username=@username,Email=@email,Contact_No=@contact,Landline=@landline,Password=@password,Reg_or_Not=@reg,DateTime=@DateTime where Unicode=@unicode"
                    Dim con As New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False")
                    con.Open()
                    Dim cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@unicode", unicode)
                    cmd.Parameters.AddWithValue("@username", username)
                    cmd.Parameters.AddWithValue("@email", Email)
                    cmd.Parameters.AddWithValue("@contact", Contac)
                    cmd.Parameters.AddWithValue("@landline", Landline)
                    cmd.Parameters.AddWithValue("@password", Password)
                    cmd.Parameters.AddWithValue("@reg", 1)
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString)
                    Dim n As Integer = cmd.ExecuteNonQuery()
                    If n = 1 Then
                        Dim createTable As String = "Create Table " + unicode + " ([ID] INT IDENTITY NOT NULL,BloodBankName Varchar(50) not null,PatientName Varchar(30) not null,Gender Varchar(20) not null,Age int not null,BloodGroup Varchar(20) not null,BloodTypeRequired Varchar(20) not null,RelativeName Varchar(20) null,Address Varchar(40) not null,PhoneNo decimal(12,0) not null,Email Varchar(30) null,DateTime date)"
                        Dim createTable2 As String = "CREATE TABLE [dbo].[" + unicode + "A] ([Id] INT  IDENTITY  NOT NULL,[Unicode]        VARCHAR (10)    NULL,[BloodBankName]  VARCHAR (40)    NOT NULL,[PatientName]    VARCHAR (40)    NOT NULL,[PatientAge]     VARCHAR (20)    NOT NULL,[BloodGroup]     VARCHAR (10)    NOT NULL,[BloodType]      VARCHAR (20)    NOT NULL,[Report]         VARBINARY (MAX) NULL,[ReportType]     VARCHAR (100)   NULL,[BloodUnits]     VARCHAR (20)    NOT NULL,[PatientRelName] VARCHAR (30)    NULL,[Email]          VARCHAR (30)    NULL,[Contact]        DECIMAL (12)    NULL,[Address]        VARCHAR (100)   NULL,[Status]         VARCHAR (30)    NULL,[DateTime]       VARCHAR (25)    NULL,PRIMARY KEY CLUSTERED ([Id] ASC));"
                        Dim createTable3 As String = "CREATE TABLE [dbo].[" + unicode + "B] ([Id]  INT IDENTITY  NOT NULL,[BloodBankName]  VARCHAR (40)    NOT NULL,[PatientName]    VARCHAR (40)    NOT NULL,[PatientAge]     VARCHAR (20)    NOT NULL,[BloodGroup]     VARCHAR (10)    NOT NULL,[BloodType]      VARCHAR (20)    NOT NULL,[Report]         VARBINARY (MAX) NULL,[ReportType]     VARCHAR (100)   NULL,[BloodUnits]     VARCHAR (20)    NOT NULL,[PatientRelName] VARCHAR (30)    NULL,[Email]          VARCHAR (30)    NULL,[Contact]        DECIMAL (12)    NULL,[Address]        VARCHAR (100)   NULL, [Status]         VARCHAR (30)    NULL,[DateTime]       VARCHAR (25)    NULL,PRIMARY KEY CLUSTERED ([Id] ASC));"

                        Dim cmd2 As New SqlCommand(createTable, con)
                        Dim cmd3 As New SqlCommand(createTable2, con)
                        Dim cmd4 As New SqlCommand(createTable3, con)
                        cmd2.ExecuteNonQuery()
                        cmd3.ExecuteNonQuery()
                        cmd4.ExecuteNonQuery()


                        alert("alert('Registration Successful !..')")
                        cmd2.Dispose()
                        TxtUnicode.Text = String.Empty
                        txtUsername.Text = String.Empty
                        txtEmailId.Text = String.Empty
                        txtContact.Text = String.Empty
                        Txtland.Text = String.Empty
                        txtPassword.Text = String.Empty
                        txtConfirmpassword.Text = String.Empty

                        DdlOccupation.SelectedValue = "-1"
                        TxtOTP.Text = String.Empty

                        OtpLabel.Visible = False
                        TxtOTP.Visible = False
                        RegisterBtn.Visible = False
                        Btnsubmit.Visible = True
                        ResendBtn.Visible = False
                        Label1.Visible = False
                        Label2.Visible = False
                        Slash.Visible = False
                        HomeBtn2.Visible = False
                        HomeBtn.Visible = True
                    End If
                    cmd.Dispose()
                    con.Dispose()
                    con.Close()
                End If
            Else
                alert("alert('Please Enter Correct OTP.')")
                Timer1.Enabled = True
            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
            'alert("alert('OTP expired..Please try again...')")
        End Try
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick

        seconds = OtpLabel.Text
        If seconds > 0 Then

            seconds = seconds - 0.5
            OtpLabel.Text = seconds
        Else
            OtpLabel.Text = "Time out!"
            Label1.Visible = False
            Label2.Visible = False
            Timer1.Enabled = False

        End If

    End Sub

End Class
