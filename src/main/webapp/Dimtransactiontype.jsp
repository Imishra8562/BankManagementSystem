<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dimtransaction_jsp</title>
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
                
                ps = con.prepareStatement("insert into Dimtransaction_type values(?,?)");
                ps.setString(1, t1);
                ps.setString(2, t2);
         
                ps.executeUpdate();
                out.println("<script>alert('Record Saved......')</script>");
            } else if (btnval.equalsIgnoreCase("delete")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("delete from Dimtransaction_type where Trans_type_code=?");
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
                
                ps = con.prepareStatement("update Dimtransaction_type set  Trans_desc=? where Trans_type_code=?");
                ps.setString(1, t2);
                ps.setString(2, t1);
                
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Record Updated......')</script>");
                } else {
                    out.println("<script>alert('User is not present.')</script>");
                }
            }else if (btnval.equalsIgnoreCase("Psearch")) {
                String st1 = request.getParameter("t1");
                ps = con.prepareStatement("select * from Dimtransaction_type where Trans_type_code=?");
                ps.setString(1, st1);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.println("<script>alert('Record Found: Trans_desc=" + rs.getString("Trans_desc") + "')</script>");
                } else {
                    out.println("<script>alert('User not found.')</script>");
                }
            } else if(btnval.equalsIgnoreCase("Allsearch")) {
                ps = con.prepareStatement("SELECT * FROM Dimtransaction_type");
                ResultSet rs = ps.executeQuery();
            %>
                <table border="2">
                    <tr>
                        <th>Trans_type code</th>
                        <th>Trans_desc</th>
                    </tr>
            <%
                while (rs.next()) {
            %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
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