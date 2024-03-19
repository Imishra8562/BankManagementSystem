<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account_jsp</title>
</head>
<body>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.swing.*"%>
    <%
    String btnval = request.getParameter("b1");
    if (btnval != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_automation_system", "root", "mishra");
            PreparedStatement ps;
            
            if (btnval.equalsIgnoreCase("Save")) {
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                
                ps = con.prepareStatement("insert into Accounts values(?,?,?,?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
                ps.setString(3, t3);
                ps.setString(4, t4);
                ps.executeUpdate();
                out.println("<script>alert('Record Saved......')</script>");
            } else if (btnval.equalsIgnoreCase("delete")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("delete from Accounts where Account_number=?");
                ps.setString(1, st1);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Deleted......')</script>");
                } else {
                    out.println("<script>alert('User is not present.')</script>");
                }
            } else if (btnval.equalsIgnoreCase("update")) {
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                
                ps = con.prepareStatement("update Accounts set  account_status_code=?,customer_id=?, account_type_code=? where Account_number=?");
                ps.setString(1, t3);
                ps.setString(2, t2);
                ps.setString(3, t4);
                ps.setString(4, t1);
                
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Updated......')</script>");
                } else {
                    out.println("<script>alert('User is not present.')</script>");
                }
            } else if (btnval.equalsIgnoreCase("search")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("select * from Accounts where Account_number=?");
                ps.setString(1, st1);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.println("<script>alert('Record Found: Customer ID=" + rs.getString("customer_id") + ", Account Status Code=" + rs.getString("account_status_code") + ", Account Type Code=" + rs.getString("account_type_code") + "')</script>");
                } else {
                    out.println("<script>alert('User not found.')</script>");
                }
            } else if (btnval.equalsIgnoreCase("allsearch")) {
                ps = con.prepareStatement("select * from Accounts");
                ResultSet rs = ps.executeQuery();
                out.println("<script>alert('All records:')</script>");
                while (rs.next()) {
                    out.println("<script>alert('Customer ID=" + rs.getString("customer_id") + ", Account Status Code=" + rs.getString("account_status_code") + ", Account Type Code=" + rs.getString("account_type_code") + "')</script>");
                }
            }
            
            con.close(); // Close the connection
        } catch (SQLException | ClassNotFoundException e) {
            out.println(e.toString());
        } 
    }
    %>
</body>
</html>