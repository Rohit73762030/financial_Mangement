<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
<%@include file="ref.jsp"%>
</head>
<body>
	<%@include file="home.jsp"%>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4 class="text-center">Add Expenses</h4>
					</div>
					<div class="card-body">
						<%-- <c:if test="${not empty succes}">
						
							<div class="alert alert-success" id="success-message">
								${succes}
								<c:set var="succes" value=""/>
								
							</div>
						</c:if> --%>
						<%String succes=(String)request.getAttribute("succes");
						if(succes!=null){%>
						<div class="alert alert-success" id="success-message">
								${succes}
								<c:set var="succes" value=""/>
								
							</div><%} %>
						<form id="expensesvalid" action="addexpences" method="post">
							<div class="form-group">
								<label for="expenseName">Expense Name</label> <input type="text"
									class="form-control" id="name1" name="name1"
									placeholder="Enter expense name"> <span
									class="text-danger" id="mname"></span>
							</div>
							<div class="form-group">
								<label for="expenseName">Expense Description</label> <input
									type="text" class="form-control" id="desc1" name="desc1"
									placeholder="Enter Description" /> <span class="text-danger"
									id="mdesc"></span>
							</div>
							<div class="form-group">
								<label for="date">Date</label> <input type="date"
									class="form-control" name="date" id="date"> <span
									class="text-danger" id="mdate"></span>
							</div>
							<div class="form-group">
								<label for="amount">Price</label> <input type="number"
									class="form-control" name="price" id="price"
									placeholder="Enter price"> <span class="text-danger"
									id="mprice"></span>
							</div>
							<div class="form-group">
								<label for="expenseName">Quantity</label> <input type="number"
									class="form-control" id="qunatity" name="qunatity"
									placeholder="Enter quantity"> <span class="text-danger"
									id="mqunatity"></span>
							</div>


							<button type="submit" class="btn btn-primary btn-block">Add
								Expense</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<script>
		const d = document.getElementById("expensesvalid")
		function valid() {

			const name1Input = document.getElementById("name1");
			const desc1Input = document.getElementById("desc1");
			const dateInput = document.getElementById("date");
			const priceInput = document.getElementById("price");
			const qunatityInput = document.getElementById("qunatity");

			const mname = document.getElementById("mname");
			const mdesc = document.getElementById("mdesc");
			const mdate = document.getElementById("mdate");
			const mprice = document.getElementById("mprice");
			const mqunatity = document.getElementById("mqunatity");

			mname.innerHTML = ("")
			mdesc.innerHTML = ("")
			mdate.innerHTML = ("")
			mprice.innerHTML = ("")
			mqunatity.innerHTML = ("")

			let isValid = true;
			// Basic validation for description
			if (name1Input.value.trim() === "") {
				isValid = false;
				mname.innerHTML = ("*Expences Name is required");

			}

			// Basic validation for amount
			if (desc1Input.value.trim() === "") {
				isValid = false;
				mdesc.innerHTML = ("*Description is required");

			}

			if (dateInput.value === "") {
				isValid = false;
				mdate.innerHTML = ("*Date is required");

			}
			if (priceInput.value.trim() === "") {
				isValid = false;
				mprice.innerHTML = ("*Price is required");

			} else if (isNaN(priceInput.value)) {
				isValid = false;
				mprice.innerHTML = ("*Price must be a valid number");

			}
			if (qunatityInput.value.trim() === "") {
				isValid = false;
				mqunatity.innerHTML = ("*Qunatity is required");

			}
			if (isValid) {
				return isValid
				// Prevent form submission if validation fails
			}

		}

		d.addEventListener("submit", function(event) {
			if (!valid()) {
				event.preventDefault();

			}
		});
	</script>
</body>
</html>