<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
</head>
<body>
    <div class="container" id="profileDetails">
            <h1>Welcome <%= session.getAttribute("name") %></h1>
            <p>User name: <%= session.getAttribute("username") %></p>
            <p>Customer ID: <%= session.getAttribute("customer_id") %></p>
            <p>Account number: <%= session.getAttribute("account_id") %></p>
            <p>Contact: <%= session.getAttribute("contact") %></p>
            <p>gender: <%= session.getAttribute("gender") %></p>
            <p>Aadhar number: <%= session.getAttribute("aadhar_number") %></p>
            <p>Pancard number : <%= session.getAttribute("pancard_number") %></p>
            <p>Address: <%= session.getAttribute("address") %></p>
            <p>Email: <%= session.getAttribute("email") %></p>
    </div>
</body>
</html>
<jsp:include page="UserDashboard.jsp" />