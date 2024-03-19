<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Addresses_jsp</title>
</head>
<body>
    <%@ page import="java.sql.*" %>
    <%
        String btnval = request.getParameter("b1");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_automation_system", "root", "mishra");
            PreparedStatement ps;

            if (btnval.equalsIgnoreCase("Save")) {
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                String t3 = request.getParameter("t3");
                String t4 = request.getParameter("t4");
                String t5 = request.getParameter("t5");
                String t6 = request.getParameter("t6");
                String t7 = request.getParameter("t7");

                ps = con.prepareStatement("insert into Addresses values(?,?,?,?,?,?,?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
                ps.setString(3, t3);
                ps.setString(4, t4);
                ps.setString(5, t5);
                ps.setString(6, t6);
                ps.setString(7, t7);
                ps.executeUpdate();
                out.println("<script>alert('Record Saved......')</script>");
            } else if (btnval.equalsIgnoreCase("delete")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("delete from Addresses where Address_id=?");
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
                String t6 = request.getParameter("t6");
                String t7 = request.getParameter("t7");
                ps = con.prepareStatement(
                        "Update Addresses set Line_1=?,Line_2=?,Town_city=?,Zip_code=?,Country=?,Other_details=? where Address_id=?");
                ps.setString(1, t2);
                ps.setString(2, t3);
                ps.setString(3, t4);
                ps.setString(4, t5);
                ps.setString(5, t6);
                ps.setString(6, t7);
                ps.setString(7, t1);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Updated......')</script>");
                } else {
                    out.println("<script>alert('User is not present.')</script>");
                }

            }else if(btnval.equalsIgnoreCase("Allsearch")) {
                ps = con.prepareStatement("SELECT * FROM Addresses");
                ResultSet rs = ps.executeQuery();
            %>
                <table border="2">
                    <tr>
                        <th>Address ID</th>
                        <th>Line 1</th>
                        <th>Line 2</th>
                        <th>Town City</th>
                        <th>Zip_code</th>
                        <th>Country</th>
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
                    </tr>
            <%
                }
            %>
                </table>
                <input type="button" value="Print" onclick="window.print()">
            <% 
                } else if (btnval.equalsIgnoreCase("PSearch")) {
                    String t1 = request.getParameter("t1");
                    ps = con.prepareStatement("select * from Addresses where Address_id=?");
                    ps.setString(1, t1);
                    ResultSet rs = ps.executeQuery();
            %>
            <table border="2">
                <tr>
                    <th>Addresses ID</th>
                    <th>Line 1</th>
                    <th>Line 2</th>
                    <th>Town City</th>
                    <th>Zip Code</th>
                    <th>Country</th>
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
                </tr>
            <% 
            } 
            %>
            </table>
            <input type="button" value="Print" onclick="window.print()">
            <% 
            }
            con.close();
        } catch (Exception e) {
            out.println("<script>alert('" + e.toString() + "')</script>");
        }
    %>
</body>
</html>
