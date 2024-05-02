<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Funds</title>
</head>
<body>
    <h2>Transfer Funds</h2>
    <form action="Transfer.jsp" method="post">
        
        <% String account_id = (String) session.getAttribute("account_id"); %>
        
        <label for="accountNumber">Sender  Account Number:</label><br>
        <input type="number" id="accountNumber" name="t1" value="<%= account_id %>" required readonly><br><br>

        <label for="recipientAccountNumber">Recipient's Account Number:</label><br>
        <input type="number" id="recipientAccountNumber" name="t2" placeholder="Enter Account Number" required><br><br>

        <label for="amount">Enter Amount to Transfer:</label><br>
        <input type="number" id="amount" name="t3" min="0" required><br><br>

        <label for="timestamp">Date-Time:</label>
        <input type="text" id="timestamp" name="t4" readonly><br><br>

        <input type="submit" value="Transfer" name="b1">
    </form>
    <script>
        // Get current date and time
        var now = new Date();
        // Format the date and time
        var formattedDateTime = now.toISOString().slice(0, 19).replace('T', ' ');
        // Set the value of the timestamp input field
        document.getElementById("timestamp").value = formattedDateTime;
    </script>
</body>
</html>
