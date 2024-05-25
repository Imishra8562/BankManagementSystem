<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Funds</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
    <link href="main.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
<div class="Funds shadow">
    <h2>Transfer Funds</h2>
    <form action="Transfer.jsp" method="post">
        
        <% String account_id = (String) session.getAttribute("account_id"); %>
        
        <label for="accountNumber">Sender  Account Number:</label>
        <input class="form-control" type="number" id="accountNumber" name="t1" value="<%= account_id %>" required readonly>

        <label for="recipientAccountNumber">Recipient's Account Number:</label>
        <input  class="form-control" type="number" id="recipientAccountNumber" name="t2" placeholder="Enter Account Number" required>

        <label for="amount">Enter Amount to Transfer:</label><br>
        <input class="form-control" type="number" id="amount" name="t3" min="0" required>

        <label for="timestamp">Date-Time:</label>
        <input class="form-control" type="text" id="timestamp" name="t4" readonly><br>

        <input class="btn"type="submit" value="Transfer" name="b1">
    </form>
    </div>
    <script>
        // Get current date and time
        var now = new Date();
        // Format the date and time
        var formattedDateTime = now.toISOString().slice(0, 19).replace('T', ' ');
        // Set the value of the timestamp input field
        document.getElementById("timestamp").value = formattedDateTime;
    </script>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
