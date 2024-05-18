<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
hhhh


<title>Show Reports</title>
<%@include file="ref.jsp"%>
</head>
<body>
	<%@include file="home.jsp"%>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4 class="text-center">Financial Data Display</h4>
					</div>
					<div class="card-body">
						<div class="card-body">
							<span id="setvalue">
								<div class="alert-danger text-danger" id="success"></div>
							</span>
							<c:if test="${not empty msg}">

								<div class="alert-danger text-danger" id="success-message">
									${msg}
									<c:set var="msg" value="" />

								</div>
							</c:if>
							<c:if test="${not empty msg1}">

								<div class="alert-success text-success" id="success-message">
									${msg1}
									<c:set var="msg1" value="" />
								</div>
							</c:if>

							<form action="showfinencial" method="get">
								<div class="form-group">
									<label for="startDate">Start Date</label> <input type="date"
										class="form-control" name="start" id="date">
								</div>
								<div class="form-group">
									<label for="endDate">End Date</label> <input type="date"
										class="form-control" name="end" id="enddate">
								</div>
								<table class="table">
									<tr>
										<td>
											<button type="submit" class="btn btn-primary btn-block">Show
												Report</button>
										</td>
										<td><button type="submit" formaction="exportexpencess"
												class="btn btn-success btn-block">Export Expensess</button></td>
										<td><button type="submit" formaction="exportInvoice"
												class="btn btn-primary btn-block">Export Invoice</button></td>
									</tr>
									<tr>
										<td><a id="showbtn1" class="btn btn-primary btn-block">Upload
												Data</a></td>

									</tr>
								</table>
							</form>



							<h1>Find Events</h1>
							<label for="startDate">Start Date:</label> <input type="date"
								id="startDate" required> <label for="endDate">End
								Date:</label> <input type="date" id="endDate" required>
							<button id="findEvents">Find Events</button>
							<div id="eventList"></div>




							<span id="show" style="display: none;">
								<table class="table">
									<tr>

										<td><form action="import-invoices"
												enctype="multipart/form-data" id="validexcel" method="POST">
												<input style="width: 210px;" id="excelInput" type="file"
													name="excelfile" required="required" accept=".xlsx,.xls"></input>
												<button style="width: 140px;"
													class="btn btn-warning btn-block" id="submitted"
													type="button" onclick="validateExcel()">
													Upload Invoice <i class="fa-solid fa-pen-to-square"></i>
												</button>
											</form></td>


										<td><form action="import-expenses" id="validexpences"
												enctype="multipart/form-data" method="POST">
												<input style="width: 210px;" type="file" name="excelfile"
													id="excelInput1" accept=".xlsx,.xls" required="required"></input>
												<button style="width: 160px;"
													class="btn btn-warning btn-block"
													onclick="validateexpencesExcel()" type="button">
													Upload Expenses <i class="fa-solid fa-pen-to-square"></i>
												</button>

											</form></td>
									</tr>
								</table>
							</span>
							<c:if test="${not empty expences && not empty invoice}">
								<table class="table">
									<thead>

										<tr>
											<th>Expences</th>
											<th>Invoice</th>
											<th>Profit/Loss</th>
										</tr>
										<tr>
											<td>${expences}</td>
											<td>${invoice }</td>
											<td class="bg-dark" style="color: white">${profit}</td>
										</tr>
									</thead>
									<!-- Data will be populated by JavaScript -->
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${not empty l1}">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-header">
						<form action="export-invoices" method="post">
							<input type="hidden" name="start" value="${start}" /> <input
								type="hidden" name="end" value="${end}" />
							<table>
								<tr>
									<td><h4 style="margin-left: 350px;">Invoice Data
											Display</h4></td>
									<td><button class="btn btn-warning" type="submit"
											style="margin-left: 350px;">
											Export Invoice <i class="fa-solid fa-file-export"></i>
										</button></td>
								</tr>
							</table>


						</form>

					</div>
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

							</tr>
						</thead>

						<tbody style="width: 50px">
							<c:forEach items="${l1}" var="p">
								<tr>
									<td>${p.inid}</td>
									<td>${p.name1}</td>
									<td>${p.desc1}</td>
									<td>${p.date}</td>
									<td>${p.qunatity}</td>
									<td>${p.price}</td>
									<td>${p.totalamount}</td>
								</tr>
							</c:forEach>
							<!-- Repeat similar rows for each invoice -->
						</tbody>

					</table>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty l2}">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-header">
						<form action="export-expensess" method="post">
							<input type="hidden" name="start" value="${start}" /> <input
								type="hidden" name="end" value="${end}" />
							<table>
								<tr>
									<td><h4 style="margin-left: 318px;">Expensess Data
											Display</h4></td>
									<td><button class="btn btn-warning" type="submit"
											style="margin-left: 330px;">
											Export Expensess <i class="fa-solid fa-file-export"></i>
										</button></td>
								</tr>
							</table>

						</form>
					</div>
					<table class="table table-bordered">

						<thead>

							<tr>
								<th>Expenses Id</th>
								<th>Expenses Name</th>
								<th>Description</th>
								<th>Expenses Date</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Total Amount</th>

							</tr>
						</thead>

						<tbody style="width: 50px">
							<c:forEach items="${l2}" var="p">
								<tr>
									<td>${p.eid}</td>
									<td>${p.name1}</td>
									<td>${p.desc1}</td>
									<td>${p.date}</td>
									<td>${p.qunatity}</td>
									<td>${p.price}</td>
									<td>${p.totalamount}</td>
								</tr>
							</c:forEach>
							<!-- Repeat similar rows for each invoice -->
						</tbody>

					</table>
				</div>
			</div>
		</c:if>
	</div>


	<%@include file="footer.jsp"%>
	<script>  
    $(document).ready(function () {
        $("#findEvents").click(function () {
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();

            $.ajax({
                type: "GET",
                url: "http://localhost:8088/showfinencial?start=2023-08-15&end=2023-09-15",
                success: function (response) {
                	
                	 if (response.hasOwnProperty('invoice')) {
                         // Data for 'invoice' key found
                         var invoiceData = response.invoice;
                         console.log('Invoice Data:', invoiceData);
                     } else if (response.hasOwnProperty('expences')) {
                         // Data for 'expense' key found
                         var expenseData = response.expences;
                         console.log('Expense Data:', expenseData);
                     } 
                     
                 else if (response.hasOwnProperty('profit')) {
                    // Data for 'expense' key found
                    var profitData = response.profit;
                    console.log('Expense Data:', profitData);
                } 
                 else {
                         // Key not found or data not found for the provided key
                         console.log('Data not found for the provided key.');
                     }
                 }
/*                  error: function(xhr, status, error) {
                     // Handle errors
                     console.error('Error:', error);
                 } */
             });
             


                	/* alert("nxcbfjb"+data)
                    var eventList = $("#eventList");
                    eventList.empty();
                    $.each(data, function (index, event) {
                        eventList.append("<p>" + event.invoice + "</p>");
                    });
                    
                    
                    
/*                 }*/
                /*  error: function () { 
                    alert("Error fetching events");
                }  */
            });
        });
 /*    }); */

	      
		document.getElementById('showbtn1').addEventListener('click',
				function() {
					var formContainer = document.getElementById('show');
					if (formContainer.style.display === 'none') {
						formContainer.style.display = 'block';
					} else {
						formContainer.style.display = 'none';
					}
				});
		
		
		const d = document.getElementById("validexcel")
	/* 	valadate excel file  */
		      function validateExcel() {
			  const fileInput = document.getElementById('excelInput');
			  const file = fileInput.files[0];
               var test1;
			  if (!file) {
			    alert('Please select an Excel file.');
			    return false;
			  }
			  
			 fileloaded(file,function(result){
				if(result){
					
					d.submit()
				}
		
		});}
		       function fileloaded(file,callback){
		       var test;
			   const reader = new FileReader();
			   reader.onload = function(event) {
			    const arrayBuffer = event.target.result;
			  
			    const workbook = XLSX.read(arrayBuffer, { type: 'array' });
			    const sheetName = workbook.SheetNames[0];
			    // Assuming you want to validate the first sheet
			    const sheet = workbook.Sheets[sheetName];
			    if(validateSheet(sheet)){
	            
	              test=true;
			    }
			    else{test=false}
			    callback(test)
			 
			 };reader.readAsArrayBuffer(file)
			
		       }
			    function validateSheet(sheet) {
               
			    	  for (let rowIndex = 2; rowIndex <=(XLSX.utils.decode_range(sheet['!ref']).e.r)+1; rowIndex++) {
			    	    // cellA = sheet["A" + rowIndex +""]?.v || '';
			    	     cellname = sheet["B" + rowIndex +""]?.v || '';
			    	     cellDesc = sheet["C" + rowIndex +""]?.v || '';
			    	     cellDate = sheet["D" + rowIndex +""]?.v ||'';
			    	     cellPrice = sheet["E"+  rowIndex +""]?.v ||''; 
			    	     cellQunatity = sheet["F"+  rowIndex +""]?.v ||''; 
			    
			    	    if(cellname === '') {
			    	    	alert("Row B" + rowIndex + ": Name is not empty")
			    	    	return false;
			    	    } 
			    	  
			    	    else if(cellDesc === '') {
			    	    	alert("Row C" + rowIndex + ": Description is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellDate === '') {
			    	    	alert("Row D" + rowIndex + ": Date is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellPrice === '') {
			    	  
			    	    	alert("Row E" + rowIndex + ": Price is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellQunatity === '') {
			    	    	alert("Row F" + rowIndex + ": Qunatity is not empty")
			    	    	return false;
			    	    } 
			    	    else if(typeof cellname !=='string')
			    	    {
			    	    	alert("Row B" + rowIndex + ": Name is not valid")
			    	    	return false
			    	    	}
			    	    else if(typeof cellDesc !=='string')
			    	    {
			    	    	alert("Row B" + rowIndex + ": Description is not valid")
			    	    	return false
			    	    	}
			    	    else if(isNaN(parseFloat(cellPrice))) {
			    		  
			    	    	alert("Row E" + rowIndex + ": Price is not a valid number")
			    	    	return false;
			    	     }
			    	    else if (isNaN(parseFloat(cellQunatity))) {
			    		
			    	    	alert("Row F" + rowIndex + ": Qunatity is not a valid number")
			    	    	return false;
			    	  }
			    	    else if (!isValidDate(cellDate)) {
				    		
			    	    	alert("Row D" + rowIndex + ": Date Farmat is not DD-MM-YYYY")
			    	    	return false;
			    	  }
			    	    
                
			    	  }
                return true;
			    }
                 // Check date Formate 
                 
  function isValidDate(dateString1) {
	     if (typeof dateString1!== 'string') {
			    	     
	    	 const dateString=format(dateString1)
	    
	    	 function format(dateString){
			    	    	  const MS_PER_DAY = 24 * 60 * 60 * 1000;
			    	    	  const EXCEL_EPOCH = new Date("1900-01-01");

			    	    	  const daysSinceEpoch = cellDate - 1; // Excel counts from 1, JavaScript counts from 0
			    	    	  const dateMilliseconds = daysSinceEpoch * MS_PER_DAY;
			    	    	  const finalDate = new Date(EXCEL_EPOCH.getTime() + dateMilliseconds);

			    	    	  const year = finalDate.getFullYear();
			    	    	  const month = finalDate.getMonth() + 1; // JavaScript months are zero-based
			    	    	  const day = finalDate.getDate()-1;
			    	    	  dateString=day+"-"+ month + "-"+ year
			    	       
			    	    	 if (isNaN(day) || isNaN(month) || isNaN(year)) {
			    	    		    return false;
			    	    		  }
			    	    		  
			    	    		  // Check year, month, and day ranges
			    	    		  if (year < 1000 || year > 9999 || month < 1 || month > 12 || day < 1 || day > 31) {
			    	    		 
			    	    			  return false;
			    	    		  }

			    	    		  // Create a Date object to handle edge cases like February's varying number of days
			    	    		  const dateObject = new Date(year, month - 1, day);

			    	    		  // Check if the Date object is valid
			    	    		  if (dateObject.getFullYear() !== year || dateObject.getMonth() !== month - 1 || dateObject.getDate() !== day) {

			    	    			  return false;
			    	    		  }
			    	    	  return dateString;
	    	 
			    	     }
	    return true	 
	     }
	    	  if(typeof dateString1 == 'string'){ 
	    		 
	    		 const dateParts = dateString1.split("-");
  
  if (dateParts.length !== 3) {
    return false;
  }
  
  const day = parseInt(dateParts[0]);
  const month = parseInt(dateParts[1]);
  const year = parseInt(dateParts[2]);
  
  // Check if the parts are valid numbers
  if (isNaN(day) || isNaN(month) || isNaN(year)) {
    return false;
  }
  
  // Check year, month, and day ranges
  if (year < 1000 || year > 9999 || month < 1 || month > 12 || day < 1 || day > 31) {
	  return false;
  }

  // Create a Date object to handle edge cases like February's varying number of days
  const dateObject = new Date(year, month - 1, day);

  // Check if the Date object is valid
  if (dateObject.getFullYear() !== year || dateObject.getMonth() !== month - 1 || dateObject.getDate() !== day) {
	  return false;
  }
  return true;
}
}   
                 
 //validte expences                
  const d1 = document.getElementById("validexpences")

		      function validateexpencesExcel() {
			  const fileInput = document.getElementById('excelInput1');
			  const file = fileInput.files[0];
             var test1;
			  if (!file) {
			    alert('Please select an Excel file.');
			    return false;
			  }
			  
			 fileloaded(file,function(result){
				 
				if(result){
					
					d1.submit()
				}
		
		});}
		       function fileloaded(file,callback){
		       var test;
		      
			   const reader = new FileReader();
			   reader.onload = function(event) {
			    const arrayBuffer = event.target.result;
			  
			    const workbook = XLSX.read(arrayBuffer, { type: 'array' });
			    const sheetName = workbook.SheetNames[0];
			    // Assuming you want to validate the first sheet
			    const sheet = workbook.Sheets[sheetName];
			    if(validateSheet(sheet)){
	            
	              test=true;
			    }
			    else{test=false}
			    callback(test)
			 
			 };reader.readAsArrayBuffer(file)
			
		       }
			    function validateSheet(sheet) {
                       
			    	  for (let rowIndex = 2; rowIndex <=(XLSX.utils.decode_range(sheet['!ref']).e.r)+1; rowIndex++) {
			    	    // cellA = sheet["A" + rowIndex +""]?.v || '';
			    	     cellname = sheet["B" + rowIndex +""]?.v || '';
			    	     cellDesc = sheet["C" + rowIndex +""]?.v || '';
			    	     cellDate = sheet["D" + rowIndex +""]?.v ||'';
			    	     cellPrice = sheet["E"+  rowIndex +""]?.v ||''; 
			    	     cellQunatity = sheet["F"+  rowIndex +""]?.v ||''; 
			             
			    	    if(cellname === '') {
			    	    	alert("Row B" + rowIndex + ": Name is not empty")
			    	    	return false;
			    	    } 
			    	  
			    	    else if(cellDesc === '') {
			    	    	alert("Row C" + rowIndex + ": Description is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellDate === '') {
			    	    	alert("Row D" + rowIndex + ": Date is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellPrice === '') {
			    	  
			    	    	alert("Row E" + rowIndex + ": Price is not empty")
			    	    	return false;
			    	    } 
			    	    else if(cellQunatity === '') {
			    	    	alert("Row F" + rowIndex + ": Qunatity is not empty")
			    	    	return false;
			    	    } 
			    	    else if(typeof cellname !=='string')
			    	    {
			    	    	alert("Row B" + rowIndex + ": Name is not valid")
			    	    	return false
			    	    	}
			    	    else if(typeof cellDesc !=='string')
			    	    {
			    	    	alert("Row B" + rowIndex + ": Description is not valid")
			    	    	return false
			    	    	}
			    	    else if(isNaN(parseFloat(cellPrice))) {
			    		  
			    	    	alert("Row E" + rowIndex + ": Price is not a valid number")
			    	    	return false;
			    	     }
			    	    else if (isNaN(parseFloat(cellQunatity))) {
			    		
			    	    	alert("Row F" + rowIndex + ": Qunatity is not a valid number")
			    	    	return false;
			    	  }
			    	    else if (!isValidDate(cellDate)) {
				    		
			    	    	alert("Row D" + rowIndex + ": Date Farmat is not DD-MM-YYYY")
			    	    	return false;
			    	  }
			    	    
              
			    	  }
              return true;
			    }
               // Check date Formate 
               
function isValidDate(dateString1) {
	     if (typeof dateString1!== 'string') {
			    	     
	    	 const dateString=format(dateString1)
	    
	    	 function format(dateString){
			    	    	  const MS_PER_DAY = 24 * 60 * 60 * 1000;
			    	    	  const EXCEL_EPOCH = new Date("1900-01-01");

			    	    	  const daysSinceEpoch = cellDate - 1; // Excel counts from 1, JavaScript counts from 0
			    	    	  const dateMilliseconds = daysSinceEpoch * MS_PER_DAY;
			    	    	  const finalDate = new Date(EXCEL_EPOCH.getTime() + dateMilliseconds);

			    	    	  const year = finalDate.getFullYear();
			    	    	  const month = finalDate.getMonth() + 1; // JavaScript months are zero-based
			    	    	  const day = finalDate.getDate()-1;
			    	    	  dateString=day+"-"+ month + "-"+ year
			    	       
			    	    	 if (isNaN(day) || isNaN(month) || isNaN(year)) {
			    	    		    return false;
			    	    		  }
			    	    		  
			    	    		  // Check year, month, and day ranges
			    	    		  if (year < 1000 || year > 9999 || month < 1 || month > 12 || day < 1 || day > 31) {
			    	    		 
			    	    			  return false;
			    	    		  }

			    	    		  // Create a Date object to handle edge cases like February's varying number of days
			    	    		  const dateObject = new Date(year, month - 1, day);

			    	    		  // Check if the Date object is valid
			    	    		  if (dateObject.getFullYear() !== year || dateObject.getMonth() !== month - 1 || dateObject.getDate() !== day) {

			    	    			  return false;
			    	    		  }
			    	    	  return dateString;
	    	 
			    	     }
	    return true	 
	     }
	    	  if(typeof dateString1 == 'string'){ 
	    		 
	    		 const dateParts = dateString1.split("-");

if (dateParts.length !== 3) {
  return false;
}

const day = parseInt(dateParts[0]);
const month = parseInt(dateParts[1]);
const year = parseInt(dateParts[2]);

// Check if the parts are valid numbers
if (isNaN(day) || isNaN(month) || isNaN(year)) {
  return false;
}

// Check year, month, and day ranges
if (year < 1000 || year > 9999 || month < 1 || month > 12 || day < 1 || day > 31) {
	  return false;
}

// Create a Date object to handle edge cases like February's varying number of days
const dateObject = new Date(year, month - 1, day);

// Check if the Date object is valid
if (dateObject.getFullYear() !== year || dateObject.getMonth() !== month - 1 || dateObject.getDate() !== day) {
	  return false;
}
return true;
}
}   
                 
                 
                 
                 
	/*  d.addEventListener("submit",function(event)
			{
	    alert("hello")
	    console.log(validateExcel())
	 }); */
	/*  function run1(value){
		 d.addEventListener("submit",function(event)
					{
	    	if(!value){
	    		console.log("success")
	    		event.preventDefault()
	    	}
					});} */
	/* 	validateExcel(function(result)
		{
			alert("nnnnnnn")
			alert("result 2" +result)
			if(result){
				alert("callbak3")
			d.submit()
			}
			else{alert("not submit")
			notvalid();	
			}	
		}); */
		
		/* function notvalid(){alert("not valid")return false}
{return false;} */
			
		const startdate = document.getElementById('date')
		const enddate1 = document.getElementById('enddate')
		var date = new Date()
		startdate.value = new Date(date.setMonth(date.getMonth() - 1))
				.toISOString().split('T')[0]
		console.log(new Date(date.setMonth(date.getMonth() - 1)).toISOString()
				.split('T')[0])
		//✅ Using UTC (universal coordinated time)
		enddate1.value = new Date().toISOString().split('T')[0];

		console.log(new Date().toISOString().split('T')[0]);
	</script>
</body>
</html>