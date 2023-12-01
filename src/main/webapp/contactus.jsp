<%@page import="com.shoppingcart.connection.DbCon" %>
<%@page import="com.shoppingcart.doa.ProductDoa" %>
<%@page import="com.shoppingcart.model.*" %>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@include file ="includes/header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff;
        }

        form {
            max-width: 500px;
            margin: auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        textarea {
            resize: vertical;
        }

        #mySubmit, #myReset {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file ="includes/navbar.jsp" %>
        <h1>Contact Us</h1>
        <form method="post" action="https://webdevbasics.net/scripts/demo.php">
            <div class="form-group">
                <label for="myName">Name:</label>
                <input type="text" class="form-control" name="myName" id="myName" placeholder="Enter your Name" required>
            </div>
            <div class="form-group">
                <label for="myEmail">Email:</label>
                <input type="email" class="form-control" name="myEmail" id="myEmail" placeholder="Enter your Email" required>
            </div>
            <div class="form-group">
                <label for="myPhone">Phone:</label>
                <input type="number" class="form-control" name="myPhone" id="myPhone"  placeholder="Enter your Phone" required>
            </div>
            <div class="form-group">
                <label for="myComments">Comments:</label>
                <textarea class="form-control" name="myComments" id="myComments" placeholder="Comments" rows="4" cols="60" required></textarea>
            </div>
            <input type="submit" class="btn btn-primary" id="mySubmit" value="Submit">
            <input type="reset" class="btn btn-secondary" id="myReset" value="Reset">
        </form>
    </div>

    <%@include file ="includes/footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/ju" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</body>
</html>
