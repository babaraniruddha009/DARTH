<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodBankHome.aspx.vb" Inherits="BloodBankHome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>Blood Bank Home
    </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <style type="text/css">
        .auto-style3 {
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
    </style>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>


<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
                        
        <div style="background: url(Images/BloodDonation.jpg) no-repeat center; background-size: cover; height: 100vh;" runat="server">
            <header runat="server">
                <div class="hat" runat="server">
                    <table>
                        <tr>
                            <td style="padding-top:1%;">
                                <h1>
                                    <asp:Image ID="Image1" Height="45px" Width="45px" ImageUrl="~/Images/icons8-heart-with-pulse-filled-50.png" runat="server" />
                                    <span class="Title-color">DARTH</span>
                                </h1>
                            </td>
                            <td style="position: absolute; top: 20px; right: 13%; text-align: right">
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email : darthblood16@gmail.com | "></asp:Label>
                            </td>
                            <td style="position: absolute;font-size:large; top: 22px; right: 8%; text-align: right">
                                <asp:LinkButton ID="LogoutBtn" ForeColor="#4e4949"  runat="server">Logout</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </header>
            <div class="nav1">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav m-auto">
                             <li class="nav-item">
                                <a class="nav-link" href="BloodBankHome.aspx"><b>Home</b></a>
                            </li>
                            <li class="nav-item">
                             <asp:UpdatePanel ID="Up1" runat="server"><ContentTemplate>   <a class="nav-link" href="BloodBankRequest.aspx"><b>Request</b><span ><asp:Label runat="server" ID="BadgeLbl" style="width:20px;margin-left:2px" class="badge badge-danger" Text="" ></asp:Label></span></a>
                              </ContentTemplate></asp:UpdatePanel>  
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="HospitalMaps.aspx"><b>Maps</b></a>
                            </li>                           
                            <li class="nav-item dropdown" >
                            <a class="nav-link " href="#" id="AvailableDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span><b>Availability</b></span></a>
                            <div class="dropdown-menu" aria-labelledby="pagesDropdown">      
                            <a class="dropdown-item" href="BloodAvailability.aspx">Blood Availability</a>
                            <a class="dropdown-item" href="BloodPieChart.aspx">Pie Chart</a>
                            <a class="dropdown-item" href="BloodDetails.aspx">Blood Details</a>
                            </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="BloodHistory.aspx"><b>History</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#ReportTag"><b>Report</b></a>
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

                    <div class="row justify-content-end" >
                        <div style="margin-right: 50%;margin-left:5%; margin-top: 70px;width:40%;float:left">
                            <h1 style="color: #4e4949;font-size:50px"><b>WELCOME TO</b></h1>
                            <asp:Label runat="server" style="color:rgba(0,0,0,0.5);" Text="" Font-Size="40px" Font-Bold="true" ID="HospitalNameLbl"></asp:Label>
                  
                            
                        </div>
                        <div class="offset-lg-1 col-lg-5" style="width:60%;margin-top:-15%;">
					    <div class="dpmt_right">
                            <br />
						
						<p style="text-align:justify;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp There is no great joy than saving a soul. Contributing to safeguard someones life is indeed a great reward. Its exicting 
to work on the project that will specify the efforts of the indigent at the time of agitation . The team DARTH, has initially setup this web platforms that
 will reduce the indigents efforts, when in need of blood. 
we are not the donors to donate a blood and save the soul but surely we are the ones to bestow the platform in rendering the blood to impoverished. </p>
						
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
                <h3 class="title_color">Report Here</h3>
           </div>
            <div style="width:30%;margin-left:35%;margin-right:35%">
                <hr />
            </div> 
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
            <div style="margin-top:20px;width:100%;">
                <table  style="width:50%;margin-left:25%;margin-right:25%">
                <tr >
                    <td >
                        <asp:TextBox runat="server" Width="97%" type="text" CssClass="form-control" ID="name" placeholder="Enter Name*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name*'"></asp:TextBox>
                         
                    </td>
             
                    <td>
                        <asp:TextBox runat="server" type="email"  CssClass="form-control" ID="email"  placeholder="Enter Email*"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email*'"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" style="margin-top:10px" type="text" class="form-control"  ID="subject" placeholder="Subject*"  onfocus="this.placeholder = ''"
                            onblur="this.placeholder = 'Subject*'"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="mess" style="margin-top:10px" TextMode="MultiLine" class="form-control mb-10" Rows="5" name="message" placeholder="Type your Message*"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'Type your Message*'"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="padding-left:40%; padding-right: 40%">
                            <div class="search_course_wrap">
                                <div style="background-color:rgba(225,225,225,0.1)" class="form_box d-flex justify-content-between w-100">
                                    <asp:Button runat="server" type="submit" Text="Send" ID="SendBtn" CssClass="btn search_course_btn"></asp:Button>
                                </div>
                            </div>
                        </div>

                    </td>
                </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;color:grey">
                            <h6>Report Here If you have any kind of query.</h6>
                        </td>
                    </tr>
            </table>
            </div>
                                </ContentTemplate>
                 </asp:UpdatePanel>
            <br />
        </header>

        <div id="ContactUs" runat="server" style="background-color: black; height: 250px; width: auto;">
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="copyright">
                                    <p style="color: white; margin-top: 7%; position: absolute; left: 10%;">
                                        Copyright © 2018 All rights reserved | This template is made with by <a href="www.DARTH.com" style="color: #ff4181">DARTH</a>
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
                                <asp:Timer ID="Timer1" Interval="1000" Enabled="true" OnTick="Timer1_Tick" runat="server"></asp:Timer>
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
