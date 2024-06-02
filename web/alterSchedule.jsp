<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Alter Schedule</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
        int scheduleId;
        scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        
        String clientName, date, time, price;
        
        try {
            Connection connection;
            PreparedStatement pstm;

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = 
            DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ScheduleProject", "root", "96913841aB0@");

            String url = "SELECT * FROM Schedules WHERE scheduleId = ?";

            pstm = connection.prepareStatement(url);
            pstm.setInt(1, scheduleId);
            ResultSet rs = pstm.executeQuery();
            
            if (!rs.next()) out.print("Error: Not Found");
            else {
    %>
    <form method="post" action="alterScheduleAction.jsp?alterClient=<%=rs.getString("clientName")%>">
            <p>        
                <label for="clientName">Name:</label>
                <input type="text" name="clientNameInput" id="clientNameInput" maxlength="35" value="<%=rs.getString("clientName")%>">
            </p>
            <p>
                <label for="date">Date:</label>
                <input type="date" name="dateInput" id="dateInput" value="<%=rs.getDate("scheduleDate")%>">
            </p>
            <p>
                <label for="time">Time:</label>
                <input type="time" name="timeInput" id="timeInput" value="<%=rs.getTime("scheduleDate")%>">
            </p>
            <p>        
                <label for="clientName">Price:</label>
                <input type="number" name="priceInput" id="priceInput" value="<%=rs.getInt("massagePrice")%>">
            </p>
            <p>
                <input type="submit" name="alterBtn" id="alterBtn" value="Save">
            </p>
        </form>
    
<%
        }
    } 
        catch (Exception e) {
            out.print("Error: " + e);
        }
    %>
</body>
</html>
