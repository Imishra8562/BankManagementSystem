<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Transactions</title>
</head>
<body>
<div align="center">
    <h2>View Transactions</h2>
    
    <form action="TransactionTracker.jsp" method="get">
        <label for="search_by">Search By:</label>
        <select id="search_by" name="search_by">
            <option value="account_id">Account Number</option>
            <option value="transaction_id">Transaction Id</option>
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
                
                if (searchBy.equals("transaction_id")) {
                    // Search in transaction table by transaction_id
                    ps = con.prepareStatement("SELECT * FROM Transactions WHERE transaction_id = ?");
                    ps.setString(1, searchValue);
                    rs = ps.executeQuery();
                    
                    out.println("<h3>Transaction Details</h3>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Transaction id</th><th>Account Number</th><th>Transaction Type</th><th>Balance</th><th>Date-Times</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("transaction_id") + "</td>");
                        out.println("<td>" + rs.getString("account_id") + "</td>");
                        out.println("<td>" + rs.getString("transaction_type") + "</td>");
                        out.println("<td>" + rs.getString("balance") + "</td>");
                        out.println("<td>" + rs.getString("timestamp") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } else if (searchBy.equals("account_id")) {
                	//Search in transaction table by account_id
                    ps = con.prepareStatement("SELECT * FROM Transactions WHERE account_id = ?");
                    ps.setString(1, searchValue);
                    rs = ps.executeQuery();
                    out.println("<h3>Transaction Details</h3>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Transaction id</th><th>Account Number</th><th>Transaction Type</th><th>Balance</th><th>Date-Times</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("transaction_id") + "</td>");
                        out.println("<td>" + rs.getString("account_id") + "</td>");
                        out.println("<td>" + rs.getString("transaction_type") + "</td>");
                        out.println("<td>" + rs.getString("balance") + "</td>");
                        out.println("<td>" + rs.getString("timestamp") + "</td>");
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
