<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DARTHHelp.aspx.vb" Inherits="DARTHHelp" %>

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

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Page level plugin CSS-->

    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />
    <!-- Custom styles for this template-->

</head>

<body runat="server">
    <form runat="server" method="post">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <div runat="server">
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
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email : darthblood16@gmail.com"></asp:Label>
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
                                <a class="nav-link" href="Index.aspx#Gallery"><b>Gallery</b></a>
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

        </div>
        <div style="width: 100%;">
            <div id="wrapper" style="height: 221vh; width: 27%; background-color: rgba(225,225,225,0.6); float: left">
                <ul class="sidebar" style="list-style-type: none;">
                    <li style="padding-top: 20px">
                        <a class="nav-link" style="color: dimgrey;margin-left:20%;margin-right:20%">

                            <span><b>DARTH Help</b></span>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="#SignUp">
                            <i class="fas fa-fw fa-user-plus"></i>
                            <span>Facing SignUp related issue?</span>
                        </a>

                    </li>

                    <li>
                        <a class="nav-link" href="#log">
                            <i class="fas fa-fw fa-user-tag"></i>
                            <span>Login Problems?</span></a>

                    </li>
                    <li>
                        <a class="nav-link " href="#Upload">
                            <i class="fas fa-fw fa-file-alt"></i>
                            <span>Upload your documents?</span>
                        </a>

                    </li>



                </ul>


            </div>
            <div id="wrapper2" style="width: 100%;">
                <br />
                <div>
                    <h2 style="margin-left: 60%;margin-right:60%">HELP</h2>
                </div>
                <br />
                <div style="text-align: justify;">
                    <p style="margin-left: 29%; margin-right: 20px; white-space: normal">
                        Hey,
Welcome to DARTH. This seems that you are in some problem? While traversing to our website if you come across any of the circumstances, the HELP page will provide you all the required information you are in need of. This will make you to easily navigate through the website and gives its easy accessibility.
                    </p>
                    <br />
                </div>
                <div id="SignUp" style="margin-left: 29%; margin-right: 20px; white-space: normal">
                    <h3>Sign Up:</h3>
                    <br />
                    <p style="white-space: normal; text-align: justify">
                        The Sign up process is been done by you if you are a new user to our website.
     For accessing to the website you need to be register first. Major and the mandatory field required here is that you must provide the Unicode of the Bloodbank/Doctor. Fill all the necessary fields that is been mentioned here. The wrong value in any of the field will not allow you to sign up to the website. Follow the steps for successful sign up. 
                    </p>
                    <h5>If you’re having trouble in Sign Up:</h5>
                    <ul>
                        <li>Go to DARTH Home page.
                        </li>
                        <li>Click on “Sign Up” in navigation bar.
                        </li>
                        <li>Enter all the required details (“*” will mark to the type of the details).
                        </li>
                        <li>Click on “Submit”.
                        </li>
                        <li>This will send an OTP to your mentioned email for confirmation.
                        </li>
                        <li>Enter the valid OTP within specified duration.
                        </li>
                        <li>Click on “Register”.
                        </li>
                        <li>Message will be displayed if you are successfully Sign Up.
                        </li>
                    </ul>
                    <br />
                </div>

                <div id="log" style="margin-left: 29%; margin-right: 20px; white-space: normal">
                    <h3>Login:</h3>
                    <br />
                    <p style="white-space: normal; text-align: justify">
                        If you have successfully Sign up to the website, you can login to your account anytime you want to. You can login whenever you are accessing to the website. Fill all the necessary fields that is been mentioned on to the page. The wrong value in any of the field will not allow you to login to your account. Follow the steps for successful Login.
                    </p>
                    <h5>If you’re having trouble in Login:</h5>
                    <ul>
                        <li>Go to DARTH Home page.
                        </li>
                        <li>If you are login for a bloodbank click on the “Bloodbank” tab else click on the “Hospital” tab if you are a doctor.

                        </li>
                        <li>Enter the Username and its respective password.
                        </li>
                        <li>Click on “Login”.
                        </li>
                    </ul>
                    <br />

                </div>
                <div id="Upload" style="margin-left: 29%; margin-right: 20px; white-space: normal">
                    <h3>Upload Documents:</h3>
                    <br />

                    <p style="white-space: normal; text-align: justify">
                        You have to carry out the process of uploading the documents before you are sign up. This is necessary to verify you as a valid user and avoid the entry of unauthorized entities. For uploading the documents fill all the necessary fields that is been mentioned here. After uploading documents, your documents will bw verified by DARTH Administrator and send you an Unicode on your mention email. Once you have recieved that unicode then you can go through for the signup process, where you have to enter this unicode. Follow the steps for documents uploading.
                    </p>
                    <h5>If you’re having trouble in uploading the documents:</h5>
                    <ul>
                        <li>Go to DARTH Home page.
                        </li>
                        <li>Scroll down till “Upload Document” .
                        </li>
                        <li>Upload all the mentioned document.
                        </li>
                        <li>Click on “Upload”.
                        </li>
                    </ul>

                </div>
                <br />
            </div>
        </div>
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

    <!-- Bootstrap core JavaScript-->
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
