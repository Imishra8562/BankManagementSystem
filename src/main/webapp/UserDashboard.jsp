<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">
    <style>
        nav {
            background-color: rgb(128, 255, 255); 
            padding: 10px; 
        }

        ul {
            list-style-type: none; 
            margin: 0; 
            padding: 0; 
        }

        li {
            display: inline; 
            margin-right: 20px; 
        }

        li a {
            color: black;
            text-decoration: none;
        }

        li a:hover {
            text-decoration: underline;
        }
    </style>
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
</body>
</html>
