<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h4>Student Registration Form</h4>
                    </div>
                    <div class="card-body">
                        <form action="RegisterServlet" method="post">
                            <!-- Roll Number -->
                            <div class="mb-3">
                                <label class="form-label">Roll Number</label>
                                <input type="text" name="roll" class="form-control" required>
                            </div>
                            <!-- Name -->
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <!-- Department -->
                            <div class="mb-3">
                                <label class="form-label">Department</label>
                                <input type="text" name="dept" class="form-control">
                            </div>
                            <!-- Submit -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Register Student</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

    