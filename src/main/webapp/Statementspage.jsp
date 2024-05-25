<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Statements</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="main.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="update shadow">
	<h2>Statements</h2>
	<form id="statementForm" method="post" action="Statements.jsp">
	    <% String account_id = (String) session.getAttribute("account_id"); %>
		<label for="account">Account number:</label>
		<input class="form-control" type="text" id="account" name="t1" value="<%= account_id %>" required readonly>
		
		<label for="fromDate">From Date:</label> 
		<input class="form-control" type="date" id="fromDate" name="fromDate" required>
		
        <label for="toDate">To Date:</label>
        <input class="form-control" type="date" id="toDate" name="toDate" required><br>
        
        <input class="btn" type="submit" name="b1" value="Generate Statement">
	</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
