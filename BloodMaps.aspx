<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodMaps.aspx.vb" Inherits="BloodMaps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>Blood Maps
    </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <style type="text/css">
        .auto-style2 {
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
     
    <script src="//code.jquery.com/jquery-1.11.2.js"></script>
    <script src="jquery-ui.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#SearchText').autocomplete({
                source: 'BloodMapHandler.ashx'
            });
           
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                                <asp:LinkButton ID="LogoutBtn" ForeColor="Black" runat="server">Logout</asp:LinkButton>
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
                                <a class="nav-link" href="DoctorHome.aspx"><b>Home</b></a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="DoctorRequest.aspx"><b>Request</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DoctorHome.aspx#ReportTag"><b>Report</b></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link " href="#" id="tableDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span><b>Availability</b></span></a>
                                <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                                    <a class="dropdown-item" href="DoctorBloodAvailability.aspx">Blood Availability</a>
                                    <a class="dropdown-item" href="DoctorPieChart.aspx">Pie Chart</a>                                    
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DoctorPatientHistory.aspx"><b>History</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#ContactUs"><b>Contact</b></a>
                            </li>
                            
                        </ul>
                    </div>
                </nav>
            </div>   
        </div>
         <div style="background-color:rgba(225,225,225,0.6);padding-left:10px;padding-right:10px" runat="server">
                  <div style="padding-top:20px;width:100%">
               

                <ol class="breadcrumb" style="background-color:rgba(225,225,225,1);height:50px" >
                    
                       
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="#3366ff"  id="DarthLbl">DARTH</asp:Label>
                            </li>
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="gray" ID="PageLbl">Maps</asp:Label>
                               
                            </li>
                            <li style="margin-left:15%;margin-right:15%">
                    <div class="search_course_wrap" style="margin-top:-5px">
                        <div style="background-color: white;width:170%" class=" d-flex justify-content-between">
                            <asp:TextBox runat="server" type="text" Height="37px" BackColor="lightgray" placeholder="Search by BloodBank / City / Blood Group." CssClass="form-control" ID="SearchText" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search by BloodBank / City / Blood Group.'"></asp:TextBox>
                            <asp:Button runat="server" type="submit" Text="Search" Height="37px" ID="SearchBtn" CssClass="btn search_course_btn"></asp:Button>
                        </div>
                    </div>
               
                            </li>
                             
                        </ol>
                           
            </div>
       
            <div id="Maps" style="margin-top:-10px;margin-left:10px;margin-right:10px" >
                <asp:ListBox ID="ListLat" Style="visibility: hidden; width: 2px; height: 2px" runat="server"></asp:ListBox>
                <asp:ListBox ID="ListLong" Style="visibility: hidden; width: 2px; height: 2px" runat="server"></asp:ListBox>
                <asp:ListBox ID="ListName" Style="visibility: hidden; width: 2px; height: 2px" runat="server"></asp:ListBox>
                <asp:ListBox ID="ListDesc" Style="visibility: hidden; width: 2px; height: 2px" runat="server"></asp:ListBox>

               
                <div id="dvMap" style="width: auto; height: 450px">
                </div>
                <br />
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
                        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
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
    <script type="text/javascript">
        var Latarr = new Array();
        var Longarr = new Array();
        var Namearr = new Array();
        var Descarr = new Array();
        var listbox1 = document.getElementById('<%=ListLat.ClientID%>');
        var listbox2 = document.getElementById('<%=ListLong.ClientID%>');
        var listbox3 = document.getElementById('<%=ListName.ClientID%>');
        var listbox4 = document.getElementById('<%=ListDesc.ClientID%>');
        for (var count = 0; count < listbox1.options.length; count++) {
            Latarr[count] = listbox1.options[count].text;
            Longarr[count] = listbox2.options[count].text;
            Namearr[count] = listbox3.options[count].text;
            Descarr[count] = listbox4.options[count].text;
        }
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(20.593683, 78.962883),
                zoom: 6.5,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infowindow = new google.maps.InfoWindow();

            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (var i = 0; i < Latarr.length; i++) {
                var myLatlng = new google.maps.LatLng(Latarr[i], Longarr[i]);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: Namearr[i],
                    description: Descarr[i],
                    animation: google.maps.Animation.DROP
                });
                (function (marker) {
                    google.maps.event.addListener(marker, "click", function (e) {
                      
                            map.setZoom(17);
                            map.panTo(marker.position);
                       
                            infoWindow.setContent(marker.description + "");
                        infoWindow.open(map, marker);
                    });
                })(marker);
            }
        };
    </script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1kmPEu4ZnixsLhLLCn0o6LGFDSFusBU0&callback=initMap" type="text/javascript"></script>
    <script type="text/javascript" src="MywebQuery.min.js"></script>
    <script type="text/javascript" src="bootstrap.js"></script>
    <script type="text/javascript" src="lightbox.min.js"></script>
    <script type="text/javascript" src="JQuery.flexslider.js"></script>
    <script type="text/javascript" src="owl.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

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
