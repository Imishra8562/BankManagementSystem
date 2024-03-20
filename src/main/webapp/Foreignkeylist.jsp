<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Foreign key</title>
</head>
<body>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.swing.*"%>
    <%
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bank", "bank");
        Statement smt = conn.createStatement();
        ResultSet rs;
    %>
    <table>
        <tr>
            <td>Bank_id</td>
            <td>
                <select name="dm">
                    <%
                    rs = smt.executeQuery("SELECT * FROM Bank");
                    while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Addresses id</td>
            <td>
                <select name="k">
                    <%
                    rs = smt.executeQuery("SELECT * FROM addresses");
                    while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Branch_id</td>
            <td>
                <select name="bn">
                    <%
                    rs = smt.executeQuery("SELECT * FROM BRANCHES");
                    while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <!-- Add more rows for additional foreign keys -->
    </table>
    <%
    } catch (Exception e) {
        out.println(e.toString());
    }
    %>
</body>
</html>
