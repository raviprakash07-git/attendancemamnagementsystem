<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Full Month Attendance Stars</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Charts -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Student', 'Days Present'],
        <% 
          Connection con = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/college_attendance","root","ravi@2007");
          Statement st = con.createStatement();

          // Total days in current month (attendance table base)
          String totalDaysQuery = "SELECT COUNT(DISTINCT date) AS working_days " +
                                  "FROM attendance " +
                                  "WHERE MONTH(date)=MONTH(CURDATE()) AND YEAR(date)=YEAR(CURDATE())";
          ResultSet tdRs = st.executeQuery(totalDaysQuery);
          int workingDays = 0;
          if(tdRs.next()){ workingDays = tdRs.getInt("working_days"); }

          // Students with full month attendance
          String sql = "SELECT s.student_name, COUNT(a.date) AS present_days " +
                       "FROM students s JOIN attendance a ON s.roll_number=a.roll_number " +
                       "WHERE MONTH(a.date)=MONTH(CURDATE()) AND YEAR(a.date)=YEAR(CURDATE()) " +
                       "AND a.full_day_status='Present' " +
                       "GROUP BY s.student_name " +
                       "HAVING present_days = " + workingDays;

          ResultSet rs = st.executeQuery(sql);

          StringBuilder names = new StringBuilder();
          while(rs.next()){
            names.append(rs.getString("student_name")).append(", ");
        %>
          ['<%= rs.getString("student_name") %>', <%= rs.getInt("present_days") %>],
        <% } %>

        <% 
          String namesList = names.toString();
          if(namesList.endsWith(", ")) {
            namesList = namesList.substring(0, namesList.length()-2);
          }
          if(!namesList.isEmpty()){
        %>
        window.onload = function(){
          var myModal = new bootstrap.Modal(document.getElementById('congratsModal'));
          document.getElementById('starNames').innerText = "🌟 Congratulations! Full month attendance: <%= namesList %>";
          myModal.show();
        }
        <% } %>
      ]);

      var options = {
        title: 'Full Month Attendance Stars',
        hAxis: {title: 'Students'},
        vAxis: {title: 'Days Present'},
        legend: 'none',
        colors: ['#ffc107']
      };

      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
  </script>
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2 class="text-center mb-4 text-success">🌟 Full Month Attendance Stars 🌟</h2>

  <!-- Chart -->
  <div id="chart_div" style="width: 100%; height: 500px;"></div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="congratsModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content bg-success text-white">
      <div class="modal-header">
        <h5 class="modal-title">👏 Congratulations!</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body" id="starNames">
        <!-- Student names will be injected here -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    