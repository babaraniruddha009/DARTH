<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>www.DARTH.com
    </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 40%;
        }
    </style>
     
</head>

<body runat="server">
    <form runat="server" method="post">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <div class="banner" runat="server">
            <header runat="server">
                <div class="hat" runat="server">
                    <table>
                        <tr>
                            <td style="padding-top: 1%;">
                                <h1>
                                    <asp:Image ID="Image1" Height="45px" Width="45px" ImageUrl="~/Images/icons8-heart-with-pulse-filled-50.png" runat="server" />
                                    <span class="Title-color">DARTH</span>
                                </h1>
                            </td>
                            <td style="position: absolute; top: 20px; right: 7%; text-align: right">
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email :darthblood16@gmail.com"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </header>
            <div class="nav1" runat="server">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav m-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="Index.aspx"><b>Home</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link About" href="#AboutUs"><b>About</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DARTHHelp.aspx"><b>Help</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#Gallery"><b>Gallery</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="SignUp.aspx"><b>SignUp</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="HomeMaps.aspx"><b>Maps</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#ContactUs"><b>Contact</b></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <section class="feature_area" style="margin: 5%">
                <div>

                    <div class="row justify-content-end">
                        <div class="animated"  style="margin-right: 20%;margin-top: 50px;">
                            <h1 style="color: #4e4949"><b>WELCOME TO</b></h1>
                            <h2 style="color: #ff4181">DARTH</h2>
                            <h3 style="color: #4e4949">( The life saving project. )</h3>
                        </div>

                        <div class="col-lg-4">
                            <div class="single_feature">
                                <div class="desc">
                                    <asp:LinkButton ID="BloodBankLinkBtn" runat="server" Font-Size="X-Large">Blood Bank</asp:LinkButton>
                                    <p>
                                        Here you can login into the blood bank system and access your data only if your are registered.
                                    </p>
                                </div>
                            </div>
                            <div class="single_feature">
                                <div class="desc">
                                    <asp:LinkButton ID="HospitalLinkBtn" ForeColor="#33cc33" Font-Size="X-Large" runat="server">Hospital</asp:LinkButton>
                                    <p>
                                        Here you can login into the hospital system and send a request for blood only if your are registered.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <header id="ReportTag">
            <br />
            <br />
           <div style="width:100%;text-align:center">
                <h3 class="title_color">Upload Documents</h3>
           </div>
            <div style="width:30%;margin-left:35%;margin-right:35%">
                <hr />
            </div> 
            <div style="margin-top:30px;width:100%;">
                <table  style="margin-left:30%;margin-right:30%;width:40%" class="auto-style1">
                <tr >
                    <td >
                        <asp:TextBox runat="server" Width="100%" type="text" CssClass="form-control" ID="name" placeholder="Enter  BloodBank / Hospital  Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter BloodBank / Hospital Name'"></asp:TextBox>
                         
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label style="margin-top:15px;color:#495057">License File / jpg ,png*
                        <asp:FileUpload   ID="FileUploader1" onchange="ShowImagePreview(this);" runat="server" Width="240px"/>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="CategoryDrop" CssClass="form-control"  style="margin-top:5px;" Width="100%" runat="server">
                            <asp:ListItem Value="-1">Select Profession</asp:ListItem>
                            <asp:ListItem Value="1">Hospital</asp:ListItem>
                            <asp:ListItem Value="2">Blood Bank</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="CategoryType" CssClass="form-control"  style="margin-top:15px;" Width="100%" runat="server">
                            <asp:ListItem Value="-1">Select Type</asp:ListItem>
                            <asp:ListItem Value="1">Government</asp:ListItem>
                            <asp:ListItem Value="2">Private</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                       <asp:TextBox runat="server" style="margin-top:15px" type="text" class="form-control" ID="UploadMail" placeholder="Enter Email" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = 'Enter Email'"></asp:TextBox>
                   </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpression1" ControlToValidate="UploadMail"  ErrorMessage="⚠️" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>  
                    <td colspan="2">
                        <div style="padding-left:37%; padding-right: 37%">
                            <div class="search_course_wrap">
                                <div style="background-color:rgba(225,225,225,0.1)" class="form_box  d-flex justify-content-between w-100">
                                    <asp:Button runat="server" type="submit" Text="Upload" ID="UploadBtn" CssClass="btn search_course_btn"></asp:Button>
                                </div>
                            </div>
                        </div>

                    </td>
                    
                </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;color:grey">
                            <h6><p>Upload your documents here.If you want detail information about this process please click on <a href="DARTHHelp.aspx#Upload">Help</a>.</p></h6>
                        </td>
                    </tr>
            </table>
            </div>
           
        </header>
        <header runat="server">
            <div style="margin-left: 20px; margin-right: 20px">
                <br />
                <div class="section-top-border">
                    <div>
                        <div id="AboutUs" class="Panel">
                            <div style="width: 100%; text-align: center">
                                <h3 class="title_color">About Us</h3>
                            </div>
                            <div style="width: 30%; margin-left: 35%; margin-right: 35%">
                                <hr />
                            </div>
                            <br />
                            <p style="text-align: justify">
                                Hi ! this is DARTH .You know that the majority of death happened in our country is due to unavailability of blood at required location at the right time. So,our project coordinates and sinks data about blood availibility in bloodbanks located at different loations all over the country on a single platform. This will provide accurate data about the availability of blood from a nearest possible location. So, we are trying to connect Government, Hospital, Blood Bank and user as well as blood donor on a single platform. This is our website where patient can directly contact with the hospital rather than blood banks. Also, the innovation to our application is brought by the administration of Government to all this process. The main motive of our project is to provide centeral repository of information related to blood available in blood bank to Government So that whenever the war like conditions or some major accidents are arrises where the blood is needed then the government are capable to provides blood to victims. Also this our project will help to reduce the problem of blood availability. We design a website for hospital,bloodbanks and mobile application for user to see the nearest blood bank. Using the www.DARTH.com website doctors and bloodbanks are contact with each other and doctor also request for blood if available in nearest blood banks.
                            </p>
                        </div>
                    </div>
                </div>
               
            <br />
        </header>
        
            <br />

        <div id="ContactUs" runat="server" style="background-color: black; height: 250px; width: auto;">
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="copyright">
                                    <p style="color: white; margin-top: 7%; position: absolute; left: 10%;">
                                        Copyright © 2018 All rights reserved | This template is made with by <a href="AdminLog.aspx" style="color: #ff4181">DARTH</a>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="position: absolute; left: 27%; padding-top: 10%">
                                    <a href="www.facebook.com">
                                        <img src="Images/facebook.png" /></a>
                                    <a href="www.twitter.com">
                                        <img src="Images/twitter.png" /></a>
                                    <a href="www.whatsapp.com">
                                        <img src="Images/whatsapp.png" /></a>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td style="position: absolute; margin-top: 5px; right: 8%; text-align: right">
                       
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table runat="server">
                                    <tr>
                                        <td>
                                            <h3 style="color: white; text-align: center">Contact Us</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="TxtName" Width="200px" type="text" placeholder="Name"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="TxtEmail" type="text" Width="200px" placeholder="Email"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ToolTip="Invalid mobile number." ValidationExpression="^([0-9]{10})$" runat="server" ControlToValidate="TxtContact" ErrorMessage="⚠️"></asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" ID="TxtContact" type="text" Width="200px" placeholder="Contact"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="TxtMessage" type="text" Width="200px" TextMode="MultiLine" placeholder="Message( Optional )"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="SubmitBtn" runat="server" Width="200px" Text="Submit" BackColor="#FF4181" CssClass="offset-sm-0"></asp:Button></td>
                                    </tr>

                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </form>


    <script type="text/javascript" src="MywebQuery.min.js"></script>
    <script type="text/javascript" src="bootstrap.js"></script>
    <script type="text/javascript" src="lightbox.min.js"></script>
    <script type="text/javascript" src="JQuery.flexslider.js"></script>
    <script type="text/javascript" src="owl.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

 

</body>
</html>
