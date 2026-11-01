<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Staff Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background:#f0f4f7; font-family:Arial; }
    .login-box {
      max-width: 400px; margin: 80px auto; padding: 30px;
      border-radius: 10px; background: #fff;
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }
  </style>
  <script>
    function validateLogin() {
      let uname = document.getElementById("username").value.trim();
      let pwd = document.getElementById("password").value.trim();

      // Case 1: Both empty
      if(uname === "" && pwd === "") {
        alert("⚠️ Please enter Username and Password!");
        return false;
      }

      // Case 2: Username empty
      if(uname === "") {
        alert("⚠️ Username is mandatory!");
        return false;
      }

      // Case 3: Password empty
      if(pwd === "") {
        alert("⚠️ Password is mandatory!");
        return false;
      }

      // Case 4: Invalid username/password
      if(uname !== "staff" || pwd !== "staff123") {
        alert("❌ Invalid Username or Password!");
        return false;
      }

      // Case 5: Success
      alert("✅ Login Successful! Redirecting to Dashboard...");
     // location.replace("staff_dashboard.jsp");
    // window.location.href = "staff_dashboard.jsp"; // redirect 
      return true;
    }
  </script>
</head>
<body>

<div class="login-box">
  <h3 class="text-center mb-4">👨‍🏫 Staff Login</h3>
  <form action="staff_dashboard.jsp" onsubmit="return validateLogin();" autocomplete="off" >
    <div class="mb-3">
      <label class="form-label">Username</label>
      <input type="text" id="username" class="form-control" placeholder="Enter username" autocomplete="new-username">
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" id="password" class="form-control" placeholder="Enter password"autocomplete="new-password">
    </div>
    <button type="submit" class="btn btn-primary w-100">Login</button>
  </form>
</div>

</body>
</html>
    