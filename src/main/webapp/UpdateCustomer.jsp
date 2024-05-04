<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer</title>
    
</head>
<body>
<div align="center">
<h2>Update Customer</h2>

<form action="Customer.jsp" method="post">
<% String customer_id = (String) session.getAttribute("customer_id"); %>
    <table>
        <tr>
          <td><label for="name">Customer id:</label></td>
            <td><input type="text" id="Customer id" name="t1" value="<%= customer_id %>" required readonly></td>  
        </tr>
        <tr>
            <td><label for="name">Name:</label></td>
            <td><input type="text" id="name" name="t2" required></td>
        </tr>
        <tr>
            <td><label for="contact">Phone number:</label></td>
            <td><input type="text" id="contact" name="t3"></td>
        </tr>
        <tr>
            <td><label for="address">Address:</label></td>
            <td><input type="text" id="address" name="t4"></td>
        </tr>
        <tr>
            <td><label for="email">Email:</label></td>
            <td><input type="email" id="email" name="t5"></td>
        </tr>
        <tr>
            <td><label for="other_details">Other Details:</label></td>
            <td><textarea id="other_details" name="t6"></textarea></td>
        </tr>
        <tr>
            <td><input type="submit" value="Update" name="b1"></td>
        </tr>
    </table>
</form>
</div>
</body>
</html>