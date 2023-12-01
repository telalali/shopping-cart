<%@page import="com.shoppingcart.model.*"%>
<%@page import="com.shoppingcart.connection.DbCon"%>
<%@page import="com.shoppingcart.doa.*" %>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);

	User auth = (User) request.getSession().getAttribute("auth");
	
	List<Order> orders = null;

	if (auth != null){
		request.setAttribute("auth", auth);
		//OrderDoa oDoa = new OrderDoa(DbCon.getConnection());
		orders = new OrderDoa(DbCon.getConnection()).userOrder(auth.getId());
		//orders = oDoa.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart_list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart - Order Page</title>
<%@include file ="includes/header.jsp" %></head>
<body>
<div class="container">
<%@include file ="includes/navbar.jsp" %>
<div class="container">

<div class="card-header my-3"> All Products</div>
	<table class="table table-light">
		<thead>
		
			<tr>
				<th scope="col">Date</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Cancel</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(orders != null){
				for(Order o: orders){
					
			
		%>
			<tr>
				<td><%= o.getDate() %></td>
				<td><%= o.getName() %></td>
				<td><%= o.getCategory() %></td>
				<td><%= o.getQuantity() %></td>
				<td><%=dcf.format(o.getPrice()) %> </td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderid() %>">Cancel Order</a> </td>
			</tr>
			<%
				}
			}
			
			%>
		
		</tbody>
	</table>
</div>

</div>




<%@include file ="includes/footer.jsp" %></body>
</html>