<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <link href="UserDashboard.CSS" rel="stylesheet">
</head>
<body>
    <nav>
        <ul>
            <li><a href="Deposit.html">Deposit Funds</a></li>
            <li><a href="Withdraw.html">Withdraw Funds</a></li>
            <li><a href="Transferpage.jsp">Transfer Funds</a></li>
            <li><a href="UpdateCustomer.jsp">Update Customer</a></li>
            <li><a href="Statementspage.jsp">Statements</a></li>
            <li>
                <form method="post" action="logout.jsp">
                    <button type="submit">Logout</button>
                </form>
            </li>
            <li>
                <form method="post" action="ViewBalance.jsp">
                    <button type="submit" value="Balance" name="b1">View Balance</button>
                </form>
            </li>
        </ul>
    </nav>
    <h1>Welcome <%= session.getAttribute("name") %></h1>
    <div>
        <p>User name: <%= session.getAttribute("username") %></p>
        <p>Customer ID: <%= session.getAttribute("customer_id") %></p>
        <p>Account number: <%= session.getAttribute("account_id") %></p>
        <p>Contact: <%= session.getAttribute("contact") %></p>
        <p>gender: <%= session.getAttribute("gender") %></p>
        <p>Aadhar number: <%= session.getAttribute("aadhar_number") %></p>
        <p>Pancard number : <%= session.getAttribute("pancard_number") %></p>
        <p>Address: <%= session.getAttribute("address") %></p>
        <p>Email: <%= session.getAttribute("email") %></p>
        <p>Other Details: <%= session.getAttribute("other_details") %></p>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
