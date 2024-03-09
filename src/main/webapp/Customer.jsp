<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer_jsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.swing.*"%>
	<%
	String btnval = request.getParameter("b1");
	if (btnval.equalsIgnoreCase("Save")) {
		String t1 = request.getParameter("t1");
		String t2 = request.getParameter("t2");
		String t3 = request.getParameter("t3");
		String t4 = request.getParameter("t4");
		String t5 = request.getParameter("t5");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_automation_system", "root",
			"mishra");
			PreparedStatement ps = con.prepareStatement("insert into Customer values(?,?,?,?,?)");
			ps.setString(1, t1);
			ps.setString(2, t2);
			ps.setString(3, t3);
			ps.setString(4, t4);
			ps.setString(5, t5);
			ps.executeUpdate();
			out.println("<script>alert('Record Saved......')</script>");
		} catch (Exception e) {
			out.println(e.toString());
		}
	} //End of save
	%>
</body>
</html>