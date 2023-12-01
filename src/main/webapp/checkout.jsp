<%@page import="com.shoppingcart.connection.DbCon" %>
<%@page import="com.shoppingcart.doa.ProductDoa" %>
<%@page import="com.shoppingcart.model.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User)request.getSession().getAttribute("auth");
    if(auth != null){
        request.setAttribute("person", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

    List<Cart> cartProduct = null;
    double total = 0.0;

    if(cart_list != null) {
        ProductDoa pDao = new ProductDoa(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Shopping Cart - Checkout Page</title>
    <%@include file ="includes/header.jsp" %>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 20px;
        }

        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        .payment {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form {
            margin-top: 20px;
        }

        .card,
        .card-grp {
            margin-bottom: 20px;
        }

        .card-item {
            flex: 1;
        }

        .label {
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .input {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .space {
            margin-right: 10px;
        }

        .icon-relative {
            position: relative;
        }

        .icon-relative i {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .total-amount {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file ="includes/navbar.jsp" %>
        <div class="wrapper">
            <div class="payment">
                <h2>Payment Gateway</h2>
                <div class="form">
                    <div class="card space icon-relative">
                        <label class="label">Card holder:</label>
                        <input type="text" class="input" placeholder="Coding Market">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="card space icon-relative">
                        <label class="label">Card number:</label>
                        <input type="text" class="input" data-mask="0000 0000 0000 0000" placeholder="Card Number">
                        <i class="far fa-credit-card"></i>
                    </div>
                    <div class="card-grp space">
                        <div class="card-item icon-relative">
                            <label class="label">Expiry date:</label>
                            <input type="text" name="expiry-data" class="input" data-mask="00 / 00" placeholder="00 / 00">
                            <i class="far fa-calendar-alt"></i>
                        </div>
                        <div class="card-item icon-relative">
                            <label class="label">CVC:</label>
                            <input type="text" class="input" data-mask="000" placeholder="000">
                            <i class="fas fa-lock"></i>
                        </div>
                    </div>

                    <div class="total-amount">
                        <label class="label">Total Amount:</label>
                        <input type="text" class="input" value="$<%= dcf.format(total) %>" readonly>
                    </div>

                    <div class="btn btn-success">
                        Pay
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file ="includes/footer.jsp" %>
</body>
</html>
