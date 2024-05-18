<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style type="text/css">
	*{
	margin: 0px;
	padding: 0px;
}
.logout-button {
	position: absolute;
	top: 50px;
	right: 0px;
.profile-icon:hover {
	background-color: #ddd;
}


.profile-icon {
	position: relative;
	display: inline-block;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 36px;
	line-height: 50px;
	color: #555;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.iconp {
	height: 10px
}

.profile-icon:hover {
	background-color: #ddd;
}

.hh {
	margin-top: -1px;
	background-color: #563d7c;
}
	
	
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark hh  ">
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item "><a class="nav-link " href="addadminform">Admin
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="addexpenceform?succes=">Add
						Expences</a></li>
				<li class="nav-item"><a class="nav-link" href="addinvoiceform">Add
						Invoice</a></li>
				<li class="nav-item"><a class="nav-link"
					href="showinvoice?msg=">Show Invoice</a></li>
				<li class="nav-item"><a class="nav-link"
					href="showexpences?msg=">Show Expences</a></li>
				<li class="nav-item"><a class="nav-link" href="showreportform">Show
						Report</a></li>
				<li class="nav-item"><%@include file="profile.jsp"%></li>
			</ul>
		</div>
	</nav>
</body>
</html>