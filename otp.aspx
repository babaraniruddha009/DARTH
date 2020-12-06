<%@ Page Language="VB" AutoEventWireup="false" CodeFile="otp.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta content="Doctor Website" charset="utf-8" />
    <title>www.DARTH.com/SignUp.aspx
    </title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="Div1" class="banner1" runat="server">
            <header runat="server">
                <div id="Div2" class="hat" runat="server">
                    <table>
                        <tr>
                            <td style="padding-top: 1%;">
                                <h1>
                                    <asp:Image ID="Image1" Height="45px" Width="45px" ImageUrl="~/Images/icons8-heart-with-pulse-filled-50.png" runat="server" />
                                    <span class="Title-color">DARTH</span>
                                </h1>
                            </td>
                            <td style="position: absolute; top: 20px; right: 7%; text-align: right">
                                <asp:Label ID="Label1" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Email : aniruddha.babar273@gmail.com"></asp:Label>
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
                                <a class="nav-link" href="#"><b>Home</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#AboutUs"><b>About</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><b>Services</b></a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Index.aspx/#Gallery"><b>Gallery</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#ContactUs"><b>Contact</b></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="nav1" runat="server" style="position:absolute; width:50%;left:25%; height:50% ;top:55%">
            <br />
            <br />
            <br />
             <table>
          
           <tr>
           <td>   &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;<asp:Label ID="otplbl" ForeColor="#4e4949" runat="server" Font-Size="Large" Text="Enter OTP"></asp:Label></td>
           </tr>
          <tr>
          <td></td>
          </tr>
          <tr>
          <td></td>
          </tr>
           <tr>
           <td>
             &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp<asp:TextBox ID="otpetxt" Font-Size="Large" runat="server"></asp:TextBox></td>
               
           </tr>
           <tr>
           <td></td></tr>
           <tr>
           
          <td>
           &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp; 
               <asp:Button ID="Confirmbtn" runat="server" Text="Confirm" /></td>
           </tr>
           <tr>
           <td>
               &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;  &nbsp;   &nbsp;   &nbsp;   &nbsp&nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;   <asp:Button ID="resendbtn" runat="server" Text="Resend OTP ?" 
                   BorderStyle="None" /></td>
           </tr>
           <tr>
           <td>
               <asp:Label ID="Lblmsg" runat="server" Text=""></asp:Label></td>
           </tr>
          
           </table>
           
           
            </div>
    </div>
    <div id="ContactUs" style="background-color: black; height: 250px; width: auto;">
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
                        <table>
                            <tr>
                                <td>
                                    <h3 style="color: white; text-align: center">Contact Us</h3>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="200px" type="text" placeholder="Name"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" type="text" Width="200px" placeholder="Email"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" type="text" Width="200px" placeholder="Contact"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" type="text" Width="200px" TextMode="MultiLine" placeholder="Message"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Width="200px" OnClientClick="javascript:alert('Contact number is send to your Email.');" Text="Submit" BackColor="#FF4181" CssClass="offset-sm-0" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
