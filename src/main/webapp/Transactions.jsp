<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction_jsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.swing.*"%>
	<%
	String btnval = request.getParameter("b1");
	if (btnval != null) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_automation_system", "root",
			"mishra");
			PreparedStatement ps;

			if (btnval.equalsIgnoreCase("Save")) {
		       String t1 = request.getParameter("t1");
		       String t2 = request.getParameter("t2");
		       String t3 = request.getParameter("t3");
		       String t4 = request.getParameter("t4");
		       String t5 = request.getParameter("t5");

		       ps = con.prepareStatement("insert into Transactions values(?,?,?,?,?)");
		       ps.setString(1, t1);
		       ps.setString(2, t2);
		       ps.setString(3, t3);
		       ps.setString(4, t4);
		       ps.setString(5, t5);
		       ps.executeUpdate();
		       out.println("<script>alert('Record Saved......')</script>");
			} else if (btnval.equalsIgnoreCase("delete")) {
		       String st1 = request.getParameter("t1");
		       ps = con.prepareStatement("delete from Transactions where Transaction_id=?");
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
		       String t5 = request.getParameter("t5");

		       ps = con.prepareStatement("update Transactions set  Account_number=?,Trans_type_code=?,Dt_time=?,Transaction_amount=? where Transaction_id=?");
		       ps.setString(1, t2);
		       ps.setString(2, t3);
		       ps.setString(3, t4);
		       ps.setString(4, t5);
		       ps.setString(5, t1);
		       int rowsAffected = ps.executeUpdate();
		       if (rowsAffected > 0) {
			   out.println("<script>alert('Record Updated......')</script>");
		       } else {
			   out.println("<script>alert('Bank_id is not present.')</script>");
		       }
			}else if (btnval.equalsIgnoreCase("Psearch")) {
			    String st1 = request.getParameter("t1");
			    ps = con.prepareStatement("select * from Transactions where Transaction_id=?");
			    ps.setString(1, st1);
			    ResultSet rs = ps.executeQuery();
			    if (rs.next()) {
			        out.println("<script>alert('Record Found: Transaction ID=" + rs.getString("Transaction_id") + ", Account number=" + rs.getString("Account_number") + ", Trans type code=" + rs.getString("Trans_type_code") + ", Dt time=" + rs.getString("Dt_time") + ", Transaction amount=" + rs.getString("Transaction_amount") + "')</script>");
			    } else {
			        out.println("<script>alert('User not found.')</script>");
			    }
			}
else if(btnval.equalsIgnoreCase("Allsearch")) {
                ps = con.prepareStatement("SELECT * FROM Transactions");
                ResultSet rs = ps.executeQuery();
            %>
                <table border="2">
                    <tr>
                        <th>Transaction Id</th>
                        <th>Account Number</th>
                        <th>Trans_type_code</th>
                        <th>Dt_time</th>
                        <th>Transaction_amount</th>
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
                    </tr>
            <%
                }
            %>
                </table>
            <%
            }
			con.close(); // Close the connection
		} catch (SQLException | ClassNotFoundException e) {
			out.println(e.toString());
		}
	}
	%>
</body>
</html>