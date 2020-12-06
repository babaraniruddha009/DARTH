<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>www.DARTH.com
    </title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="stylesheet" type="text/css" href="flexslider.css" />
    <link rel="stylesheet" type="text/css" href="owl.min.css" />
    <link rel="stylesheet" type="text/css" href="Animate.css" />
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 40%;
        }
    </style>

</head>

<body runat="server" class="bg-dark">
    <form runat="server" method="post">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <div runat="server">
           
            <div class="container" style="width:35%">
                <div class="card card-login mx-auto mt-5" style="height: 400px">
                    <div class="card-header" style="text-align: center">
                        <h3><span>Login</span></h3>
                        
                    </div>
                    <br />
                    <div class="card-body">
                        <div class="form-group">
                            <div>
                                <asp:TextBox runat="server" Height="40px" Width="100%" ToolTip="Enter your username." type="text" CssClass="form-control" ID="UserTxt" required="" oninvalid="this.setCustomValidity('Please enter your username.')"
                                    oninput="setCustomValidity('')" placeholder="Enter Username*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Username*'"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">

                            <div>
                                <asp:TextBox runat="server" TextMode="Password" ToolTip="Enter your password."  Height="40px" Width="100%" type="text" CssClass="form-control" ID="PasswordTxt" required="" oninvalid="this.setCustomValidity('Please enter your password.')"
                                    oninput="setCustomValidity('')" placeholder="Enter Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password*'"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me" />
                                    Remember Password
             
                                </label>
                            </div>
                        </div>
                        <asp:Button runat="server" ID="BtnLogin" Text="Login" class="btn btn-primary btn-block"></asp:Button>
                        </>
       
                        <div class="text-center" style="margin-top: 10px">
                            <asp:LinkButton runat="server" class="d-block small" ID="ForgetLinkBtn" >Forgot Password?</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
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
</body>
</html>
