<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
  
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="ref.jsp"%>
<title>Login Page</title>
</head>
<body>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">
            <h4 class="text-center">Login</h4>
          </div>
          <div class="card-body">
            <form action="loginverify" method="post">
             <div class="text-center mt-3 ">
              <c:if test="${not empty error}"><div class="text-danger">
     ${error}
    </div></c:if></div>
              <div class="form-group">
                <label for="username">Username</label>
                <input type="Email" class="form-control" name="email" id="username" placeholder="Enter your username">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="pass" id="password" placeholder="Enter your password">
              </div>
              <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

 </body>
</html>
