<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
    String btnval = request.getParameter("b1");
    try {
        if (btnval != null && btnval.equalsIgnoreCase("Generate Statement")) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
            PreparedStatement ps;
            String accountNumber = request.getParameter("t1");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            
            ps = con.prepareStatement("SELECT * FROM Transactions WHERE account_id = ?");
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            out.println("<table border='1'>");
            out.println("<tr><th>Timestamp</th><th>Transaction Type</th><th>Amount</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("timestamp") + "</td>");
                out.println("<td>" + rs.getString("transaction_type") + "</td>");
                out.println("<td>" + rs.getString("balance") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            %><input type=button value="Print" onclick="window.print()"><%
        }
    } catch (Exception e) {
        out.println(e.toString());
    } 
%>
