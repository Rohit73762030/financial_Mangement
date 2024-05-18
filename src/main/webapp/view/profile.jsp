<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="text-center">
		<div class="profile-icon" id="profileIcon">
			<i class="fas fa-user iconp"></i>
		</div>
		<div class="profile-name"></div>
		<div class="text-right">
			<div class="mt-2">
				<span class="d-none logout-button" id="logoutBtn1"> <a
					href="logout" class="btn btn-danger">Logout</a></span>
			</div>
		</div>
		<!-- Footer -->
		<script>
  const profileIcon1 = document.getElementById('profileIcon');
  const logoutBtn1 = document.getElementById('logoutBtn1');

  profileIcon1.addEventListener('click', () => {
    logoutBtn1.classList.toggle('d-none');
  });
</script>
</body>
</html>