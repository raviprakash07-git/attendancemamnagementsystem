<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>College Attendance System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

    <!-- Hero Section -->
    <section class="bg-primary text-white text-center p-5">
        <h1 class="display-4">Welcome to College Attendance System</h1>
        <p class="lead">Track attendance easily with weekday rules & holiday auto‑marking</p>
    </section>

    <!-- Cards Section -->
    <div class="container mt-5">
        <div class="row g-4 justify-content-center">
            <!-- Student Card -->
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-person-plus display-4 text-success"></i>
                        <h5 class="card-title mt-3">Student Register</h5>
                        <p class="card-text">Register students.</p>
                        <a href="student_register.jsp" class="btn btn-success w-100">Go</a>
                    </div>
                </div>
            </div>
            <!-- Staff Card -->
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-lock display-4 text-info"></i>
                        <h5 class="card-title mt-3">Staff Access</h5>
                        <p class="card-text">Login to manage attendance reports.</p>
                        <a href="staff_login.jsp" class="btn btn-info w-100">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-3 mt-5">
        <p>&copy; 2026 Your College Name. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    