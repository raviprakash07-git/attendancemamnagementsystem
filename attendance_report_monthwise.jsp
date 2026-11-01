<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Monthly Attendance Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2 class="text-center mb-4">Monthly Attendance Report</h2>

  <table class="table table-bordered text-center align-middle">
    <thead class="table-dark">
      <tr>
        <th>Roll No</th>
        <th>Name</th>
        <th>Month</th>
        <th>Present Days</th>
             <th>Absent Days</th>
        <th>Total Days</th>
        <th>Percentage</th>
      </tr>
    </thead>
    <tbody>
    <%
      Connection con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/college_attendance","root","ravi@2007");
      Statement st = con.createStatement();

      // Month-wise attendance calculation
      String sql = "SELECT s.roll_number, s.student_name, " +
             "MONTH(a.date) AS month_num, " +
             "SUM(CASE WHEN a.full_day_status='Present' THEN 1 ELSE 0 END) AS present_days, " +
             "SUM(CASE WHEN a.full_day_status='Absent' THEN 1 ELSE 0 END) AS absent_days, " +
             "COUNT(a.date) AS total_days, " +
             "ROUND((SUM(CASE WHEN a.full_day_status='Present' THEN 1 ELSE 0 END)/COUNT(a.date))*100,2) AS percentage " +
             "FROM students s LEFT JOIN attendance a ON s.roll_number=a.roll_number " +
             "GROUP BY s.roll_number, s.student_name, MONTH(a.date) " +
             "ORDER BY s.roll_number, month_num";

      ResultSet rs = st.executeQuery(sql);
      while(rs.next()){
        int monthNum = rs.getInt("month_num");
        String monthName = "November";
        switch(monthNum){
          case 1: monthName="January"; break;
          case 2: monthName="February"; break;
          case 3: monthName="March"; break;
          case 4: monthName="April"; break;
          case 5: monthName="May"; break;
          case 6: monthName="June"; break;
          case 7: monthName="July"; break;
          case 8: monthName="August"; break;
          case 9: monthName="September"; break;
          case 10: monthName="October"; break;
          case 11: monthName="November"; break;
          case 12: monthName="December"; break;
        }
    %>
      <tr>
        <td><%= rs.getString("roll_number") %></td>
        <td><%= rs.getString("student_name") %></td>
        <td><%= monthName %></td>
        <td><%= rs.getInt("present_days") %></td>
         <td><%= rs.getInt("absent_days") %></td>
        <td><%= rs.getInt("total_days") %></td>
        <td><%= rs.getDouble("percentage") %> %</td>
      </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>

</body>
</html>
    