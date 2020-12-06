<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForgetPassword.aspx.vb" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>www.DARTH.com/ForgetPassword
    </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </head>
<body class="bg-dark">
    <form id="form1" runat="server">
       
        <div style="width:35%;margin-right:auto;margin-left:auto">
            <div class="container">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-header" style="text-align: center">
                        <h4>Forget Password ?</h4>
                    </div>
                    <div class="card-body">
                        <div class="text-center mb-4">
                            
                            <p>Enter your email address and we will send you an OTP to reset your password.</p>
                        </div>
                       
                                <div class="form-group">
                                    <div>
                                        <asp:TextBox runat="server" Height="40px" ToolTip="Enter your registered email." Width="100%" type="text" CssClass="form-control" ID="Email" placeholder="Enter Email*" onfocus="this.placeholder = ''" required="" oninvalid="this.setCustomValidity('Please Enter your registered email')" oninput="setCustomValidity('')" onblur="this.placeholder = 'Enter Email*'"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button runat="server" ID="BtnSubmit" Text="Submit" class="btn btn-primary btn-block"></asp:Button>
                                <div class="form-group">
                                    <div style="text-align:center">
                                       
                                    <asp:ScriptManager runat="server" ID="Script1"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate> 
                                     <span> <asp:Label ID="Label1" runat="server" Text="Enter OTP Within " Visible="false"></asp:Label><asp:Label ID="Label2" runat="server" Text=" 120 " Visible="false"></asp:Label><asp:Label Visible="false" ID="OtpLabel" runat="server" Text=" Sec."></asp:Label></span>
                                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" >

                                        </asp:Timer>
                                    </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-top: 20px">
                                    <div>
                                        <asp:TextBox runat="server" Height="40px" ToolTip="Enter your OTP." Width="100%" Visible="false" type="text" CssClass="form-control" ID="OtpTxt" required="" oninvalid="this.setCustomValidity('Please Enter OTP')"
                                            oninput="setCustomValidity('')" placeholder="Enter OTP*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter OTP*'"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <asp:TextBox runat="server" TextMode="Password" Visible="false" ToolTip="Enter your new password." Height="40px" Width="100%" type="text" CssClass="form-control" ID="NewPassTxt" required="" oninvalid="this.setCustomValidity('Enter your new password here.')"
                                            oninput="setCustomValidity('')" placeholder="Enter New Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter New Password*'"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <asp:TextBox runat="server" TextMode="Password" ToolTip="Enter your new password." Visible="false" Height="40px" Width="100%" type="text" CssClass="form-control" ID="ConfPassTxt" required="" oninvalid="this.setCustomValidity('Enter your new password here.')"
                                            oninput="setCustomValidity('')" placeholder="Confirm Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password*'"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button runat="server" ID="BtnReset" Visible="false" Text="Reset Password" class="btn btn-primary btn-block"></asp:Button>
                                <div class="text-center" style="margin-top: 10px">
                                    <table style="margin-left:auto;margin-right:auto" >
                                        <tr>
                                            <td>
                                                <asp:LinkButton runat="server" ID="LoginLinkBtn" class="d-block small" style="height: 19px">Login</asp:LinkButton>
                                            </td>
                                            <td style="color:dodgerblue">
                                                /
                                            </td>
                                            <td>
                                                <a class="d-block small" href="Index.aspx">Home</a>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </div>
                            
                    </div>
                </div>
            </div>

        </div>
    </form>
     
</body>
</html>