<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0f4f7;
            font-family: Arial, sans-serif;
        }
        .app-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 150px;
            height: 150px;
            margin: 20px;
            border-radius: 20px;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            color: white;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s;
        }
        .app-btn:hover {
            transform: scale(1.05);
        }
        .icon {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .btn-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
    </style>
</head>
<body>

<div class="container mt-5 text-center">
    <h2 class="mb-4">📱 Staff Access Dashboard</h2>
    <p>Select an option below:</p>

    <div class="btn-grid">
        <a href="attendance_list.jsp" class="app-btn">
            <div class="icon">📝</div>
            Attendance
        </a>
        <a href="attendance_report.jsp" class="app-btn">
            <div class="icon">📊</div>
            Report
        </a>
        <a href="attendance_report_monthwise.jsp" class="app-btn">
            <div class="icon">📅</div>
            Month Report
        </a>
        <a href="fullmonth_reward_attendance.jsp" class="app-btn">
            <div class="icon">📈</div>
            Chart Report
        </a>
    </div>
</div>

</body>
</html>
    