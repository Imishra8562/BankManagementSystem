<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
    String btnval = request.getParameter("b1");
    try {
        if (btnval != null && btnval.equalsIgnoreCase("Generate Statement")) {
            String accountNumber = request.getParameter("t1");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");

            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");

            // Prepare SQL query to select transactions within the specified date range
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Transactions WHERE account_id = ? AND timestamp BETWEEN ? AND ?");
            ps.setString(1, accountNumber);
            ps.setDate(2, java.sql.Date.valueOf(fromDate));
            ps.setDate(3, java.sql.Date.valueOf(toDate));
            
            // Execute the query
            ResultSet rs = ps.executeQuery();
            
            // Display the table header
            out.println("<table border='1'>");
            out.println("<tr><th>Timestamp</th><th>Transaction Type</th><th>Amount</th></tr>");
            
            // Iterate through the result set and display each transaction
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("timestamp") + "</td>");
                out.println("<td>" + rs.getString("transaction_type") + "</td>");
                out.println("<td>" + rs.getString("balance") + "</td>");
                out.println("</tr>");
            }
            
            // Close the table
            out.println("</table>");
        }
    } catch (Exception e) {
        out.println(e.toString());
    } 
%>
<input type="button" value="Print" onclick="window.print()">
