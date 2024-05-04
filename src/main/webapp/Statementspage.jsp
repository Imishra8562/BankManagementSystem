<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Statements</title>
</head>
<body>
	<h2>Statements</h2>
	<form id="statementForm" method="post" action="Statements.jsp">
	    <% String account_id = (String) session.getAttribute("account_id"); %>
		<label for="account">Account number:</label>
		<input type="text" id="account" name="t1" value="<%= account_id %>" required readonly><br><br>
		
		<label for="fromDate">From Date:</label> 
		<input type="date" id="fromDate" name="fromDate" required>
		
        <label for="toDate">To Date:</label>
        <input type="date" id="toDate" name="toDate" required><br><br>
        
        <input type="submit" name="b1" value="Generate Statement">
	</form>
</body>
</html>