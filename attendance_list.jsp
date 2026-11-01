<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Daily Attendance</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
  /* Default radio look bigger */
input[type="radio"] {
  transform: scale(1.3);
  cursor: pointer;
}

/* Present radio → green when checked */
input[type="radio"].present:checked {
  accent-color: green; /* bright green */
}

/* Absent radio → red when checked */
input[type="radio"].absent:checked {
  accent-color: red; /* bright red */
}
  
  /* Make checkbox tick bigger and brighter */
  input[type="checkbox"] {
    transform: scale(1.5);   /* enlarge tick */
    accent-color: #28a745;   /* bright green tick */
    cursor: pointer;
  }

  /* Optional: when checked → glow effect */
input[type="checkbox"].glow:checked {
  box-shadow: 0 0 10px #28a745;
      accent-color: green;
}
</style>
  
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2 class="text-center mb-4">Daily Attendance</h2>

  <table class="table table-bordered text-center align-middle">
    <thead class="table-dark">
      <tr>
        <th>Roll No</th>
        <th>Name</th>
        <th>Hour 1</th>
        <th>Hour 2</th>
        <th>Hour 3</th>
        <th>Hour 4</th>
        <th>Hour 5</th>
      </tr>
    </thead>
    <tbody>
    <%
      Connection con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/college_attendance","root","ravi@2007");
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM students");
      while(rs.next()){
        String roll = rs.getString("roll_number");
        String name = rs.getString("student_name");

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM attendance WHERE roll_number=? AND date=CURDATE()");
        ps.setString(1, roll);
        ResultSet att = ps.executeQuery();

        boolean hour1Present=false, hour2Present=false, hour3Present=false, hour4Present=false, hour5Present=false;
        if(att.next()){
            hour1Present = "Present".equals(att.getString("hour1"));
            hour2Present = "Present".equals(att.getString("hour2"));
            hour3Present = "Present".equals(att.getString("hour3"));
            hour4Present = "Present".equals(att.getString("hour4"));
            hour5Present = "Present".equals(att.getString("hour5"));
        }
    %>
<tr>
  <td><%= roll %></td>
  <td><%= name %></td>
  <% for(int h=1; h<=5; h++){ 
       boolean presentFlag = false;
       if(h==1) presentFlag = hour1Present;
       if(h==2) presentFlag = hour2Present;
       if(h==3) presentFlag = hour3Present;
       if(h==4) presentFlag = hour4Present;
       if(h==5) presentFlag = hour5Present;
  %>
  <td>
    <!-- Checkbox (auto tick when Present selected) -->
    <input type="checkbox" id="chk_<%=roll%>_<%=h%>" <%= presentFlag ? "checked" : "" %> disabled>
    <br>
    <!-- Radio buttons -->
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" 
             name="hour<%=h%>_<%=roll%>" 
             <%= presentFlag ? "checked" : "" %>
             onclick="markAttendance('<%=roll%>', 'hour<%=h%>', 'Present')">
      <label class="form-check-label text-success">Present</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" 
             name="hour<%=h%>_<%=roll%>" 
             <%= !presentFlag ? "checked" : "" %>
             onclick="markAttendance('<%=roll%>', 'hour<%=h%>', 'Absent')">
      <label class="form-check-label text-danger">Absent</label>
    </div>
  </td>
  <% } %>
</tr>


    <%
      }
    %>
    </tbody>
  </table>
</div>

<script>
function markAttendance(roll, hour, status){
    // Update DB via servlet
    fetch("AttendanceServlet", {
        method: "POST",
        headers: {"Content-Type":"application/x-www-form-urlencoded"},
        body: "roll="+roll+"&hour="+hour+"&status="+status
    }).then(()=>{
        // Update checkbox UI
        let hNum = hour.replace("hour","");
        let chk = document.getElementById("chk_"+roll+"_"+hNum);
        chk.checked = (status==="Present");
         // Auto tick logic → if hour1 & hour2 are Present → tick rest
        let h1 = document.getElementById("chk_"+roll+"_1");
        let h2 = document.getElementById("chk_"+roll+"_2");
        
        if(h1.checked && h2.checked){
            for(let i=3;i<=5;i++){
                let cb = document.getElementById("chk_"+roll+"_"+i);
                cb.checked = true;
                // also update DB for those hours
                fetch("AttendanceServlet", {
                    method: "POST",
                    headers: {"Content-Type":"application/x-www-form-urlencoded"},
                    body: "roll="+roll+"&hour=hour"+i+"&status=Present"
                });
            }
        }
        
        
    });
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
