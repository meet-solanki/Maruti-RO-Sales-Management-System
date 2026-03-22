<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicHome.aspx.cs" Inherits="Maruti_R.O_Sales.PublicHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title>Public Home Page - Maruti R.O. Sales</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        /* HEADER */
        .header {
            background: #0a4fa3;
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .header a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-size: 16px;
        }

      .top-section h1 {
          text-align: center;
    color: #0a4fa3;
    text-shadow: 0 3px 6px rgba(0,0,0,0.6);
}

.top-section p b {
      text-align: center;
    color: #ffffff;
}

.top-section p {
      text-align: center;
    color: #e6f2ff;
    text-shadow: 0 2px 5px rgba(0,0,0,0.6);
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

        .btn-cart {
            background: #0a4fa3;
            color: white;
            border: none;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-cart:hover {
            background: #083b7a;
        }
        .products-wrapper {
    display: flex;
    flex-wrap: nowrap;        /* 🔥 FORCE SINGLE LINE */
    justify-content: center;
    gap: 20px;
    padding: 40px 20px;
    overflow-x: auto;         /* scroll if screen small */
}

.product-card {
    width: 220px;
    height: 320px;
    background: #ffffff;
    border-radius: 10px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    flex-shrink: 0;           /* 🔥 IMPORTANT */
}

.product-card img {
    width: 180px;
    height: 140px;
    object-fit: contain;
}

.product-card h4 {
    margin: 10px 0 5px;
}

.product-card p {
    font-weight: bold;
    color: #0a4fa3;
}

.product-card button {
    background: #0a4fa3;
    color: white;
    border: none;
    padding: 8px 14px;
    border-radius: 5px;
    cursor: pointer;
}
        /* FOOTER */
        .footer {
            background: #0a4fa3;
            color: white;
            text-align: center;
            padding: 12px;
            margin-top: 20px;
        }
    </style>

    <script>
        function loginFirst() {
            alert("Please Login First");
        }
    </script>

</head>
<body>
    <div class="overlay">
    <!-- HEADER -->
    <div class="header">
        <div><b>Maruti R.O. Sales</b></div>
        <div>
            <a href="#">Home</a>
            <a href="LoginSelection.aspx">Login</a>
            <a href="#">Cart</a>
            <a href="#">About</a>
        </div>
    </div>
        <!-- TOP TEXT -->
<div class="top-section">
    <h1>Public Home Page</h1>
    <p><b>Best Water Purifiers for Healthy Life</b></p>
    <p>Pure Water | Trusted Service | Affordable Price</p>
</div>

    <!-- SLIDING PRODUCTS -->
    <div class="slider-container">
        <div class="slider">

            <!-- PRODUCT 1 -->
            <div class="product">
                <img src="Images/ro1.jpeg" />
                <h3>Maruti RO Classic</h3>
                <div class="price">₹9,999</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

            <!-- PRODUCT 2 -->
            <div class="product">
                <img src="Images/ro2.jpeg" />
                <h3>Maruti RO Advance</h3>
                <div class="price">₹12,999</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

            <!-- PRODUCT 3 -->
            <div class="product">
                <img src="Images/ro7.jpeg" />
                <h3>Maruti RO Premium</h3>
                <div class="price">₹15,999</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

            <!-- PRODUCT 4 -->
            <div class="product">
                <img src="Images/ro14.jpeg" />
                <h3>Maruti RO Ultra</h3>
                <div class="price">₹18,499</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

            <!-- PRODUCT 5 -->
            <div class="product">
                <img src="Images/ro11.jpeg" />
                <h3>Maruti RO Smart</h3>
                <div class="price">₹21,999</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

            <!-- DUPLICATE FOR SMOOTH SLIDE -->
            <div class="product">
                <img src="Images/ro17.jpeg" />
                <h3>Maruti RO Classic</h3>
                <div class="price">₹9,999</div>
                <button class="btn-cart" onclick="loginFirst()">Add to Cart</button>
            </div>

        </div>
    </div>
    <!-- PRODUCTS SECTION -->
<div class="products-wrapper">

    <div class="product-card">
        <img src="Images/ro1.jpeg" />
        <h4>Maruti RO Classic</h4>
        <p>₹9,999</p>
        <button onclick="loginFirst()">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="Images/ro2.jpeg" />
        <h4>Maruti RO Advance</h4>
        <p>₹12,999</p>
        <button onclick="loginFirst()">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="Images/ro11.jpeg" />
        <h4>Maruti RO Premium</h4>
        <p>₹15,999</p>
        <button onclick="loginFirst()">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="Images/ro13.jpeg" />
        <h4>Maruti RO Ultra</h4>
        <p>₹18,499</p>
        <button onclick="loginFirst()">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="Images/ro16.jpeg" />
        <h4>Maruti RO Smart</h4>
        <p>₹21,999</p>
        <button onclick="loginFirst()">Add to Cart</button>
    </div>

</div>
</div>
    <!-- FOOTER -->
    <div class="footer">
        © 2026 Maruti R.O. Sales | Pure Water, Pure Life
    </div>

</body>
</html>