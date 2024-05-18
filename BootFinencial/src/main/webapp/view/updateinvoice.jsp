<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show Invoice</title>
<%@include file="ref.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
table, thead, th {
	width: 10px;
}

input {
	width: 90px;
}

button {
	width: 75px;
}
</style>
</head>
<body>
<%@include file="home.jsp"%>
	<!-- <h3>Show Invoice</h3>
	<table border="1" cellspacing="2px"> -->
	<div class="container mt-5">
	
		<h2 class="text-center">Invoice Report</h2>
		<%-- <c:if test="${not empty success}">
		<div class="alert alert-success" id="success-message">${success} 

		</div>
		
		</c:if>
		<c:set var="h1" value="$success"/> --%>
		<% 
			String success=(String)request.getAttribute("success");
			if(success!=null){ %>
     <div class="alert alert-success" id="success-message">
			${success}</div><%}%>
		<table class="table table-bordered">
			<thead>

				<tr>
					<th>Invoice Id</th>
					<th>Customer Name</th>
					<th>Description</th>
					<th>Invoice Date</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total Amount</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody style="width: 50px">
				<c:forEach items="${l1}" var="p">
					<tr>
						<form action="updateinvoice" method="post" id="updateinvoice">
							<td><label>${p.inid}</label></td> <input type="hidden"
								name="inid" value=${p.inid} >
						<td><input type="text" id="name1" name="name1"
							value=${p.name1}></td>
						<td><input type="text" id="desc1" name="desc1"
							value=${p.desc1}></td>
						<td><input style="width: 110px;" id="date" type="date"
							name="date" value=${p.date}></td>
						<td><input type="number" name="qunatity" id="qunatity"
							value=${p.qunatity}></td>
						<td><input type="number" name="price" id="price"
							value=${p.price}></td>
						<td><input type="number" name="totalamount"
							value=${p.totalamount}></td>
						<td style="width: 170px;"><button style="background-color:orange;" class="btn" type="submit"><i class="fa-solid fa-pen-to-square"></i></button>
							<a class="btn btn-danger" href="deleteinvoice?inid=${p.inid}"><i
								class="fa-solid fa-trash-can"></i></a>
								<a class="btn" style="background-color:	#DCDCDC;" href="" onClick="printInvoice()">
								<i class="fa-solid fa-print"></i>
							</a>
							</td>
								
</form></tr>
				</c:forEach>
				

			</tbody>
		</table>
	</div>
<%@include file="footer.jsp"%>
	<script>
	
	function printInvoice() {
		window.print();
	}
	 
	
		const updateinvoice = document.getElementById("updateinvoice");
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
				alert("Invoice Name is required");
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
		updateinvoice.addEventListener("submit",function(event){
			if (!valid()) {
				event.preventDefault()
				
			}});
		
	</script>
</body>
</html>