<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Action Page</title>
    </head>
    <body>
        <%
            
        int scheduleId;
        scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        
        try {
            Connection connection;
            PreparedStatement pstm;

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = 
            DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ScheduleProject", "root", "96913841aB0@");

            String url = 
            "DELETE FROM Schedules WHERE scheduleId = ?";

            pstm = connection.prepareStatement(url);
            pstm.setInt(1, scheduleId);
            int res = pstm.executeUpdate();
            
            if (res == 0) out.print("Error: Not Found");
            else out.print("Sucess");
        } 
        catch (Exception e) {
            out.print("Error: " + e);
        }
    %>
    </body>
</html>
