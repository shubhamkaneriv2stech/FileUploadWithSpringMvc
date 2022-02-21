<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<%@ page isELIgnored="false" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="<c:url value="/resources/css/jquery.dataTables.css" />"rel="stylesheet">
<link href="<c:url value="/resources/css/jquery.dataTables.min.css" />"rel="stylesheet">

<link href="<c:url value="/resources/css/common.css" />"rel="stylesheet">

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>

<script src="<c:url value="/resources/js/jquery.dataTables.js" />"></script>



<style>
table {
	margin-top: 10px;
	border: solid black 1px;
}

.required {
	color: red;
}

table  td {
	padding: 5px;
}

.message {
	font-size: 90%;
	color: blue;
	font-style: italic;
	margin-top: 30px;
}

body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 160px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: cyan;
	overflow-x: hidden;
	padding-top: 20px;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: black;
	display: block;
}

.sidenav a:hover {
	color: red;
}

.main {
	margin-left: 60px; /* Same as the width of the sidenav */
	font-size: 15px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

.add {
	margin-left: 120px; /* Same as the width of the sidenav */
	font-size: 15px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 8px;
	}
}

.error-message {
	color: red;
	font-size: 90%;
}
</style>

<title>Employee List</title>
</head>
<body>


	<div class="sidenav">
	  <a href="${pageContext.request.contextPath}/showRoom/dataTableEmployee">EmployeeList</a>
			 <a	href="${pageContext.request.contextPath}/showRoom/dataTable">ShowRoomlist</a>
			
	</div>



<div class="main">

<div class="add">  
<a	href="${pageContext.request.contextPath}/showRoom/showEmployeeForm">Add </a></div>
 

<table id="example" class="display" cellspacing="0" width="100%"
	style="overflow-x: auto">
	<thead>
		<tr>
			<th>Owner Name</th>
			<th>FirstName</th>
				<th>LastName</th>
				<th>Email Id</th>
				
				
							
		</tr>
	</thead>
</table>

	</div>

<script type="text/javascript">
$(document).ready(function(){
	
	var data = ${employeeList};

var table = $('#example').DataTable( {
	
	  "bFilter": false,
"aaData": data,
"aoColumns": [
	{ "mData": "id","visible": false
      },
{ "mData": "firstName"},
{ "mData": "lastName"},
{ "mData": "emailId"},

],
"paging":true
});
});

/* April 25, 2021. */
















</script>

