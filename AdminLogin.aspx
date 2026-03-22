<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Maruti_R.O_Sales.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Admin Login | Maruti R.O. Sales</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #1c3faa, #0d6efd);
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

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .login-box {
            width: 420px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.3);
            animation: slideDown 0.8s ease;
            text-align: center;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-40px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .login-box h2 {
            color: #1c3faa;
            margin-bottom: 20px;
        }

        .txt {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #1c3faa;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        .btn:hover {
            background: #142b75;
        }

        .msg {
            color: red;
            margin-top: 10px;
        }

        .back {
            margin-top: 15px;
            display: inline-block;
            color: #1c3faa;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-box">
                <h2>Admin Login</h2>

                <asp:TextBox ID="txtUsername" runat="server" CssClass="txt"
                    Placeholder="Admin Username"></asp:TextBox>

                <asp:TextBox ID="txtPassword" runat="server" CssClass="txt"
                    TextMode="Password" Placeholder="Password"></asp:TextBox>

                <asp:Button ID="btnLogin" runat="server" Text="Login"
                    CssClass="btn" OnClick="btnLogin_Click" />

                <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

                <a href="LoginSelection.aspx" class="back">← Back to Login Selection</a>
            </div>
        </div>
    </form>
</body>
</html>
