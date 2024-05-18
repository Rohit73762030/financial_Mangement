<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.model.Product1"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Expenses</title>
<%@include file="ref.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
td {
	width: 50px;
}

table, thead, th {
	width: 10px;
}

input {
	width: 110px;
}

button {
	width: 70px;
}
</style>
</head>
<body>
	<!-- <h3>Show Expences</h3>
	<table border="1" cellspacing="2px">
		<tr> -->
	<%@include file="home.jsp"%>
	<div class="container mt-5">
		<h2 class="text-center">Expences Report</h2>
		<%--  <c:if test="${not empty success}">
			<div class="alert alert-success" id="success-message">
			${success}
			<c:set var="success" value=""/>
			</div></c:if> --%>
		<%
		String success = (String) request.getAttribute("success");
		if (success != null) {
		%>
		<div class="alert alert-success" id="success-message">
			${success}</div>
		<%
		}
		%>
		<table class="table table-bordered">
			<thead>

				<th>Expenses Id</th>
				<th>Expenses Name</th>
				<th>Expenses Date</th>
				<th>Description</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Amount</th>
				<th>Action</th>
				</tr>
			</thead>

			<tbody style="width: 50px">

				<c:forEach items="${l1}" var="p">
					<tr>
						<form action="updateexpences" method="post" id="updateexpenses">
							<td><label>${p.eid} </label></td> <input type="hidden"
								name="eid" value=${p.eid} >
							<td><input type="text" name="name1" id="name1"
								value=${p.name1} ></td>
							<td><input type="date" name="date" id="date" value=${p.date}></td>
							<td><input type="text" name="desc1" id="desc1"
								value=${p.desc1}></td>
							<td><input type="number" name="price" id="price"
								value=${p.price}></td>
							<td><input type="number" name="qunatity" id="qunatity"
								value=${p.qunatity}></td>
							<td><input type="number" name="totalamount"
								value=${p.totalamount}></td>
							<td style="width: 160px;"><button
									style="background-color: orange;" class="btn" type="submit">
									<i class="fa-solid fa-pen-to-square"></i>
								</button> <a class="btn btn-danger" href="deleteexpences?eid=${p.eid}"><i
									class="fa-solid fa-trash-can"></i></a></td>
						</form></tr>
				</c:forEach>

				
			</tbody>
		</table>
	</div>





	</div>
	</table>
	<%@include file="footer.jsp"%>
	<script>
		const showmsg = document.getElementById("showmsg");
		const h = document.getElementById("h");
		const updateexpenses = document.getElementById("updateexpenses");

		function valid() {
			//updateinvoice.addEventListener("submit",function(event) {
			const name1Input = document.getElementById("name1");
			const desc1Input = document.getElementById("desc1");
			const dateInput = document.getElementById("date");
			const priceInput = document.getElementById("price");
			const qunatityInput = document.getElementById("qunatity");

			let isValid = true;

			// Basic validation for description
			if (name1Input.value.trim() === "") {
				alert("Expenses Name is required");
				isValid = false;
			}

			// Basic validation for amount
			else if (desc1Input.value.trim() === "") {
				alert("Description is required");
				isValid = false;
			}

			else if (dateInput.value === "") {
				alert("Date is required");
				isValid = false;
			} else if (priceInput.value.trim() === "") {
				alert("Price is required");
				isValid = false;
			} else if (isNaN(priceInput.value)) {
				alert("Price must be a valid number");
				isValid = false;
			} else if (qunatityInput.value.trim() === "") {
				alert("Qunatity is required");
				isValid = false;
			}

			// Basic validation for date

			if (isValid) {
				return isValid;
			}

			// Prevent form submission if validation fails

		}
		updateexpenses.addEventListener("submit", function(event) {
			if (!valid()) {
				event.preventDefault()

			}
		});
	</script>
</body>
</html>