<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Maruti_R.O_Sales.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout / Print Bill</title>
    <style>
       body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-image: url('Images/background.jpeg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

/* Invoice Card */
.invoice-box {
    width: 85%;
    margin: 30px auto;
    background: rgba(255, 255, 255, 0.92);
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.25);
}

/* Title */
.invoice-title {
    text-align: center;
    color: #0a4fa3;
    margin-bottom: 5px;
}

.invoice-sub {
    text-align: center;
    color: #555;
    margin-bottom: 20px;
}

/* Table */
.invoice-table {
    width: 100%;
    border-collapse: collapse;
}

.invoice-table th {
    background: #0a4fa3;
    color: white;
    padding: 10px;
}

.invoice-table td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}

/* Grand total */
.grand-total {
    text-align: right;
    font-size: 18px;
    font-weight: bold;
    margin-top: 15px;
    color: #0a4fa3;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Checkout / Invoice</h2>

       <div class="invoice-box" id="printDiv">

    <h2 class="invoice-title">Maruti R.O. Sales</h2>
    <p class="invoice-sub">Checkout / Invoice</p>

    <asp:Repeater ID="rptCheckout" runat="server">
        <HeaderTemplate>
            <table class="invoice-table">
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

    <div class="grand-total">
        Grand Total : ₹ <asp:Label ID="lblGrandTotal" runat="server" />
    </div>

</div>
        </div>

        <div style="text-align:center; margin-top:20px;">
           <asp:Button ID="btnPrint" runat="server"
    Text="Print Bill"
    CssClass="btn"
    OnClientClick="printDiv(); return false;" />
        </div>

        <script type="text/javascript">
            function printDiv() {
                var divContents = document.getElementById('printDiv').innerHTML;
                var a = window.open('', '', 'height=500, width=800');
                a.document.write('<html>');
                a.document.write('<body>');
                a.document.write(divContents);
                a.document.write('</body></html>');
                a.document.close();
                a.print();
            }
        </script>
    </form>
</body>
</html>