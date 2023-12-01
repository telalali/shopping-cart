<%@page import="com.shoppingcart.connection.DbCon" %>
<%@page import="com.shoppingcart.doa.ProductDoa" %>
<%@page import="com.shoppingcart.model.*" %>
<%@page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	ProductDoa pd = new ProductDoa(DbCon.getConnection());
	List<Product> products = pd.getAllProducts();

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){	
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shopping Cart Final Project</title>
<%@include file = "includes/header.jsp"%>

</head>
<body>

<div class="container">
<%@include file = "includes/navbar.jsp"%>
<div class = "container">
	<div class="card-header my-3"> All Products</div>
	
		<div class="row">

				<%
			if(!products.isEmpty()){
				for(Product p: products){
					
					%>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
			 		 <img src="Images/<%= p.getImage() %>" class="card-img-top" alt="...">
			 		<div class="card-body">
			   			<h5 class="card-title"><%= p.getName() %></h5>
			   			<h6 class="price">Price: $<%= p.getPrice() %></h6>
			   			<h6 class="category">Category: <%= p.getCategory() %></h6>
			    		<div class="mt-3 d-flex justify-content-between">
			    		<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-success">Add to Cart</a>
			    		<a href="order-now?id=<%= p.getId() %>&quantity=0" class="btn btn-primary">Buy Now</a>
			    		</div>    
			  		</div>
				</div>
			</div>
			<%
				}
			}
		%>



			</div>



</div>


</div>

<%@include file = "includes/footer.jsp"%>
</body>
</html>