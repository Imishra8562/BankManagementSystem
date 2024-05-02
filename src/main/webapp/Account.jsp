<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account_jsp</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%

    String btnval = request.getParameter("b1");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
            PreparedStatement ps;
            if (btnval.equalsIgnoreCase("CreateAccount")) {
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                String t5 = request.getParameter("t5");

                ps = con.prepareStatement("INSERT INTO Accounts (customer_id, account_type, balance, status, creation_date) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
                ps.setString(3, t3);
                ps.setString(4, t4);
                ps.setString(5, t5);
                ps.executeUpdate();
                out.println("<script>alert('Record Saved......')</script>");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.html");
                rd.forward(request, response);
            } else if (btnval.equalsIgnoreCase("CloseAccount")) {
                String t1 = request.getParameter("t1");
                ps = con.prepareStatement("UPDATE Accounts SET status = 'closed' WHERE account_id = ?");
                ps.setString(1, t1);
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("<script>alert('Account closed successfully')</script>");
                } else {
                    out.println("<script>alert('Failed to close account. Please try again.')</script>");
                }
            } 
        } catch (Exception e) {
            out.println(e.toString());
        } 
 %>
</body>
</html>
