<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Accounts</title>
</head>
<body>
<div align="center">
    <h2>View Accounts</h2>
    
    <form action="ViewAccounts.jsp" method="get">
        <label for="search_by">Search By:</label>
        <select id="search_by" name="search_by">
            <option value="account_id">Account Number</option>
            <option value="name">Customer Name</option>
        </select>
        <input type="text" name="search_value" placeholder="Enter Search Value">
        <button type="submit">Search</button>
    </form>
    
    <% 
        String searchBy = request.getParameter("search_by");
        String searchValue = request.getParameter("search_value");
 
        if (searchBy != null && searchValue != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
                
                PreparedStatement ps;
                ResultSet rs;
                
                if (searchBy.equals("name")) {
                    // Search in Customers table
                    ps = con.prepareStatement("SELECT * FROM Customers WHERE name = ?");
                    ps.setString(1, searchValue);
                    rs = ps.executeQuery();
                    
                    out.println("<h3>Customer Details</h3>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Customer ID</th><th>Name</th><th>Contact</th><th>Address</th><th>Email</th><th>Other Details</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("customer_id") + "</td>");
                        out.println("<td>" + rs.getString("name") + "</td>");
                        out.println("<td>" + rs.getString("contact") + "</td>");
                        out.println("<td>" + rs.getString("address") + "</td>");
                        out.println("<td>" + rs.getString("email") + "</td>");
                        out.println("<td>" + rs.getString("other_details") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } else if (searchBy.equals("account_id")) {
                    // Search in Accounts table
                    ps = con.prepareStatement("SELECT * FROM Accounts WHERE account_id = ?");
                    ps.setString(1, searchValue);
                    rs = ps.executeQuery();
                    
                    out.println("<h3>Account Details</h3>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Account ID</th><th>Customer ID</th><th>Account Type</th><th>Current Balance</th><th>Status</th><th>Creation Date</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("account_id") + "</td>");
                        out.println("<td>" + rs.getString("customer_id") + "</td>");
                        out.println("<td>" + rs.getString("account_type") + "</td>");
                        out.println("<td>" + rs.getString("balance") + "</td>");
                        out.println("<td>" + rs.getString("status") + "</td>");
                        out.println("<td>" + rs.getString("creation_date") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                 } 
                 } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</div>
</body>
</html>
