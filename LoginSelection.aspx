<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginSelection.aspx.cs" Inherits="Maruti_R.O_Sales.LoginSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>Login | Maruti R.O. Sales</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0a4fa3, #1e90ff);
            height: 100vh;
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
            background: white;
            width: 420px;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            animation: zoomIn 0.8s ease;
        }

        @keyframes zoomIn {
            from {
                transform: scale(0.7);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .login-box h2 {
            margin-bottom: 10px;
            color: #0a4fa3;
        }

        .login-box p {
            color: gray;
            margin-bottom: 30px;
        }

        .btn {
            width: 100%;
            padding: 14px;
            margin: 15px 0;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-admin {
            background: #0a4fa3;
            color: white;
        }

        .btn-admin:hover {
            background: #083b7a;
        }

        .btn-user {
            background: #28a745;
            color: white;
        }

        .btn-user:hover {
            background: #1e7e34;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-box">
                <h2>Login Panel</h2>
                <p>Select login type</p>

                <asp:Button ID="btnAdmin" runat="server" Text="Admin Login"
                    CssClass="btn btn-admin" OnClick="btnAdmin_Click" />

                <asp:Button ID="btnUser" runat="server" Text="User Login"
                    CssClass="btn btn-user" OnClick="btnUser_Click" />
            </div>
        </div>
    </form>
</body>
</html>