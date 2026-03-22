<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Maruti_R.O_Sales.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Forgot Password</title>
<style>
body{
    height:100vh;
    background:linear-gradient(135deg,#232526,#414345);
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Segoe UI;
}
        body {
    margin: 0;
    font-family: Arial, sans-serif;

    background-image: url('Images/background.jpeg');
    background-size: cover;        /* full screen */
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;  /* smooth effect */
}
.card{
    background:white;
    width:400px;
    padding:30px;
    border-radius:12px;
}
input,button{
    width:100%;
    padding:12px;
    margin:8px 0;
}
button{background:#232526;color:white;border:none}
</style>
</head>

<body>
<form runat="server">
<div class="card">
    <h2 align="center">Forgot Password</h2>

    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
    <asp:Button Text="Send OTP" runat="server" OnClick="SendOTP_Click" />

    <asp:TextBox ID="txtOTP" runat="server" placeholder="Enter OTP" />
    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" placeholder="New Password" />

    <asp:Button Text="Reset Password" runat="server" OnClick="Reset_Click" />
    <asp:Label ID="lblMsg" runat="server" />
</div>
</form>
</body>
</html>