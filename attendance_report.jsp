<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Attendance Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2 class="text-center mb-4">Attendance Report</h2>

  <table class="table table-bordered text-center align-middle">
    <thead class="table-dark">
      <tr>
        <th>Roll No</th>
        <th>Name</th>
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

      // Query: calculate percentage based on full_day_status
String sql = "SELECT s.roll_number, s.student_name, " +
             "SUM(CASE WHEN a.full_day_status='Present' THEN 1 ELSE 0 END) AS present_days, " +
             "SUM(CASE WHEN a.full_day_status='Absent' THEN 1 ELSE 0 END) AS absent_days, " +
             "COUNT(a.date) AS total_days, " +
             "ROUND((SUM(CASE WHEN a.full_day_status='Present' THEN 1 ELSE 0 END) / COUNT(a.date)) * 100,2) AS percentage " +
             "FROM students s LEFT JOIN attendance a ON s.roll_number=a.roll_number " +
             "GROUP BY s.roll_number, s.student_name";


      ResultSet rs = st.executeQuery(sql);
      while(rs.next()){
    %>
      <tr>
        <td><%= rs.getString("roll_number") %></td>
        <td><%= rs.getString("student_name") %></td>
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
    