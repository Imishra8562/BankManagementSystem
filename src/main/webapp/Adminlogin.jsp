<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_login</title>
</head>
<body>
    <%@ page import="java.sql.*"%>
    <%
    String btnval = request.getParameter("b1");
    int f = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_management_system_db", "root",
        "mishra");
        PreparedStatement ps;

        if (btnval.equalsIgnoreCase("login")) {
            String t1 = request.getParameter("t1");
            String t2 = request.getParameter("t2");

            ps = con.prepareStatement("select * from Admins");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString(1).equals(t1) && rs.getString(2).equals(t2)) {
                    f = 1;
                    break;
                }
            }

            if (f == 1) {
                %>
                <script>
                    window.open('AdminDashboard.html', '_self')
                </script>
                <%
              } else {
        out.println("<script>alert('Incorrect ID or password. Please try again.')</script>");
              }
         }
    } catch (Exception e) {
    out.println(e.toString());
    }
    %>
</body>
</html>
