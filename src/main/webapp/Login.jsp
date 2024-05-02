<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Management System</title>
</head>
<body>
    <%@ page import="java.sql.*" %>
    <% 
    String btnval = request.getParameter("b1");
    int f = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root","mishra");
        PreparedStatement ps;
        if (btnval.equalsIgnoreCase("login")) {
			String t1 = request.getParameter("t1");
			String t2 = request.getParameter("t2");
			out.println(t1);
			out.println(t2);
			ps = con.prepareStatement("select * from Users");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
		         if (rs.getString(1).equals(t1) && rs.getString(2).equals(t2)) {
		     	 f = 1;
			     break;
		      }
			}

			if (f == 1) {
		         ps = con.prepareStatement("SELECT Users.username, Customers.customer_id, Accounts.account_id, Customers.name, Customers.contact,Customers.gender,Customers.aadhar_number,Customers.pancard_number, Customers.address, Customers.email, Customers.other_details FROM Users JOIN Customers ON Users.username = Customers.username JOIN Accounts ON Customers.customer_id = Accounts.customer_id WHERE Users.username =?");
		         ps.setString(1, t1);
		         ResultSet rs1 = ps.executeQuery();

		         if (rs1.next()) {
			       String username = rs1.getString("username");
			       String customer_id = rs1.getString("customer_id");
			       String account_id = rs1.getString("account_id");
			       String name = rs1.getString("name");
			       String contact = rs1.getString("contact");
			       String gender = rs1.getString("gender");
			       String aadhar_number = rs1.getString("aadhar_number");
			       String pancard_number = rs1.getString("pancard_number");
			       String address = rs1.getString("address");
			       String email = rs1.getString("email");
			       String other_details = rs1.getString("other_details");

			       session.setAttribute("username", username);
			       session.setAttribute("customer_id", customer_id);
			       session.setAttribute("account_id", account_id);
			       session.setAttribute("name", name);
			       session.setAttribute("contact", contact);
			       session.setAttribute("gender", gender);
			       session.setAttribute("aadhar_number", aadhar_number);
			       session.setAttribute("pancard_number", pancard_number);
			       session.setAttribute("address", address);
			       session.setAttribute("email", email);
			       session.setAttribute("other_details", other_details);

			       response.sendRedirect("UserDashboard.jsp");
		          }
			 } else {
		     out.println("<script>alert('Incorrect ID or password. Please try again.')</script>");
			     }
		} else if (btnval != null && btnval.equals("Create User")) {
            String t1 = request.getParameter("t1");
            String t2 = request.getParameter("t2");

            ps = con.prepareStatement("SELECT * FROM Users WHERE username = ?");
            ps.setString(1, t1);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = 1; // User already exists
            }
            if (f == 1) {
                out.println("<script>alert('User already exists!')</script>");
    %>
                <script>
                    window.open('NewUser.html', '_self');
                </script>
    <%
            } else {
                // Insert the new user
                ps = con.prepareStatement("INSERT INTO Users (username, password) VALUES (?, ?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('User created.')</script>");
                    request.setAttribute("Username", t1);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/CustomerRegistration.jsp");
                    rd.forward(request, response);
                } else {
                    out.println("<script>alert('Failed to create user.')</script>");
                }
            }
        }
		else if (btnval.equalsIgnoreCase("Reset Password")) {
	         String t1 = request.getParameter("t1");
	         String t2 = request.getParameter("t2");
	         ps = con.prepareStatement("UPDATE Users SET password=? WHERE username=?");
	         ps.setString(1, t2);
	         ps.setString(2, t1);
	         int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	             out.println("<script>alert('Password changed.')</script>");
	             } else {
	                out.println("<script>alert('Enter correct username.')</script>");
	               }
	    }
    } catch (Exception e) {
        out.println(e.toString());
    }
    %>
</body>
</html>
