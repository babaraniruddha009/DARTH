<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodBankTable.aspx.vb" Inherits="BloodBankTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Blood Bank Table</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

                <a class="navbar-brand mr-1" href="index.html" style="color: #ff4181">
                    <h3>DARTH</h3>
                </a>

                <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Navbar Search -->
                <div  class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Navbar -->
               
                    <table style="margin-right:5%">
                        <tr>
                        <td>
                             <ul  class="navbar-nav ml-auto ml-md-0">

                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle fa-fw"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                             <asp:Button runat="server" Text="Logout" ID="BtnLogout" class="dropdown-item"></asp:Button>
                        </div>
                    </li>
                </ul>
                        </td>
                        <td>
                            <div ">
                    <asp:Label ID="UserLabel" ForeColor="white" runat="server" Text="AdminName"></asp:Label>
                </div>
                        </td>
                            </tr>
                    </table>
       
            </nav>

            <!------------------------------------->

            <div id="wrapper">
                <!-- Sidebar -->
                <ul class="sidebar navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-folder"></i>
                            <span>Admin</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                            <h6 class="dropdown-header">Register Screens:</h6>
                            <a class="dropdown-item" href="AdminRegister.aspx">Register</a>
                            <a class="dropdown-item" href="AdminChangePass.aspx">Change Password</a>

                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="tableDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-table"></i>
                            <span>Tables</span></a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                            <h6 class="dropdown-header">Hospital:</h6>
                            <a class="dropdown-item" href="DoctorTable.aspx">Registered</a>
                            <a class="dropdown-item" href="HospitalReport.aspx">Reports</a>
                            
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Blood Bank:</h6>
                            <a class="dropdown-item" href="BloodBankTable.aspx">Registered</a>
                            <a class="dropdown-item" href="AdminBloodReport.aspx">Reports</a>
                            <a class="dropdown-item" href="AdminBloodAvailability.aspx">Availability</a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Visiters:</h6>
                            <a class="dropdown-item" href="VisiterInfo.aspx">Visiter Info</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="AdminDocx.aspx">
                            <i class="fas fa-fw fa-file-alt"></i>
                            <span>Documents</span>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="AdminMap.aspx">
                            <i class="fas fa-fw fa-map"></i>
                            <span>Maps</span>
                        </a>

                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="#">
                            <i class="fas fa-fw fa-bell"></i>
                            <span>Notification</span>
                        </a>

                    </li>
                </ul>
                <!------------Side Bar End---------------->

                <div id="content-wrapper" >

                    <div class="container-fluid" >

                        <!-- Breadcrumbs-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Blood Bank Registered</li>
                        </ol>


                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="update1" runat="server">
                            <ContentTemplate>
                                <div style="OVERFLOW:auto;text-align:center">
                                <div style="width:250%">
                                <asp:GridView ID="GridView1" AutoGenerateColumns="False" Width="100%" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                             
                                   <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  Visible="false" HeaderText="ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditId" runat="server" Text='<%#Eval("Unicode") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemId" runat="server" Text='<%#Eval("Unicode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Bank">
                                        <EditItemTemplate>
                                             
                                            <asp:TextBox ID="EditBloodBankName" runat="server" Text='<%#Eval("BloodBank_Name") %>'></asp:TextBox>
                                        
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodBankName" runat="server" Text='<%#Eval("BloodBank_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Bank Type">
                                        <EditItemTemplate>
                                           <asp:DropDownList ID="EditBloodBankType" runat="server">
                                                <asp:ListItem Value="-1">Select Blood Bank Type</asp:ListItem>
                                                <asp:ListItem Value="1">Government</asp:ListItem>
                                                <asp:ListItem Value="2">Private</asp:ListItem>
                                            </asp:DropDownList> 
                                          
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodBankType" runat="server" Text='<%#Eval("BloodBank_Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditAddress" runat="server" Text='<%#Eval("Address") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAddress" Width="350px" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="City">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditCity" ToolTip="Enter city." runat="server" Text='<%#Eval("City") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="State">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditState" runat="server" Text='<%#Eval("State") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemState" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Pincode">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditPincode" runat="server" Text='<%#Eval("Pin_Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPincode" runat="server" Text='<%#Eval("Pin_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Latitude">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditLatitude" Width="200px" runat="server" Text='<%#Eval("Latitude") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLatitude" runat="server" Text='<%#Eval("Latitude") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Longitude">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditLongitude" Width="200px" runat="server" Text='<%#Eval("Longitude") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLongitude" runat="server" Text='<%#Eval("Longitude") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="License Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditLicense" Width="200px" runat="server" Text='<%#Eval("License_No") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLicense" runat="server" Text='<%#Eval("License_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date of License">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditLicenseDate" type="date"  Width="200px" runat="server" Text='<%#Eval("Date_of_License") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLicenseDate" runat="server" Text='<%#Eval("Date_of_License") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date of Expiry">
                                        <EditItemTemplate>
                                            <asp:TextBox type="date" ID="EditRenewalDate" Width="200px" runat="server" Text='<%#Eval("Date_of_Renewal") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemRenewalDate" runat="server" Text='<%#Eval("Date_of_Renewal") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Email">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditEmail" Width="200px" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Contact">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditContact" Width="200px" runat="server" Text='<%#Eval("Contact_No") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemContact" runat="server" Text='<%#Eval("Contact_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Landline">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditLandline" Width="200px" runat="server" Text='<%#Eval("Landline") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLandline" runat="server" Text='<%#Eval("Landline") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date">
                                        <EditItemTemplate>
                                            <asp:Label ID="EditDateTime" Width="200px" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDateTime" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Edit">
                                        <EditItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                         <asp:LinkButton ID="UpdateBtn" runat="server" ForeColor="white" CommandName="Update">Update</asp:LinkButton>
                                            
                                                    </td>
                                                    <td>
                                                        &nbsp
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="CancelBtn" runat="server" ForeColor="white" CommandName="Cancel">Cancel</asp:LinkButton>
                                       
                                                    </td>
                                                </tr>
                                            </table>
                                            </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:LinkButton ID="EditBtn" CssClass="fas fa-pencil-alt" CommandArgument="<%# Container.DataItemIndex %>" style="text-decoration:none" runat="server" CommandName="Edit"></asp:LinkButton>
                                          
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
                                </div>
                                    <br />
                                    </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>


                        <br />
                        <div class="card mb-3">

                            <div class="card-footer small text-muted">Updated yesterday at 11.59 PM</div>
                        </div>
                    </div>



                    <!-- /.container-fluid -->

                    <%--<!-- Sticky Footer -->
                        <footer class="sticky-footer">
                        <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                             <span>Copyright © Your Website 2019</span>
                        </div>
                        </div>
                    </footer>--%>
                </div>
            </div>

        </div>
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


    </form>

</body>
</html>
