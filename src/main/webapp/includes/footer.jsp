<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <!-- Add your other meta tags, style, or other head elements here -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <style>
        /* Add your custom styles here */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        footer {
            background-color: #343a40;
            padding: 20px;
            text-align: center;
            color: #fff;
        }

        .social-icons img {
            width: 40px;
            margin: 5px;
        }

        form {
            margin-top: 20px;
            text-align: center;
        }

        .form-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        label {
            margin-right: 10px;
            color: #fff;
        }

        input[type="email"] {
            width: 200px;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #343a40;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #23272b;
        }

        a {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <footer>
        <h3>Contact Us</h3>
        <p>Email: info@shoppingcart.com</p>

        <div class="social-icons">
            <img src="Images/icon1.png">
            <img src="Images/icon2.png">
            <img src="Images/icon3.png">
            <!-- Add more social media icons as needed -->
        </div>

        <div class="form-group">
            <label for="myEmail">Subscribe to our newsletter:</label>
            <input type="email" name="myEmail" id="myEmail" placeholder="Your Email">
            <button type="submit" class="btn btn-dark">Subscribe</button>
        </div>
        
        <a href="refund.jsp">Refund Policy</a>
        <a href="policy.jsp">Privacy Policy</a>
    </footer>
</body>
</html>
