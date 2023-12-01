<%@page import="com.shoppingcart.connection.DbCon" %>
<%@page import="com.shoppingcart.doa.ProductDoa" %>
<%@page import="com.shoppingcart.model.*" %>
<%@page import="java.util.*"%>

<%
    User auth = (User)request.getSession().getAttribute("auth");
    if(auth != null){
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
        request.setAttribute("cart_list", cart_list);
    }
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Your Account</title>
    <%@include file ="includes/header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <%@include file ="includes/navbar.jsp" %>
        <div class="container">
            <div class="card w-75 mx-auto my-5">
                <div class="card-header text-center">
                    <h2>Sign Up</h2>
                </div>
                <div class="card-body">
                    <form class="row g-3">
                        <div class="col-md-6">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" placeholder="First name" required>
                        </div>
                        <div class="col-md-6">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" placeholder="Last name" required>
                        </div>
                        <div class="col-md-6">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="Email" required>
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
                        </div>
                        <div class="col-12">
                            <label for="inputAddress" class="form-label">Address</label>
                            <input type="text" class="form-control" id="inputAddress" placeholder="Address" required>
                        </div>
                        <div class="col-12">
                            <label for="inputAddress2" class="form-label">Address 2</label>
                            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                        </div>
                        <div class="col-12">
                            <label for="inputCountry" class="form-label">Country</label>
                            <input type="text" class="form-control" id="inputCountry" placeholder="Country" required>
                        </div>
                        <div class="col-12">
                            <label for="inputState" class="form-label">State</label>
                            <input type="text" class="form-control" id="inputState" placeholder="State" required>
                        </div>
                        <div class="col-12">
                            <label for="inputCity" class="form-label">City</label>
                            <input type="text" class="form-control" id="inputCity" placeholder="City" required>
                        </div>
                          
					    <div class="col-md-2">
						    <label for="inputZip" class="form-label">Zip</label>
						    <input type="text" class="form-control" id="inputZip" placeholder="Zip" required>
						   </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Create Your Account</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-12 mt-3">
                <h2>Already have an account? <a href="login.jsp">Go to Login</a></h2>
            </div>
        </div>
    </div>
</body>
<%@include file = "includes/footer.jsp"%>

</html>
