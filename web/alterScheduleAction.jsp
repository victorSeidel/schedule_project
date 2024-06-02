<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>New Schedule</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
        String alterClient;
        alterClient = request.getParameter("clientNameInput");
        
        String clientName, date, time, price;
        
        clientName = request.getParameter("clientNameInput");
        date = request.getParameter("dateInput");
        time = request.getParameter("timeInput");
        price =  request.getParameter("priceInput");
        
        try {
            Connection connection;
            PreparedStatement pstm;

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = 
            DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ScheduleProject", "root", "96913841aB0@");

            String url = 
            "UPDATE Schedules SET clientName = ?, scheduleDate = ?, scheduleTime = ?, massagePrice = ? "
            + "WHERE clientName = ?";

            pstm = connection.prepareStatement(url);
            pstm.setString(1, clientName);
            pstm.setString(2, date);
            pstm.setString(3, time);
            pstm.setInt(4, Integer.parseInt(price));
            pstm.setString(5, alterClient);
            pstm.executeUpdate();
            
            out.print("Sucess!");
        } 
        catch (Exception e) {
            out.print("Error: " + e);
        }
    %>
</body>
</html>
