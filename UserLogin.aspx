<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Maruti_R.O_Sales.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
   <title>User Login</title>
<style>
body{
    height:100vh;
    background:linear-gradient(135deg,#000428,#004e92);
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
    width:380px;
    padding:30px;
    border-radius:12px;
    animation:fade 0.8s;
}
@keyframes fade{
    from{opacity:0;transform:scale(0.9)}
    to{opacity:1;transform:scale(1)}
}
input,button{
    width:100%;
    padding:12px;
    margin:10px 0;
}
button{
    background:#004e92;
    color:white;
    border:none;
}
a{text-decoration:none;color:#004e92}
</style>
</head>

<body>
<form runat="server">
<div class="card">
    <h2 align="center">User Login</h2>

    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />

    <asp:Button Text="Login" runat="server" OnClick="Login_Click" />
    <asp:Label ID="lblMsg" runat="server" />

    <p align="center">
        <a href="ForgotPassword.aspx">Forgot Password?</a><br />
        <a href="UserRegister.aspx">Create Account</a>
    </p>
</div>
</form>
</body>
</html>