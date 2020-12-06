<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodHistory.aspx.vb" Inherits="BloodHistory" %>

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
    </style>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
 function LoadDiv(url)

 { 
    var img = new Image();

    var bcgDiv = document.getElementById("divBackground");

    var imgDiv = document.getElementById("divImage");

    var imgFull = document.getElementById("imgFull");
    var GrdDiv = document.getElementById("GridDiv");

    img.onload = function() {
       
        imgFull.src = img.src;
        imgFull.style.display = "block";
    };
    
    img.src= url;

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
            height: 550px;
            width: 600px;
            padding: 3px;
            border: solid 2px grey;
        }

        </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <div style="background-size: cover; height: 100vh;max-height:1400px; background-color: rgba(225,225,225,0.6);">
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
            <div style="margin-left: 10px; margin-right: 10px;margin-top:20px;margin-bottom:20px">
                
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                <ol class="breadcrumb" style="background-color:rgba(225,225,225,1)">
             
                            <li class="breadcrumb-item">
                                <asp:LinkButton ID="BtnDetail" ForeColor="#3366ff" runat="server">Details History</asp:LinkButton>
                            </li>
                            <li class="breadcrumb-item">
                                <asp:LinkButton runat="server" ForeColor="Black" ID="RequestBtn">Request History</asp:LinkButton>
                               
                            </li>
                             <li class="breadcrumb-item">
                                <asp:LinkButton runat="server" ForeColor="Black" ID="DeliverBtn">Delivered History</asp:LinkButton>
                               
                            </li>

                </ol>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                 
            </div>
            <div id="divBackground">
             </div>
                        <div id="divImage">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td valign="middle" align="center">
                                        <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" valign="bottom">
                                        <input id="btnClose" class="btn-primary" style="width:100px;height:30px;border-radius:4px" type="button" value="Close" onclick="HideDiv()" />
                                    </td>
                                </tr>
                            </table>
                        </div>
            <div id="GridDiv" style="padding: 5px 15px 0px;">
                <div style="overflow: auto;text-align:center">
                <asp:UpdatePanel ID="update1" runat="server">
                    <ContentTemplate>
                            <asp:Timer ID="Timer1" Enabled="true" OnTick="Timer1_Tick" runat="server"></asp:Timer>
                       
                                    <asp:GridView ID="GridView1" Visible="true" DataSourceID="SqlDataSource2"  AutoGenerateColumns="False" EmptyDataText="No Data Found" AllowPaging="true" PageSize="9" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                            <asp:TextBox ID="EditBloodNametxt" runat="server" Text='<%#Eval("BloodName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodNametxt" runat="server" Text='<%#Eval("BloodName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Type">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditBloodTypetxt" runat="server" Text='<%#Eval("BloodType") %>'></asp:TextBox>
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
                                            <asp:TextBox ID="EditDateofCollectiontxt" runat="server" Text='<%#Eval("DateofEnrolment") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDateofCollectiontxt" runat="server" Text='<%#Eval("DateofEnrolment") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date of Expiry">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditDateofExpirytxt" runat="server" Text='<%#Eval("DateofExpiry") %>'></asp:TextBox>
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
                                            <asp:Label ID="EditDatetxt" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDatetxt" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
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
                </div>

                <div style="overflow: auto;">
                 <div style="width:200%;text-align:center">
                <asp:UpdatePanel ID="update3" runat="server">
                    <ContentTemplate>
                        
                       <asp:GridView ID="GridView2" Visible="false" DataSourceID="SqlDataSource1" runat="server" AllowPaging="true" PageSize="8" DataKeyNames="ID" AllowSorting="true" Style="text-align: center" Width="100%" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No Data Found." ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />

                                    <Columns>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false" HeaderText="">
                                 
                                        <ItemTemplate>
                                            <asp:Label ID="ItemId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Hospital">
                                 
                                        <ItemTemplate>
                                            <asp:Label ID="ItemHospitalName" runat="server" Text='<%#Eval("HospitalName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Doctor Name">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDoctor" runat="server" Text='<%#Eval("DoctorName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Contact">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemContact" runat="server" Text='<%#Eval("ContactNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Landline">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLandline" runat="server" Text='<%#Eval("Landline") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Address">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Patient Name">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPatientName" runat="server" Text='<%#Eval("PatientName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date Of Birth">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAge" runat="server" Text='<%#Eval("PatientAge") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Group">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodGroup" runat="server" Text='<%#Eval("BloodGroup") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Type Required">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodType" runat="server" Text='<%#Eval("BloodType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Units">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodUnits" runat="server" Text='<%#Eval("BloodUnits") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Patient Report" ControlStyle-Height="20px" ControlStyle-Width="20px">
                                            <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#"data:image/jpg;base64," & Convert.ToBase64String(CType(Eval("Report"), Byte())) %>' Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                            
                                                   </ItemTemplate>
                                            <ControlStyle Height="20px" Width="20px"></ControlStyle>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Relative Name">

                                        <ItemTemplate>
                                            <asp:Label ID="ItemRelName" runat="server" Text='<%#Eval("PatientRelName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                          <asp:TemplateField HeaderStyle-HorizontalAlign="Center" Visible="false" ItemStyle-HorizontalAlign="Center"  HeaderText="Email">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" Visible="false" ItemStyle-HorizontalAlign="Center"  HeaderText="Patient Contact">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPatContact" runat="server" Text='<%#Eval("PatientContact") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDate" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Status">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
 
                                   <asp:TemplateField HeaderText="Delete">
                                        
                                        <ItemTemplate>
                                            
                                            <asp:LinkButton ID="CancelBtn" Visible="true" runat="server" CssClass="fas fa-trash-alt" CommandName="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                       
                                    </Columns>

                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
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
                    <br />
                </div>

                <div style="overflow: auto;">
                 <div style="width:200%;text-align:center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        
                        <asp:GridView ID="GridView3" Visible="false" OnRowDeleting="GridView3_RowDeleting" DataSourceID="SqlDataSource3" runat="server" AllowPaging="true" PageSize="10" DataKeyNames="ID" AllowSorting="true" Style="text-align: center" Width="100%" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No Data Found." ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />

                                    <Columns>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false" HeaderText="">
                                 
                                        <ItemTemplate>
                                            <asp:Label ID="ItemId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Hospital">
                                 
                                        <ItemTemplate>
                                            <asp:Label ID="ItemHospitalName" runat="server" Text='<%#Eval("HospitalName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Doctor Name">
                                      
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDoctor" runat="server" Text='<%#Eval("DoctorName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Contact">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemContact" runat="server" Text='<%#Eval("ContactNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Landline">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="ItemLandline" runat="server" Text='<%#Eval("Landline") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Address">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Patient Name">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPatientName" runat="server" Text='<%#Eval("PatientName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date Of Birth">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemAge" runat="server" Text='<%#Eval("PatientAge") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Group">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodGroup" runat="server" Text='<%#Eval("BloodGroup") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Type Required">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodType" runat="server" Text='<%#Eval("BloodType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Blood Units">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemBloodUnits" runat="server" Text='<%#Eval("BloodUnits") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Patient Report" ControlStyle-Height="20px" ControlStyle-Width="20px">
                                            <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#"data:image/jpg;base64," & Convert.ToBase64String(CType(Eval("Report"), Byte())) %>' Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                            
                                                   </ItemTemplate>
                                            <ControlStyle Height="20px" Width="20px"></ControlStyle>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Relative Name">

                                        <ItemTemplate>
                                            <asp:Label ID="ItemRelName" runat="server" Text='<%#Eval("PatientRelName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                          <asp:TemplateField HeaderStyle-HorizontalAlign="Center" Visible="false" ItemStyle-HorizontalAlign="Center"  HeaderText="Email">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" Visible="false" ItemStyle-HorizontalAlign="Center"  HeaderText="Patient Contact">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemPatContact" runat="server" Text='<%#Eval("PatientContact") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Date">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemDate" runat="server" Text='<%#Eval("DateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderText="Status">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="ItemStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
 
                                   <asp:TemplateField HeaderText="Delete">
                                        
                                        <ItemTemplate>
                                            
                                            <asp:LinkButton ID="CancelBtn" Visible="true" runat="server" CssClass="fas fa-trash-alt" CommandName="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                       
                                    </Columns>

                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
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
                    <br />
               </div>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>                 
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DARTHDBConnectionString %>"></asp:SqlDataSource>
                
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
                                 <asp:Timer ID="Timer2" Interval="1000" Enabled="true" OnTick="Timer1_Tick" runat="server"></asp:Timer>
                               
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
