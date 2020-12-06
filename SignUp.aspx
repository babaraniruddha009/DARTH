<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignIn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>www.DARTH.com/SignUp.aspx </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <style type="text/css">
        .auto-style1 {
            width: 510px;
            margin-left: 23px;
            margin-top: 0px;
        }

        .auto-style2 {
            height: 92px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <header runat="server" class=" bg-dark">
            <div style="width: 55%; margin-left: auto; margin-right: auto;margin-top:-25px;height:120vh;">
                <div class="container">
                    <div class="card card-login mx-auto mt-5">
                        <div class="card-header" style="text-align: center">
                            <h3>Sign Up</h3>

                        </div>
                        <div class="card-body">
                            <div class="text-center mb-4">

                                <p>Enter your unicode & other details in the below fields.</p>
                            </div>

                            <div class="form-group" style="margin-bottom:-15px">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                <asp:TextBox ID="TxtUnicode" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" required="" oninvalid="this.setCustomValidity('Enter your unicode here.')"
                                                    oninput="setCustomValidity('')" type="text" CssClass="form-control" placeholder="Enter Unicode*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Unicode*'"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                  
                                                    <asp:DropDownList ID="DdlOccupation" CssClass="form-control" Style="margin-top: 15px; border-color: darkgrey" Width="100%" runat="server">
                                                        <asp:ListItem>Select Profession*</asp:ListItem>
                                                        <asp:ListItem>Hospital</asp:ListItem>
                                                        <asp:ListItem>Blood Bank</asp:ListItem>
                                                    </asp:DropDownList>
                                                

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group" style="margin-bottom:0px">
                                <div>
                                    <asp:TextBox ID="txtEmailId" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" type="text" CssClass="form-control" required="" oninvalid="this.setCustomValidity('Please Enter your Email.')"
                                        oninput="setCustomValidity('')" placeholder="Enter Email*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email*'"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group" style="margin-bottom:-15px">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                <asp:TextBox ID="txtContact" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" type="text" CssClass="form-control" required="" oninvalid="this.setCustomValidity('Please Enter your Contact number.')"
                                        oninput="setCustomValidity('')" placeholder="Contact*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Contact*'"></asp:TextBox>
                               
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                   <asp:TextBox ID="Txtland" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" type="text" CssClass="form-control" placeholder="Enter Landline Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Landline Number'"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           
                           
                            <div class="form-group" style="margin-bottom:0px">
                                <div>
                                    <asp:TextBox ID="txtUsername" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" required="" oninvalid="this.setCustomValidity('Please Enter your Username')"
                                        oninput="setCustomValidity('')" type="text" CssClass="form-control" placeholder="Enter  Username*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Username*'"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group" style="margin-bottom:0px">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                 <asp:TextBox ID="txtPassword" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" type="password" CssClass="form-control" placeholder="Enter Password*" required="" oninvalid="this.setCustomValidity('Please Enter your Password.')"
                                        oninput="setCustomValidity('')" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password*'"></asp:TextBox>
                            
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div>
                                                  <asp:TextBox ID="txtConfirmpassword" Style="margin-top: 15px; border-color: darkgrey" runat="server" Width="100%" required="" oninvalid="this.setCustomValidity('Please Enter your Password.')"
                                        oninput="setCustomValidity('')" type="password" CssClass="form-control" placeholder="Confirm Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password*'"></asp:TextBox>
                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           
                            <asp:Button runat="server" type="submit" Text="Submit" ID="Btnsubmit" CssClass="btn btn-primary btn-block"></asp:Button>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <div style="text-align: center">
                                            <span>
                                                <asp:Label ID="Label1" Visible="false" runat="server" Text="Enter OTP Within "></asp:Label><asp:Label Visible="false" ID="OtpLabel" runat="server" Text="60"></asp:Label><asp:Label ID="Label2" Visible="false" runat="server" Text=" Sec"></asp:Label></span>
                                        </div>
                                    </div>
                                    <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-group">
                                <div>
                                    <asp:TextBox runat="server" Height="40px" ToolTip="Enter your OTP." Width="100%" Visible="false" type="text" CssClass="form-control" ID="TxtOTP" required="" oninvalid="this.setCustomValidity('Please Enter OTP')"
                                        oninput="setCustomValidity('')" placeholder="Enter OTP*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter OTP*'"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Button runat="server" ID="RegisterBtn" Visible="false" Text="Register" class="btn btn-primary btn-block"></asp:Button>

                            <div class="text-center" style="margin-top: 10px">
                                <table style="margin-left: auto; margin-right: auto;">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="ResendBtn" CssClass="d-block small" Visible="false" Style="color: dodgerblue" runat="server">Resend OTP?</asp:LinkButton>
                                        </td>
                                        <td style="color: dodgerblue">
                                            <asp:Label runat="server" Visible="false" ID="Slash" Text="/"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="HomeBtn2" Visible="false" class="d-block small" href="Index.aspx">Home</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="text-center">
                                <asp:LinkButton runat="server" ID="HomeBtn" class="d-block small" href="Index.aspx">Home?</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </header>

    </form>
</body>
</html>
