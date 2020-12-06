<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DoctorRequestPage.aspx.vb" Inherits="DoctorRequestPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Patient Request.</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet" />
    </head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div>
            <div class="container" style="margin-top: -30px; margin-bottom: 30px">
                <div class="card card-register mx-auto mt-5">
                    <div class="card-header" style="text-align: center">
                        <h4>Patient Details</h4>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="update1" runat="server">
                            <ContentTemplate>

                                <div class="form-group" style="margin-bottom: 0px">
                                    
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox runat="server" Height="40px" ToolTip="Enter blood bank name." Width="100%" type="text" CssClass="form-control" ID="BloodBankNameTxt" placeholder="Blood Bank Name*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Blood Bank Name*'"></asp:TextBox>
                                                </div>
                                            </div>
                                       
                                </div>
                                <div class="form-group" style="margin-bottom: 0px">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox runat="server" ToolTip="Enter Patient Name." Height="40px" Width="100%" type="text" CssClass="form-control" ID="TxtPatient"  required="" oninvalid="this.setCustomValidity('Please Enter Patient Name.')"
                                            oninput="setCustomValidity('')" placeholder="Patient Name*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name*'"></asp:TextBox>
                                                </div>  
                                               </div>           
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                    <div class="input-group">
                                                        <asp:Label ID="Label1" width="100px" style="margin-top:8px;color:grey" runat="server"  Text="Date Of Birth"></asp:Label>
                                                     <div class="input-group-append">
                                                        <asp:TextBox runat="server" ToolTip="Enter Patient Age." Height="40px" Width="100%" type="date"  required="" oninvalid="this.setCustomValidity('Please Enter Patient Age.')"
                                             oninput="setCustomValidity('')" CssClass="form-control" ID="TxtPatientAge" placeholder="Patient Age*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Age*'"></asp:TextBox>
                                                 </div>
                                            
                                                    </div>  
                                               </div>           
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 0px">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                    <asp:DropDownList ID="BloodDropdown" ToolTip="Select Blood Group*." Height="40px" Width="100%"  CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="-1">Select Blood Group*</asp:ListItem>
                                                        <asp:ListItem Value="1">A+ </asp:ListItem>
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
                                                    <asp:DropDownList ID="BloodTypeDropDown" Height="40px" Width="100%" type="text" CssClass="form-control" ToolTip="Select blood type." runat="server">
                                                        <asp:ListItem Value="-1">Select Required Blood Type*</asp:ListItem>
                                                        <asp:ListItem Value="1">Plasma</asp:ListItem>
                                    <asp:ListItem Value="2">Platelets</asp:ListItem>
                                    <asp:ListItem Value="3">Red Blood Cell</asp:ListItem>
                                                      
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                 <div class="form-group" style="margin-top:-10px">
                                    
                                                <div>
                                                    <label style="margin-top:15px;color:#495057">Patient Report File / jpg ,png*
                        <asp:FileUpload   ID="FileUploader1" onchange="ShowImagePreview(this);" runat="server" Width="240px"/>
                        </label>  </div>  
                                               </div>           
                                        
                                </div>
                                  <div class="form-group" style="margin-bottom: 0px">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                    <asp:DropDownList ID="BloodDropList" Height="40px" Width="100%" type="text" CssClass="form-control" ToolTip="Select blood Units required." runat="server" >
                                                        <asp:ListItem Value="-1">Select Blood Units*</asp:ListItem>
                                                        <asp:ListItem Value="1">1 unit</asp:ListItem>
                                                        <asp:ListItem Value="2">2 units</asp:ListItem>
                                                        <asp:ListItem Value="3">3 units</asp:ListItem>
                                                          <asp:ListItem Value="3">4 units</asp:ListItem>              
                                                    </asp:DropDownList>

                                                       </div>  
                                               </div>           
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox runat="server" ToolTip="Enter Patient Relative Name."  Height="40px" Width="100%" type="text" CssClass="form-control" ID="TxtRelativeName" placeholder="Patient Relative Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Relative Name'"></asp:TextBox>
                                                </div>  
                                               </div>           
                                        </div>
                                         
                                    </div>
                                </div>
                                 <div class="form-group" style="margin-bottom: 0px">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                     <asp:TextBox runat="server"  Height="40px"  required="" oninvalid="this.setCustomValidity('Please Enter patient email.')"
                                            oninput="setCustomValidity('')" ToolTip="Enter blood bank email." Width="100%" type="text" CssClass="form-control" ID="EmailTxt"  placeholder="Enter Email*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email*'"></asp:TextBox>
                                        </div>  
                                               </div>           
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <div>
                                                     <asp:TextBox runat="server" ToolTip="Enter contact number." Height="40px" Width="100%" type="text" CssClass="form-control" ID="TxtContact" placeholder="Contact Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Contact Number'"></asp:TextBox>
                                               </div>  
                                               </div>           
                                        </div>
                                    </div>
                                </div>
                               
                                  
                                <div class="form-group">
                                    <div>
                                        <asp:TextBox runat="server" Height="40px" ToolTip="Enter blood bank address." Width="100%" type="text" CssClass="form-control" ID="AddressTxt"  placeholder="Enter Address*" onfocus="this.placeholder = ''"  required="" oninvalid="this.setCustomValidity('Please Enter patient address.')"
                                            oninput="setCustomValidity('')" onblur="this.placeholder = 'Enter Address*'"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <asp:Button runat="server" ID="BtnRegister" Text="Request" class="btn btn-primary btn-block"></asp:Button>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="text-center" style="margin-bottom:10px">

                            <a class="d-block small" style="margin-top:-10px" href="DoctorBloodAvailability.aspx">Home?</a>
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
