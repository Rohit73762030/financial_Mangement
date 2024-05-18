<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="ref.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>admin Registration </title>
</head>
<body>
<%@include file="home.jsp"%>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">
            <h4 class="text-center">Admin Registration</h4>
          </div>
          <div class="card-body">
          
          <c:if test="${not empty succes}">
             <div class="alert alert-success" id="" >
           ${succes}
            </div></c:if>
            <form action="addadmin" method="POST" id="adminform">
              <div class="form-group">
                <label for="username">Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name">
              </div>
              <span class="text-danger" id="mname"></span>
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email">
              </div>
              <span class="text-danger" id="memail"></span>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="pass" id="pass" placeholder="Enter your password">
              </div>
               <span class="text-danger" id="mpass"></span>
              <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@include file="footer.jsp" %>
<script>
        const emailForm = document.getElementById("adminform");
        
        emailForm.addEventListener("submit", function(event) {
            const nameInput = document.getElementById("name");
            const emailInput = document.getElementById("email");
            const passInput = document.getElementById("pass");
            
            const mname = document.getElementById("mname")
            const memail = document.getElementById("memail")
            const mpass = document.getElementById("mpass")
            mname.innerHTML=("");
            memail.innerHTML=("");
            mpass.innerHTML=("");
            let isValid = true;
            
            
            // Check if name is not empty
            if (nameInput.value.trim() === "") {
                mname.innerHTML=("*Name is required");
                isValid = false;
            }
           
            
            // Check if email is not empty and is a valid email address
            if (emailInput.value.trim() === "") {
                memail.innerHTML=("*Email is required");
                isValid = false;
            } else if (!isValidEmail(emailInput.value)) {
                memail.innerHTML=("*Please enter a valid email address");
                isValid = false;
            }
            if (passInput.value.trim() === "") {
            	mpass.innerHTML=("*pass is required");
                isValid = false;
            }
            else if (passInput.value.length < 8) {
                mpass.innerHTML=("*Password must be at least 8 characters long");
                isValid = false;
            }
            
            if (!isValid) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
        
        function isValidEmail(email) {
            // Basic email validation using a regular expression
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            return emailRegex.test(email);
        }
        
        
    </script>
</body>
</html>





</body>
</html>