<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HospitalReport.aspx.vb" Inherits="HospitalReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Admin Document</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <%--<script type="text/javascript">
        $(function () {

            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
                height: 500,
                width: 450,
                title: "Zoomed Image"

            });
            $("[id*=gvImages] img").click(function () {
                $('#dialog').html('');

                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
            });
        });
    </script>--%>

   <script type="text/javascript">
 function LoadDiv(url)

 { 
    
    var bcgDiv = document.getElementById("divBackground");

    var imgDiv = document.getElementById("divImage");

    var imgFull = document.getElementById("imgFull");
    var GrdDiv = document.getElementById("GridDiv");

    
       
        imgFull.style.display = "block";
    
    var msg= url;
    imgFull.value = msg;
    var width = document.body.clientWidth;

    if (document.body.clientHeight > document.body.scrollHeight)

    {
        bcgDiv.style.height = document.body.clientHeight + "px";
    }

    else
    {
        bcgDiv.style.height = document.body.scrollHeight + "px" ;

    }
    imgDiv.style.left = (width-650)/2 + "px";

    imgDiv.style.top =  "20px";

    bcgDiv.style.width="100%";  
    bcgDiv.style.display="block";

    imgDiv.style.display="block";
    GrdDiv.style.display = "none";
    
    return false;
 }

 function LoadDiv2(Eml) {

     var bcgDiv = document.getElementById("divBackground");

     var imgDiv = document.getElementById("divReply");

     var imgFull = document.getElementById("TxtReply");
     var GrdDiv = document.getElementById("GridDiv");
     var Email = document.getElementById("TextBox1");
     
     var Emailmsg = Eml;
     Email.value = Emailmsg;

     
     imgFull.style.display = "block";

     var width = document.body.clientWidth;

     if (document.body.clientHeight > document.body.scrollHeight) {
         bcgDiv.style.height = document.body.clientHeight + "px";
     }

     else {
         bcgDiv.style.height = document.body.scrollHeight + "px";

     }
     imgDiv.style.left = (width - 650) / 2 + "px";

     imgDiv.style.top = "20px";

     bcgDiv.style.width = "100%";
     bcgDiv.style.display = "block";

     imgDiv.style.display = "block";
     GrdDiv.style.display = "none";

     return false;
 }

function HideDiv()
 {
    var bcgDiv = document.getElementById("divBackground");

   var imgDiv = document.getElementById("divImage");

    var imgFull = document.getElementById("imgFull");
    var GrdDiv = document.getElementById("GridDiv");
    if (bcgDiv != null)

    {
        bcgDiv.style.display="none";
        imgDiv.style.display="none";
        imgFull.style.display = "none";
        GrdDiv.style.display = "block";
    }
}

function HideDiv2() {
    var bcgDiv = document.getElementById("divBackground");

    var imgDiv = document.getElementById("divReply");

    var imgFull = document.getElementById("TxtReply");
    var GrdDiv = document.getElementById("GridDiv");
    if (bcgDiv != null) {
        bcgDiv.style.display = "none";
        imgDiv.style.display = "none";
        imgFull.style.display = "none";
        GrdDiv.style.display = "block";
    }
}

</script>
    <style type="text/css">
      
        .modal {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -webkit-opacity: 0.8;
            min-height: 100%;
        }

        #divImage {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 300px;
            width: 600px;
            padding: 3px;
            border: solid 2px grey;
        }

         #divReply {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 330px;
            width: 600px;
            padding: 3px;
            border: solid 2px grey;
        }
        </style> 

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
                <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
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
                <ul class="navbar-nav ml-auto ml-md-0">

                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle fa-fw"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <asp:Button runat="server" Text="Logout" ID="BtnLogout" class="dropdown-item"></asp:Button>
                        </div>
                    </li>
                </ul>
                <div style="padding-right:5%">
                    <asp:Label ID="UserLabel" ForeColor="white" runat="server" Text="AdminName"></asp:Label>
                </div>
            </nav>
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

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Hospital Reports</li>
                           
                        </ol>
                     

                         <div id="divBackground">
                        </div>
                        <div id="divImage">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td valign="middle" align="center">
                                        <asp:TextBox runat="server" TextMode="MultiLine" ReadOnly="true" id="imgFull" Height="240" Width="580"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" valign="bottom">
                                        <input id="btnClose" class="btn-primary" style="width:100px;height:30px;border-radius:4px" type="button" value="Close" onclick="HideDiv()" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                         <div id="divReply">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td colspan="2" valign="middle" align="center">
                                        <asp:TextBox runat="server" style="visibility:hidden" id="TextBox1" ></asp:TextBox>
                                        
                                        <asp:TextBox runat="server" Font-Size="Medium" required="" placeholder="Type your message..." TextMode="MultiLine" id="TxtReply" Height="240" Width="580"></asp:TextBox>
                                    
                                    </td>
                                </tr>

                                <tr  >
                                     <td valign="bottom" style="text-align:right">
                                        <asp:Button runat="server" id="btnSubmit" class="btn-primary"  style="width:100px;height:30px;border-radius:4px" text="Submit" />
                                    </td>
                                    
                                    <td valign="bottom" style="text-align:left">
                                        <input id="btnCancel" class="btn-primary" style="width:100px;height:30px;border-radius:4px" type="button" value="Close" onclick="HideDiv2()" />
                                    </td>

                                </tr>
                            </table>
                        </div>

                       
                        <div  style="overflow:auto">
                         <div style="width:160%;text-align:center" id="GridDiv">
                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="update1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" Interval="1000" runat="server"></asp:Timer>
                                <asp:GridView ID="GridView1" AutoGenerateColumns="False" EmptyDataText="No Data Found" AllowPaging="True" PageSize="2" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  Visible="false" HeaderText="ID">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Hospital Name">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodBankName" runat="server" Text='<%#Eval("HospitalName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="City">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="State">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemState" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Address">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Name">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Email">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Subject">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemSubject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
                                        </ItemTemplate>
                                         <HeaderStyle HorizontalAlign="Center" />
                                         <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                     
                                     <asp:TemplateField HeaderText="Message">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ImageButton1" runat="server" CssClass="fas fa-envelope" text="" Style="cursor: pointer;" OnClientClick='<%# String.Format("return LoadDiv(""{0}"");", Eval("Message")) %>' OnClick="ImageButton1_Click" />
                                            </ItemTemplate>
                                            
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDatetxt" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reply">    
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReplyBtn"  CssClass="fas fa-reply" runat="server" Style="cursor: pointer;text-decoration:none"  OnClientClick='<%# String.Format("return LoadDiv2(""{0}"");", Eval("Email")) %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">    
                                        <ItemTemplate>
                                            <asp:LinkButton ID="DeleteBtn" CssClass="fas fa-trash-alt" runat="server" CommandName="Delete"></asp:LinkButton>
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
                        <asp:SqlDataSource ID="SqlDataSource2" DeleteCommand="DELETE from [HospitalReport] where [ID]=@ID" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>" SelectCommand="SELECT * FROM [HospitalReport] order by [DateTime]"></asp:SqlDataSource>
                        <br />
                           </div>  
                             </div>
                        <br />
                        <div class="card mb-3">
                            <div class="card-footer small text-muted">Updated yesterday at 11.59 PM</div>
                        </div>
                       
                    </div>
                   
                    <%--<!-- Area Chart Example-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-chart-area"></i>
                                    Area Chart Example</div>
                                <div class="card-body">
                                    <canvas id="myAreaChart" width="100%" height="30"></canvas>
                                </div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                         </div>--%>
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
    </form>
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