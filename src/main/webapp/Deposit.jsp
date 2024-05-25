<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Funds</title>
</head>
<body>
    <% 
        String btnval = request.getParameter("b1");

        if (btnval.equalsIgnoreCase("Deposit")) {
            String t1 = request.getParameter("t1");
            String t2 = request.getParameter("t2");
            String t3 = request.getParameter("t3");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
                PreparedStatement ps;
                // Update balance
                ps = con.prepareStatement("UPDATE Accounts SET balance = balance + ? WHERE account_id = ?");
                ps.setDouble(1, Double.parseDouble(t2));
                ps.setInt(2, Integer.parseInt(t1));
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<script>alert('Funds deposited successfully.')</script>");

                    // Retrieve updated balance
                    ps = con.prepareStatement("SELECT balance FROM Accounts WHERE account_id = ?");
                    ps.setInt(1, Integer.parseInt(t1));
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        double balance = rs.getDouble("balance");

                        // Display current balance
                        out.println("<script>alert('Current Balance: " + balance + "')</script>");

                        // Insert transaction details
                        String transaction_type = "credit"; // Assuming it's a credit transaction
                        String t4 = t2; // Amount deposited
                        String t5 = request.getParameter("t3");

                        ps = con.prepareStatement("INSERT INTO Transactions (account_id, transaction_type, balance, timestamp) VALUES (?, ?, ?, ?)");
                        ps.setInt(1, Integer.parseInt(t1)); // account_id
                        ps.setString(2, transaction_type); 
                        ps.setDouble(3, Double.parseDouble(t4)); // balance
                        ps.setString(4, t5);//time

                        int rowsAffected1 = ps.executeUpdate();

                        if (rowsAffected1 > 0) {
                            out.println("<script>alert('Transaction recorded successfully.')</script>");
                            %>
                            <script>
                                window.open('UserDashboard.jsp', '_self')
                            </script>
                            <%
                        } else {
                            out.println("<script>alert('Failed to record transaction details.')</script>");
                        }
                    } else {
                        out.println("<script>alert('Failed to deposit funds. Please check account number.')</script>");
                    }
                } else {
                    out.println("<script>alert('Failed to update balance. Please check account number.')</script>");
                }
            }  catch (Exception e) {
                out.println("<script>alert('An error occurred while processing your request. Please try again.')</script>");
                e.printStackTrace(); // Print stack trace to the server's error log
            }

        }
    %>
</body>
</html>
<jsp:include page="UserDashboard.jsp" />