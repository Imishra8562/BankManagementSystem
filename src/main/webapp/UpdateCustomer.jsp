<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="update shadow">
    <h2>Update Customer</h2>
    <form action="Customer.jsp" method="post">
        <% String customer_id = (String) session.getAttribute("customer_id"); %>
        <label for="name">Customer id:</label>
        <input class="form-control" type="text" id="Customer id" name="t1" value="<%= customer_id %>" required readonly>  
        <label for="name">Name:</label>
        <input class="form-control" type="text" id="name" name="t2" required>
        <label for="contact">Phone number:</label>
        <input class="form-control" type="text" id="contact" name="t3">
        <label for="address">Address:</label>
        <input class="form-control" id="address" name="t4">
        <label for="email">Email:</label>
        <input class="form-control" type="email" id="email" name="t5"><br>
        <button class="btn" type="submit" value="Update" name="b1">Update</button>
    </form>                    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
