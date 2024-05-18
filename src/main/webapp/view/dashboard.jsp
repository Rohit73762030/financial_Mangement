<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="ref.jsp"%>

<title>Dashboard</title>
<style type="text/css">
.carousel-inner {
	position: relative important;
	height: 100% ;
}
.carousel img {
	margin-top: 2px;
	max-height: 500px ;
	object-fit: cover ;
}

.logout-button {
	position: absolute !important;
	top: 20px ;
	right: 10px;
}
</style>
</head>
<body>

	<%@include file="home.jsp"%>
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="image/im1.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="image/im2.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="image/im3.jpg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>

	</div>
	<div class="text-right">
		<div class="mt-2">
			<span class="d-none logout-button" id="logoutBtn"> <a href="logout"
				class="btn btn-danger">Logout</a></span>
		</div> </div>
	<!-- Footer -->
	<%@include file="footer.jsp"%>
	<script>
  const profileIcon = document.getElementById('profileIcon');
  const logoutBtn = document.getElementById('logoutBtn');

  profileIcon.addEventListener('click', () => {
    logoutBtn.classList.toggle('d-none');
  });
</script>
</body>
</html>