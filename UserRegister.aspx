<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="Maruti_R.O_Sales.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>User Register</title>
<style>
body{
    margin:0;
    height:100vh;
    background:linear-gradient(135deg,#1d2671,#c33764);
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
    animation:slide 0.8s ease;
}
@keyframes slide{
    from{transform:translateY(40px);opacity:0}
    to{transform:translateY(0);opacity:1}
}
input,button{
    width:100%;
    padding:12px;
    margin:10px 0;
    border-radius:6px;
}
button{
    background:#1d2671;
    color:white;
    border:none;
    font-size:16px;
}
a{color:#1d2671;text-decoration:none}
</style>
</head>

<body>
<form runat="server">
<div class="card">
    <h2 align="center">User Register</h2>

    <asp:TextBox ID="txtName" runat="server" placeholder="Full Name" />
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />

    <asp:Button Text="Register" runat="server" OnClick="Register_Click" />
    <asp:Label ID="lblMsg" runat="server" />

    <p align="center">
        Already have account?
        <a href="UserLogin.aspx">Login</a>
    </p>
</div>
</form>
</body>
</html>