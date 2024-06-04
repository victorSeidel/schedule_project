<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>List Schedule</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <%
            try {
                Connection connection;
                PreparedStatement pstm;
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                connection = 
                DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ScheduleProject", "root", "96913841aB0@");
                
                String url = "SELECT * FROM Schedules ORDER BY scheduleDate";
                
                pstm = connection.prepareStatement(url);
                ResultSet rs = pstm.executeQuery();
                
                %>
                <table >
                   <tr>
                     <th>Name</th><th>Date</th><th>Time</th><th>Price</th><th>Alter</th><th>Delete</th>
                   </tr>                
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getString("clientName")%></td>
                        <td><%= rs.getString("scheduleDate")%></td>
                        <td><%= rs.getString("scheduleTime")%></td>
                        <td><%= rs.getString("massagePrice")%></td>
                        <td id="alterA">
                            <a href="">Alter</a>
                        </td>
                        <td id="deleteA">
                            <a href="deleteScheduleAction.jsp?scheduleId=<%=rs.getInt("scheduleId")%>">Delete</a>
                        </td>
                    </tr>
               <%
               }
               %>
               </table>
               <%
        } catch (Exception e) {
            out.print("Error: " + e);
        }
    %>   
</body>
</html>
