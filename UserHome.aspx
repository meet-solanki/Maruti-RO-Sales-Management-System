<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Maruti_R.O_Sales.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home</title>
    <link href="Styles.css" rel="stylesheet" />
    <style>
        body { font-family: Arial; margin:0; }
        .header { background:#007bff; color:white; padding:15px; display:flex; justify-content:space-between; align-items:center; }
        .header a { color:white; margin-left:20px; text-decoration:none; font-weight:bold; }
         .footer {
      background: #0a4fa3;
      color: white;
      text-align: center;
      padding: 12px;
      margin-top: 20px;
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
         /* SLIDER */
        .slider-container {
                            width: 100%;
                            overflow: hidden;
                            background: transparent;
                            padding: 30px 0;
                            }

        .slider {
                 display: flex;
                 width: max-content;
                 animation: slide 20s linear infinite;
                 }

        @keyframes slide {
                         from { transform: translateX(0); }
                         to { transform: translateX(-50%); }
                          }
                .product {
            width: 220px;
            height: 320px;
            background: white;
            margin: 0 15px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
            padding: 10px;
            flex-shrink: 0;
        }

        .product img {
            width: 180px;
            height: 140px;
            object-fit: contain;
        }

        .product h3 {
            font-size: 16px;
            margin: 10px 0;
        }

        .price {
            color: #0a4fa3;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .products-wrapper {
    display: flex;
    flex-wrap: nowrap;        /* 🔥 FORCE SINGLE LINE */
    justify-content: center;
    gap: 20px;
    padding: 40px 20px;
    overflow-x: auto;         /* scroll if screen small */
}

        .products { display:flex; overflow-x:auto; scroll-behavior:smooth; padding:20px; gap:15px; }
        .product-card { min-width:200px; border:1px solid #ccc; padding:10px; border-radius:8px; text-align:center; background:white; transition: transform 0.3s; }
        .product-card:hover { transform:scale(1.05); }
        .product-card img { width:100%; height:150px; object-fit:cover; }
        .btn { background:#007bff; color:white; border:none; padding:8px 12px; cursor:pointer; border-radius:4px; }
        .btn:hover { background:#0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div>
                <span>Welcome, <asp:Label ID="lblUser" runat="server"></asp:Label></span>
            </div>
            <div>
                <a href="UserHome.aspx">Home</a>
                <asp:Button ID="btnCart" runat="server" Text="Cart" OnClick="btnCart_Click" CssClass="btn"/>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn"/>
            </div>
        </div>
         <!-- SLIDING PRODUCTS -->
 <div class="slider-container">
     <div class="slider">

         <!-- PRODUCT 1 -->
         <div class="product">
             <img src="Images/ro1.jpeg" />
             <h3>Maruti RO Classic</h3>
             <div class="price">₹9,999</div>
         </div>

         <!-- PRODUCT 2 -->
         <div class="product">
             <img src="Images/ro2.jpeg" />
             <h3>Maruti RO Advance</h3>
             <div class="price">₹12,999</div>
         </div>

         <!-- PRODUCT 3 -->
         <div class="product">
             <img src="Images/ro3.jpeg" />
             <h3>Maruti RO Premium</h3>
             <div class="price">₹15,999</div>
         </div>

         <!-- PRODUCT 4 -->
         <div class="product">
             <img src="Images/ro4.jpeg" />
             <h3>Maruti RO Ultra</h3>
             <div class="price">₹18,499</div>
         </div>

         <!-- PRODUCT 5 -->
         <div class="product">
             <img src="Images/ro5.jpeg" />
             <h3>Maruti RO Smart</h3>
             <div class="price">₹21,999</div>
         </div>

         <!-- DUPLICATE FOR SMOOTH SLIDE -->
         <div class="product">
             <img src="Images/ro1.jpeg" />
             <h3>Maruti RO Classic</h3>
             <div class="price">₹9,999</div>
         </div>

     </div>
 </div>

        <h2 style="text-align:center; margin-top:20px;">Our Products</h2>
        <div class="products">
            <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="AddToCart_Command">
                <ItemTemplate>
                    <div class="product-card">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("ProductName") %>' />
                        <h4><%# Eval("ProductName") %></h4>
                        <p>₹<%# Eval("Price") %></p>
                        <asp:Button ID="btnAddCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("ProductID") %>' CssClass="btn"/>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="footer">
            &copy; 2026 Maruti R.O Sales | All Rights Reserved
        </div>
    </form>
</body>
</html>