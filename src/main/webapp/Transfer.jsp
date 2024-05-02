<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Funds</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String btnval = request.getParameter("b1");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
        PreparedStatement ps;
        
        if (btnval.equalsIgnoreCase("Transfer")) {
            String t1 = request.getParameter("t1");
            String t2 = request.getParameter("t2");
            String t3 = request.getParameter("t3");
            String t4 = request.getParameter("t4");

            // Retrieve current balance
            ps = con.prepareStatement("SELECT balance FROM Accounts WHERE account_id = ?");
            ps.setInt(1, Integer.parseInt(t1));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                // Check if withdrawal amount is greater than current balance
                if (Double.parseDouble(t3) <= currentBalance) {
                    // Update sender's balance
                    ps = con.prepareStatement("UPDATE Accounts SET balance = balance - ? WHERE account_id = ?");
                    ps.setDouble(1, Double.parseDouble(t3));
                    ps.setInt(2, Integer.parseInt(t1));
                    int row = ps.executeUpdate();
                    if (row > 0) {
                        // Insert sender's transaction details
                        String transaction_type = "debit"; // Assuming it's a debit transaction
                        ps = con.prepareStatement("INSERT INTO Transactions (account_id, transaction_type, balance, timestamp) VALUES (?, ?, ?, NOW())");
                        ps.setInt(1, Integer.parseInt(t1)); // account_id
                        ps.setString(2, transaction_type); 
                        ps.setDouble(3, Double.parseDouble(t3)); // balance
                        ps.executeUpdate();
                    }

                    // Retrieve updated sender's balance
                    ps = con.prepareStatement("SELECT balance FROM Accounts WHERE account_id = ?");
                    ps.setInt(1, Integer.parseInt(t1));
                    ResultSet rs1 = ps.executeQuery();
                    if (rs1.next()) {
                        double senderBalance = rs1.getDouble("balance");
                        // Display current sender's balance
                        out.println("<script>alert('Sender Current Balance: " + senderBalance + "')</script>");
                    }

                    // Check if recipient's account exists
                    ps = con.prepareStatement("SELECT * FROM Accounts WHERE account_id = ?");
                    ps.setInt(1, Integer.parseInt(t2));
                    ResultSet rs2 = ps.executeQuery();
                    if (rs2.next()) {
                        // Update recipient's balance
                        ps = con.prepareStatement("UPDATE Accounts SET balance = balance + ? WHERE account_id = ?");
                        ps.setDouble(1, Double.parseDouble(t3));
                        ps.setInt(2, Integer.parseInt(t2));
                        ps.executeUpdate();
                       
                        // Insert recipient's transaction details
                        String recipientTransactionType = "credit"; // Assuming it's a credit transaction
                        ps = con.prepareStatement("INSERT INTO Transactions (account_id, transaction_type, balance, timestamp) VALUES (?, ?, ?, NOW())");
                        ps.setInt(1, Integer.parseInt(t2)); // account_id
                        ps.setString(2, recipientTransactionType); 
                        ps.setDouble(3, Double.parseDouble(t3)); // balance
                        ps.executeUpdate();
                        // Display success message
                        out.println("<script>alert('Funds transferred successfully.')</script>");
                        %>
                        <script>
                            window.open('UserDashboard.jsp', '_self')
                        </script>
                        <%
                    } else {
                        // Display error message if recipient's account doesn't exist
                        out.println("<script>alert('Recipient account does not exist.')</script>");
                        %>
                        <script>
                            window.open('UserDashboard.jsp', '_self')
                        </script>
                        <%
                    }
                } else {
                    // Display error message if withdrawal amount exceeds balance
                    out.println("<script>alert('Insufficient balance.')</script>");
                    %>
                    <script>
                        window.open('UserDashboard.jsp', '_self')
                    </script>
                    <%
                }
            }
        }
    } catch (Exception e) { 
        out.println("<script>alert('Failed to transfer funds. Please try again.')</script>");
    }
%>
</body>
</html>
