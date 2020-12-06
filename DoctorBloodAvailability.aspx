<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DoctorBloodAvailability.aspx.vb" Inherits="DoctorBloodAvailability" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>Blood Availability
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


</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <div style="background-size: cover; height: 100vh; background-color: rgba(225,225,225,0.6);">
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
                            <td style="position: absolute; top: 20px; right: 13%; text-align: right">
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email : darthblood16@gmail.com | "></asp:Label>
                            </td>
                            <td style="position: absolute; font-size: large; top: 22px; right: 8%; text-align: right">
                                <asp:LinkButton ID="LogoutBtn" ForeColor="#4e4949" runat="server">Logout</asp:LinkButton>
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
                                <a class="nav-link" href="BloodMaps.aspx"><b>Maps</b></a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="DoctorRequest.aspx"><b>Request</b></a>
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
                                <a class="nav-link" href="DoctorHome.aspx#ReportTag"><b>Report</b></a>
                            </li>   
                            <li class="nav-item">
                                <a class="nav-link" href="#ContactUs"><b>Contact</b></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div style="margin-left: 10px; margin-right: 10px;margin-top:20px;margin-bottom:20px;width:100%">
               

                <ol class="breadcrumb" style="background-color:rgba(225,225,225,1);height:50px" >
                    
                       
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="#3366ff"  id="DarthLbl">DARTH</asp:Label>
                            </li>
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="gray" ID="PageLbl">Availability</asp:Label>
                               
                            </li>
                            <li style="margin-left:15%;margin-right:15%">
                    <div class="search_course_wrap" style="margin-top:-5px">
                        <div style="background-color: white;width:170%" class=" d-flex justify-content-between">
                            <asp:TextBox runat="server" BackColor="lightgray" type="text" Height="37px" placeholder="Search for..." CssClass="form-control" ID="SearchText" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search for...'"></asp:TextBox>
                            <asp:Button runat="server" type="submit" Text="Search" Height="37px" ID="SearchBtn" CssClass="btn search_course_btn"></asp:Button>
                        </div>
                    </div>
               
                            </li>
                             
                        </ol>
                           
            </div>
           

            <div id="GridDiv" style="padding: 5px 15px 0px;overflow: auto">
                <div style="text-align:center;width:180%">

                <asp:UpdatePanel ID="update1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="true" ontick="Timer1_Tick"></asp:Timer>
                        
                            <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound"  AutoGenerateColumns="False" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  Visible="false" HeaderText="Unicode">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemUnicode" runat="server" Text='<%#Eval("Unicode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Bank">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodBank_Name" runat="server" Text='<%#Eval("BloodBank_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Bank Type">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodBank_Type" runat="server" Text='<%#Eval("BloodBank_Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Adress">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="City">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="State">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemState" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Pin Code">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPin" runat="server" Text='<%#Eval("Pin_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Email">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Contact">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemContact" runat="server" Text='<%#Eval("Contact_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Landline">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLandline" runat="server" Text='<%#Eval("Landline") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="A+">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAP" runat="server" Text='<%#Eval("A+") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="A-">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAN" runat="server" Text='<%#Eval("A-") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="B+">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBP" runat="server" Text='<%#Eval("B+") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="B-">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBN" runat="server" Text='<%#Eval("B-") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="AB+">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemABP" runat="server" Text='<%#Eval("AB+") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="AB-">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemABN" runat="server" Text='<%#Eval("AB-") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="O+">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemOP" runat="server" Text='<%#Eval("O+") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="O-">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemON" runat="server" Text='<%#Eval("O-") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Bombay+">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBombayP" runat="server" Text='<%#Eval("Bombay+") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Bombay-">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBombayN" runat="server" Text='<%#Eval("Bombay-") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Status">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Request">
                                        
                                        <ItemTemplate>
                                            <asp:LinkButton ID="RequestBtn" runat="server" CommandName="Delete">Request</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>
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
