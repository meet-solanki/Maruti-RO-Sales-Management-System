<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Maruti_R.O_Sales.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>My Cart | Maruti R.O. Sales</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('Images/background.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Cart Card */
        .cart-box {
            width: 80%;
            margin: 30px auto;
            background: rgba(255,255,255,0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .cart-title {
            text-align: center;
            color: #0a4fa3;
            margin-bottom: 5px;
        }

        .cart-sub {
            text-align: center;
            color: #555;
            margin-bottom: 20px;
        }

        /* Table */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th {
            background: #0a4fa3;
            color: white;
            padding: 10px;
        }

        .cart-table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        .cart-table tr:hover {
            background: #f1f7ff;
            transition: 0.3s;
        }

        /* Button */
        .btn {
            background: #0a4fa3;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background: #083b7a;
        }

        @media screen and (max-width:768px) {
            .cart-box {
                width: 95%;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="cart-box">

            <h2 class="cart-title">My Cart</h2>
            <p class="cart-sub">Review your selected products</p>
 <asp:Repeater ID="rptCart" runat="server">
                <HeaderTemplate>
                    <table class="cart-table">
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ProductName") %></td>
                        <td>₹ <%# Eval("Price") %></td>
                        <td><%# Eval("Qty") %></td>
                        <td>₹ <%# Eval("Total") %></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <div style="text-align:center; margin-top:25px;">
                <asp:Button ID="btnCheckout" runat="server"
                    Text="Proceed to Checkout"
                    CssClass="btn"
                    OnClick="btnCheckout_Click" />
            </div>

        </div>

    </form>
</body>
</html>