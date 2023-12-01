

<!-- getCountries.jsp -->
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List" %>
<%@page import="com.shoppingcart.model.Country" %>
<%@page import="com.shoppingcart.service.CountryProvider" %>

<!-- Add this script block to your head section -->
<script>
    // Function to fetch and update the list of countries
    function updateCountries() {
        // Make an AJAX request to get the list of countries
        // Update the 'inputCountry' select options with the received data
        // Example: You may need to replace 'getCountries.jsp' with the actual server endpoint
        $.get("getCountries.jsp", function(data) {
            $("#inputCountry").html(data);
        });
    }

    // Call the updateCountries function when the page loads
    $(document).ready(function() {
        updateCountries();
    });
</script>


<%
    List<Country> countries = CountryProvider.getCountries();
%>

<%@page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Countries</title>
</head>
<body>
    <%
        for (Country country : countries) {
    %>
        <option value="<%= country.getId() %>"><%= country.getName() %></option>
    <%
        }
    %>
</body>
</html>
