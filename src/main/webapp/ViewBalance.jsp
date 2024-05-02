<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Management System</title>
</head>
<body>
    <%@ page import="java.sql.*"%>

    <%
    String btnval = request.getParameter("b1");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
        PreparedStatement ps;
        
        if (btnval != null && btnval.equalsIgnoreCase("Balance")) {
            String account_id = (String) session.getAttribute("account_id");
            
            ps = con.prepareStatement("SELECT balance FROM Accounts WHERE account_id = ?");
            ps.setString(1, account_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double balance = rs.getDouble("balance");
    %>
                
               <script>alert('Balence :<%= balance %>')</script>
    <%
            } else {
    %>
                <div align="center">User account id not found.</div>
    <%
            }
        }
    } catch (Exception e) {
        out.println(e.toString());
    }
    %>
    <jsp:include page="UserDashboard.jsp" />
</body>
</html>
