<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Account</title>
</head>
<body>
    <div align="center">
        <h2>Create New Account</h2>
        <form action="Account.jsp" method="post">
            <label for="customer_id">Customer ID:</label>
            <input type="text" id="customer_id" name="t1" value="<%= request.getAttribute("cstId") %>" required readonly><br><br>
            <label for="account_type">Account Type:</label> 
            <select id="account_type" name="t2" required>
                <option value="Savings">Savings</option>
                <option value="Current">Current</option>
            </select><br> <br>
            <label for="balance">Balance:</label> 
            <input type="number" id="balance" name="t3" step="0.01" required><br><br>
            <label for="status">Status:</label> 
            <select id="status" name="t4" required>
                <option value="open">Open</option>
                <option value="closed">Closed</option>
            </select><br> <br>
            <label for="creation_date">Creation Date:</label>
            <input type="datetime-local" id="creation_date" name="t5" required><br><br>
            <input type="submit" value="CreateAccount" name="b1">
      </form>           
    </div>
</body>
</html>