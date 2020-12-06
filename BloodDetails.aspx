<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BloodDetails.aspx.vb" Inherits="BloodDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Blood Details</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 100%;
            height: calc(2.25rem + 2px);
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: 0.25rem;
            -webkit-transition: none;
            transition: none;
            border: 1px solid #ced4da;
            margin-left: 37;
            background-color: #fff;
        }
    </style>
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div>
            <div class="container" style="margin-top: -30px; margin-bottom: 30px;">
                            
                <div class="card card-register mx-auto mt-5">
                    <div class="card-header" style="text-align: center">
                        <h4>Blood Details</h4>
                    </div>
                    <br />
                    <div class="text-center mb-4">

                        <p>Enter blood packet details in the below fields.</p>
                    </div>
                   
                    <div class="card-body">
                           <asp:UpdatePanel ID="update1" runat="server">
                            <ContentTemplate>

                        <div class="form-group" style="margin-bottom: 0px; margin-top: -20px">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div>
                                            <asp:DropDownList runat="server" Height="40px" Width="100%" ToolTip="Please select Blood Name here." CssClass="form-control" ID="BloodNameDropDown">
                                                <asp:ListItem Value="-1">Select Blood Name*</asp:ListItem>

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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div>
                                            <asp:DropDownList runat="server" Height="40px" Width="100%" ToolTip="Please select Blood Type here." CssClass="form-control" ID="BloodTypeDropDown">
                                                <asp:ListItem Value="-1">Select Blood Type</asp:ListItem>

                                                <asp:ListItem Value="1">Plasma</asp:ListItem>
                                                <asp:ListItem Value="2">Platelets</asp:ListItem>
                                                <asp:ListItem Value="3">Red Blood Cell</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="form-group">

                            <div>
                                <asp:TextBox runat="server" ToolTip="Enter value in number format only." Height="40px" Width="100%" CssClass="form-control" ID="BloodMlTxt" required="" oninvalid="this.setCustomValidity('Please enter blood in millilitre here.')"
                                    oninput="setCustomValidity('')" placeholder="Blood in Millilitre*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Blood in Millilitre*'"></asp:TextBox>
                            </div>

                        </div>
                        <div class="form-group" style="margin-bottom: 0px">
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                     <div class="input-group">
                                                        <asp:Label ID="Label2" width="100px" style="margin-top:8px;color:grey" runat="server"  Text="Collect Date"></asp:Label>
                                                     <div class="input-group-append">
                                                           <asp:TextBox runat="server" type="date" ToolTip="Enter collection date." Height="40px" Width="100%" CssClass="form-control" ID="EnrolTxt" required="" oninvalid="this.setCustomValidity('Please enter collection date here.')"
                                            oninput="setCustomValidity('')" placeholder="Collection Date (eg dd/mm/yyy)*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Collection Date (eg dd/mm/yyy)*'"></asp:TextBox>

                                                       </div>
                                                           
                                                    </div>  
                                </div>
                               
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                     <div class="input-group">
                                                        <asp:Label ID="Label1" width="100px" style="margin-top:8px;color:grey" runat="server"  Text="Expiry Date"></asp:Label>
                                                     <div class="input-group-append">
                                                          <asp:TextBox runat="server" type="date" ToolTip="Enter expiry date." Height="40px" Width="100%" CssClass="form-control" ID="ExpiryTxt" required="" oninvalid="this.setCustomValidity('Please enter expiry date here.')"
                                            oninput="setCustomValidity('')" placeholder="Expiry Date (eg dd/mm/yyy)*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Expiry Date (eg dd/mm/yyy)*'"></asp:TextBox>
                                    
                                                       </div>
                                                           
                                                    </div>  
                                </div>
                            </div>

                        </div>
                    </div>
                      <div class="form-group" style="margin-bottom: 0px">

                        <div>
                            <asp:TextBox runat="server" TextMode="MultiLine" ToolTip="Enter blood description." Height="50px" Width="100%" CssClass="form-control" ID="DescTxt" placeholder="Blood Description" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Blood Description'"></asp:TextBox>
                        </div>
                    </div>
                         <asp:Button runat="server" ID="BtnLogin" Text="Save" Style="margin-top: 20px" class="btn btn-primary btn-block"></asp:Button>
                         </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                            
                    <div class="text-center" style="margin-bottom: 10px">

                        <a class="d-block small" style="margin-top: -10px" href="BloodBankHome.aspx">Home?</a>
                    </div>
                </div>
                         
                </div>
            </div>
        </div>
        </div>
        </div>
    </form>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>

