<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Maruti_R.O_Sales.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <title>Admin Dashboard | Maruti R.O. Sales</title>

    <style>
        body {
            font-family: Arial;
            margin: 0;
            background: #f4f6f9;
        }

        .header {
            background: #0a4fa3;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
        }

        .header a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 16px;
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
            padding: 30px;
        }

        h2 {
            color: #0a4fa3;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            background: #0a4fa3;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background: #083b7a;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background: #0a4fa3;
            color: white;
        }

        img.product-img {
            width: 100px;
            height: 80px;
            object-fit: contain;
        }
        .gridview {
    width: 100%;
    border-collapse: collapse;
}

.gridview th {
    background: #0a4fa3;
    color: white;
    padding: 12px;
}

.gridview td {
    padding: 10px;
    background: white;
}

.gridview tr:hover {
    background: #f1f7ff;
    transition: 0.3s;
}

.gridview input[type=text] {
    padding: 6px;
    width: 90%;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.gridview a {
    padding: 6px 10px;
    margin: 2px;
    border-radius: 4px;
    text-decoration: none;
    font-weight: bold;
}

.gridview a[href*="Edit"] {
    background: #ffc107;
    color: black;
}

.gridview a[href*="Delete"] {
    background: #dc3545;
    color: white;
}

.gridview a[href*="Update"] {
    background: #28a745;
    color: white;
}

.gridview a[href*="Cancel"] {
    background: #6c757d;
    color: white;
}

        .section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
    </style>
    <script>
    setTimeout(function () {
        var msg = document.getElementById('<%= lblDeleteMsg.ClientID %>');
        if (msg) msg.style.display = "none";
    }, 3000);
</script>
</head>
<body>
    <form runat="server">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <div>
                <a href="PublicHome.aspx">Home</a>
                <a href="LoginSelection.aspx">Logout</a>
            </div>
        </div>

        <div class="container">

            <!-- Add Product Section -->
            <div class="section">
                <h2>Add Product</h2>
                <div class="form-group">
                    <asp:TextBox ID="txtProductName" runat="server" Placeholder="Product Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn" OnClick="btnAddProduct_Click" />
                <asp:Label ID="lblMsg" runat="server" Style="color:red;margin-left:10px;"></asp:Label>
            </div>

            <!-- View Products Section -->
            <div class="section">
                <h2>All Products</h2>
       <asp:Label ID="lblDeleteMsg" runat="server"
    Style="display:block; margin-bottom:10px; font-weight:bold;"
    ForeColor="Green">
</asp:Label>
              <asp:GridView ID="GridViewProducts" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="ProductID"
    OnRowEditing="GridViewProducts_RowEditing"
    OnRowCancelingEdit="GridViewProducts_RowCancelingEdit"
    OnRowUpdating="GridViewProducts_RowUpdating"
    OnRowDeleting="GridViewProducts_RowDeleting"
    CssClass="gridview"
>
    <Columns>
       
        <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />

        <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
                <%# Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditName" runat="server"
                    Text='<%# Bind("ProductName") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                ₹ <%# Eval("Price") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditPrice" runat="server"
                    Text='<%# Bind("Price") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:ImageField DataImageUrlField="ImagePath"
            HeaderText="Image"
            ControlStyle-Width="100px"
            ControlStyle-Height="80px" />

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

    </Columns>
               
</asp:GridView>
                               
            </div>

            <!-- View Orders Section -->
            <div class="section">
                <h2>All Orders</h2>
                <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product" />
                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField DataField="Email" HeaderText="Customer Email" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
