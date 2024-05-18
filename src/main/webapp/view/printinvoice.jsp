<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>Invoice</h1>
		<table cellspacing="30px"
			style="margin-left: auto; margin-right: auto;">
			<tr>
				<th>Invoice Id</th>
				<td>: ${l1.inid}</td>
			</tr>
			<tr>
				<th>Customer Name</th>
				<td>: ${l1.name1}</td>
			</tr>
			<tr>
				<th>Invoice Date</th>
				<td>: ${l1.date}</td>
			</tr>
			<tr>
				<th>Description</th>
				<td>: ${l1.desc1}</td>
			</tr>
			<tr>
				<th>Quantity</th>
				<td>: ${l1.qunatity}</td>
			</tr>
			<tr>
				<th>Price</th>
				<td>: ${l1.price}</td>
			</tr>
			<h3 style="">------------------------------------
				-------------------------------------</h3>
			<tr>
				<td><h3 style="margin-right: -160px; background-color: red;">------------------------------------
						-------------------------------------------</h3>
			</tr>
			</td>
			<tr>
				<th>Total Price</th>
				<td>: ${l1.totalamount}</td>
			</tr>




			<tr>
				<form action="returninvoiceform" method="get">
				<td><button onClick="printInvoice()" type="submit">Print</button>
				</form></td>
		</table>
		</tr>
	</div>
	<script>
		function printInvoice() {
			window.print();
		}
	</script>
</body>
</html>