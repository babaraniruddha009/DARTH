<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodAvailability.aspx.vb" Inherits="BloodAvailabilityaspx" %>

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
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style2 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .highlight
    {
        background-color: #FFFFAF;
    }
    </style>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
     
        <div style="background-size: cover;min-height:100vh;max-height:1300px; background-color: rgba(225,225,225,0.6);">
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
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email : darthblood16@gmail.com  | "></asp:Label>
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
                                <a class="nav-link" href="BloodBankHome.aspx"><b>Home</b></a>
                            </li>
                            <li class="nav-item">
                             <asp:UpdatePanel ID="Up1" runat="server"><ContentTemplate>   <a class="nav-link" href="BloodBankRequest.aspx"><b>Request</b><span ><asp:Label runat="server" ID="BadgeLbl" style="width:20px;margin-left:2px" class="badge badge-danger" Text="" ></asp:Label></span></a>
                              </ContentTemplate></asp:UpdatePanel>  
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="HospitalMaps.aspx"><b>Maps</b></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link " href="#" id="tableDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                <a class="nav-link" href="BloodBankHome.aspx#ReportTag"><b>Report</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#ContactUs"><b>Contact</b></a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
           
                  <div style="padding-top:20px;width:100%;padding-left:10px;padding-right:10px"">
               
            <ol class="breadcrumb" style="background-color:rgba(225,225,225,1);height:50px" >
                    
                       
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="#3366ff"  id="DarthLbl">DARTH</asp:Label>
                            </li>
                            <li class="breadcrumb-item">
                                <asp:Label runat="server" ForeColor="gray" ID="PageLbl">Blood Availability</asp:Label>
                               
                            </li>
                            <li style="margin-left:15%;margin-right:15%">
                    <div class="search_course_wrap" style="margin-top:-5px">
                        
                       
   
                        <div style="background-color: white;width:170%" class=" d-flex justify-content-between">
                            <asp:TextBox runat="server" type="text" Height="37px" BackColor="lightgray" placeholder="Search for..." CssClass="form-control" ID="SearchText" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search for...'"></asp:TextBox>
                            <asp:Button runat="server" type="submit" Text="Search" Height="37px" ID="SearchBtn" CssClass="btn search_course_btn"></asp:Button>
                        </div>
                        
                    </div>
               
                            </li>
                             
                        </ol>
                    </div>
            <div id="GridDiv"  style="padding: 5px 15px 0px;">
                <div style="overflow: auto;text-align:center">
                    <asp:UpdatePanel ID="Update1" runat="server">
                        <ContentTemplate>
          
                            <asp:GridView ID="GridView1" AutoGenerateColumns="False" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  Visible="false" HeaderText="ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditId" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemId" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Name">
                                        <EditItemTemplate>
                                             <asp:DropDownList runat="server" ID="BloodNameDropDown">
                                    <asp:ListItem Value="-1">Select Blood Name</asp:ListItem>

                                    <asp:ListItem Value="1">A+</asp:ListItem>
                                    <asp:ListItem Value="2">A-</asp:ListItem>
                                    <asp:ListItem Value="3">B+</asp:ListItem>
                                    <asp:ListItem Value="4">B-</asp:ListItem>
                                    <asp:ListItem Value="5">AB+</asp:ListItem>
                                    <asp:ListItem Value="6">AB-</asp:ListItem>
                                    <asp:ListItem Value="7">O+</asp:ListItem>
                                    <asp:ListItem Value="8">O-</asp:ListItem>
                                    <asp:ListItem Value="9">Bombay+</asp:ListItem>
                                    <asp:ListItem Value="10">Bombay-</asp:ListItem>

                                    </asp:DropDownList>
                                            
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodNametxt" runat="server" Text='<%#Eval("BloodName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Type">
                                        <EditItemTemplate>
                                             <asp:DropDownList runat="server" ID="BloodTypeDropDown">
                                    <asp:ListItem Value="-1">Select Blood Type</asp:ListItem>

                                    <asp:ListItem Value="1">Plasma</asp:ListItem>
                                    <asp:ListItem Value="2">Platelets</asp:ListItem>
                                    <asp:ListItem Value="3">Red Blood Cell</asp:ListItem>

                                </asp:DropDownList>
                                           
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodTypetxt" runat="server" Text='<%#Eval("BloodType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood In Milliliters">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditBloodInMltxt" runat="server" Text='<%#Eval("BloodInMl") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodInMltxt" runat="server" Text='<%#Eval("BloodInMl") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date of Collection">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditDateofCollectiontxt" Type="Date" ToolTip="Enter collection date." runat="server" Text='<%#Eval("DateofEnrolment") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDateofCollectiontxt" Type="date" runat="server" ToolTip="Enter collection date." Text='<%#Eval("DateofEnrolment") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date of Expiry">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditDateofExpirytxt"  Type="Date" runat="server" Text='<%#Eval("DateofExpiry") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDateofExpirytxt" runat="server" Text='<%#Eval("DateofExpiry") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditDescriptiontxt" runat="server" Text='<%#Eval("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDescriptiontxt" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditDatetxt" Width="200px" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDatetxt" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <EditItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                         <asp:LinkButton ID="UpdateBtn" runat="server" ForeColor="White" CommandName="Update">Update</asp:LinkButton>
                                            
                                                    </td>
                                                    <td>
                                                        &nbsp
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="CancelBtn" runat="server" ForeColor="White" CommandName="Cancel">Cancel</asp:LinkButton>
                                       
                                                    </td>
                                                </tr>
                                            </table>
                                            </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="EditBtn" CssClass="fas fa-pencil-alt" style="text-decoration:none" runat="server" CommandName="Edit"></asp:LinkButton>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <EditItemTemplate>
                                            
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="DeleteBtn" runat="server" CssClass="fas fa-trash-alt" CommandName="Delete"></asp:LinkButton>
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
               
                  
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>
                <br />
                 </div>
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
