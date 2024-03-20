<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*"%>
<% 
String btnval=request.getParameter("b1");
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_automation_system", "root", "mishra");
    PreparedStatement ps;

    if (btnval.equalsIgnoreCase("login")) {
        String t1 = request.getParameter("t1");
        String t2 = request.getParameter("t2");
        int f = 0;
        
        ps = con.prepareStatement("select * from login");
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            if (rs.getString(1).equals(t1) && rs.getString(2).equals(t2)) {
                f = 1;
                break;
            }
        }
        
        if (f == 1) {
            out.println("<script>window.open('Menu.html','_self')</script>");
        } else {
            out.println("<script>alert('Incorrect ID or password. Please try again.')</script>");
        }
    } else if (btnval.equalsIgnoreCase("CreateUser")) {
        String t1 = request.getParameter("t1");
        String t2 = request.getParameter("t2");
        int b = 0;
        
        ps = con.prepareStatement("select * from login");
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            if (rs.getString(1).equals(t1)) {
                b = 1;
                break;
            }
        }
        
        if (b == 1) {
            out.println("<script>alert('User already exists!')</script>");
        } else {
            ps = con.prepareStatement("INSERT INTO login VALUES (?, ?)");
            ps.setString(1, t1);
            ps.setString(2, t2);
            ps.executeUpdate();
            out.println("<script>alert('User Created.')</script>");
            %>
            <script>window.open('Menu.html','_self')</script>
            <%
        }   
    } 
} catch (Exception e) {
    out.println(e.toString());
} 
%>
</body>
</html>
