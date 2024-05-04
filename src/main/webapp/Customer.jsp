<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer_jsp</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
    String btnval = request.getParameter("b1");
    String Query = "SELECT " +
        "C.customer_id, " +
        "C.username, " +
        "A.account_id, " +
        "C.name, " +
        "C.gender, " +
        "C.contact, " +
        "C.address, " +
        "C.email, " +
        "C.aadhar_number, " +
        "C.pancard_number, " +
        "C.other_details " +
    "FROM " +
        "Customers C " +
    "JOIN " +
        "Accounts A ON C.customer_id = A.customer_id";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root", "mishra");
            PreparedStatement ps;
            
            if (btnval.equalsIgnoreCase("Submit")) {
                // Insert operation
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String gender = request.getParameter("gender");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                String t5 = request.getParameter("t5");
                String t6 = request.getParameter("t6");
                String t7 = request.getParameter("t7");
                String t8 = request.getParameter("t8");
                ps = con.prepareStatement("INSERT INTO Customers(username,name,gender,contact,address,email,aadhar_number,pancard_number ,other_details)VALUES (?, ?,?, ?, ?, ?,?,?,?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
                ps.setString(3, gender);
                ps.setString(4, t3);
                ps.setString(5, t4);
                ps.setString(6, t5);
                ps.setString(7, t6);
                ps.setString(8, t7);
                ps.setString(9, t8);
                ps.executeUpdate();
             // Retrieve customer_id
                ps = con.prepareStatement("SELECT customer_id FROM Customers WHERE username = ?");
                ps.setString(1, t1);
                ResultSet rs = ps.executeQuery();
                
                String customer_id = null; // Declare customer_id outside the if block
                
                if (rs.next()) {
                    customer_id = rs.getString("customer_id");
                }
                
                if (customer_id != null) {
                    request.setAttribute("cstId", customer_id);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/CreateAccount.jsp");
                    rd.forward(request, response);
                }
            } else if (btnval.equalsIgnoreCase("Search")) {
                // Search operation
                String t1 = request.getParameter("t1");
                ps = con.prepareStatement("SELECT * FROM Customers WHERE Customer_id=?");
                ps.setString(1, t1);
                ResultSet rs = ps.executeQuery(Query);
                if (rs.next()) {
            %>
                    <table border="1">
                        <tr>
                            <th>Customer Id</th>
                            <th>User name</th>
                            <th>Account Number</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>AadharCard number</th>
                            <th>PanCard number</th>
                            <th>Other Details</th>
                        </tr>
            <%
                    do {
            %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(9)%></td>
                            <td><%=rs.getString(10)%></td>
                            <td><%=rs.getString(11)%></td>
                        </tr>
            <%
                    } while (rs.next());
            %>
                    </table>
            <%
                } else {
                    out.println("<script>alert('User not found.')</script>");
                }
            } else if(btnval.equalsIgnoreCase("Allsearch")) {
            	
                ps = con.prepareStatement(Query);
                ResultSet rs = ps.executeQuery();
            %>
                <table border="1">
                    <tr>
                        <th>Customer Id</th>
                        <th>User name</th>
                        <th>Account Number</th>
                        <th>Name</th>
                        <th>gender</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>AadharCard number</th>
                        <th>PanCard number</th>
                        <th>Other Details</th>
                    </tr>
            <%
                while (rs.next()) {
            %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(11)%></td>
                    </tr>
            <% 
                }
            %>
                </table>
            <%
            } else if (btnval.equalsIgnoreCase("Delete")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("DELETE FROM Transactions WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = ?)");
                ps.setString(1, st1);
                ps.executeUpdate();
                ps = con.prepareStatement("DELETE FROM Accounts WHERE customer_id =?");
                ps.setString(1, st1);
                ps.executeUpdate();
                ps = con.prepareStatement("delete from Customers where Customer_id=?");
                ps.setString(1, st1);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Deleted......')</script>");
                } else {
                    out.println("<script>alert(' Check Customer_id ')</script>");
                }
            } else if (btnval.equalsIgnoreCase("Update")) {
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                String t5 = request.getParameter("t5");
                String t6 = request.getParameter("t6");
                ps = con.prepareStatement("UPDATE Customers SET name=?, contact=?, address=?, email=?, other_details=? WHERE customer_id=?");
                ps.setString(1, t2);
                ps.setString(2, t3);
                ps.setString(3, t4);
                ps.setString(4, t5);
                ps.setString(5, t6);
                ps.setString(6, t1);
                
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Updated......')</script>");
                    response.sendRedirect("UserDashboard.jsp");
                } else {
                    out.println("<script>alert('Check Customer ID.')</script>");
                }
            } 
        } catch (Exception e) {
            out.println(e.toString());
        }
%>
</body>
</html>
	         