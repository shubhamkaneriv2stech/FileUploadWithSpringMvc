
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<title>Add Material!</title>

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

<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 
<script type="text/javascript">
	function addObject() {
	//	var arrayObject = {};
		
		/*  var arrayObject.id = $('#id').val();
		    var arrayObject.firstName = $('#firstName').val();
		    var arrayObject.lastName = $('#lastName').val();
		    var arrayObject.emailId = $('#emailId').val(); */
		    
		    var id = $('#id').val();
		    var firstName = $('#firstName').val();
		    var lastName = $('#lastName').val();
		    var emailId = $('#emailId').val();
		    var json = { "firstName" : firstName, "lastName" :lastName,"emailId" :emailId,"id": id};
		return json;
	}

	function callJqueryAjax() {
		var employee = addObject();
		console.log(employee);
		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			 dataType : 'json',
			 async : false,
			data : JSON.stringify(employee),
			 url: '${pageContext.request.contextPath}/showRoom/saveEquipmentsToUser',
			success : function(data) {
				window.location.href = "${pageContext.request.contextPath}/showRoom/dataTableEmployee";
			}
		});
	}
</script>

 --
<!-- 
<script type="text/javascript">
$(document).ready(function() {
	  $('#material').submit(function(event) {
		  var id = $('#id').val();
		    var firstName = $('#firstName').val();
		    var lastName = $('#lastName').val();
		    var emailId = $('#emailId').val();
	 
		    //var json = { "firstName" : firstName, "lastName" :lastName,"emailId" :emailId,"id": id};

		    var json = { "firstName" : firstName, "lastName" :lastName,"emailId" :emailId,"id": id};
		    
	      console.log(json);
	      $.ajax({
	    	   data: JSON.stringify(json),
	    	   async : false,
		         contentType : 'application/json',
		         dataType : 'json',
	        type: "POST",
	        
	        url: "${pageContext.request.contextPath}/showRoom/saveEquipmentsToUser",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(response) {
	        		  window.location.href = "${pageContext.request.contextPath}/list";
	        }
	    });
	  });
	});
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	  /*   $.ajax({
	    	 method : 'POST',
	         async : false,
	         contentType : 'application/json',
	         dataType : 'json',
	    	   data: JSON.stringify(json),
    		   url: "${pageContext.request.contextPath}/showRoom/saveEquipmentsToUser",
	        success: function(data) {
	        	window.location.href = "${pageContext.request.contextPath}/showRoom/dataTable";
	        }
	    });
	  });
	}); */

</script> -->
<!-- 
<script type="text/javascript">

//$("#saveEquipmentButton").on("click", function(e){
	 $('#material').submit(function(event) {

	var id = $('#id').val();
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var emailId = $('#emailId').val();
	
	
    var json = { "firstName" : firstName, "lastName" :lastName,"emailId" :emailId,"id": id};
	
    
   /*  $("#submit").click(function(){
    	var developerData = {};
    	developerData["id"] = $("#id").val();
    	developerData["firstName"] = $("#firstName").val();
    	developerData["lastName"] = $("#lastName").val();
    	
    	
    	$.ajax({
    		type : "POST",
    		contentType : "application/json",
    		url : "getDefectCount",
    		data : JSON.stringify(developerData),
    		dataType : 'json',				
    		success : function(data) {
    			// Code to display the response.
    		}
    	});
    });
	 */
 $.ajax({
		type: "POST",
		//async : false, 
		//dataType : 'application/json', 
		data : JSON.stringify(json),
		contentType : "application/json",
		dataType : 'json',
		
		
		
		
	// dataType : 'json', 
		//enctype: 'multipart/form-data',
		//url : "${pageContext.request.contextPath}/showRoom/saveEquipmentsToUser",
		
		url : "${pageContext.request.contextPath}/showRoom/saveEquipmentsToUser",
		
		processData: false, 
		//contentType : false, 
		
		error : function(e) {
			console.log(e);
		}, success : function(data, e) {
			window.location.href = "${pageContext.request.contextPath}/showRoom/dataTable";
		}
	});
	

	/*  if(validateEquipmentDetails())
	 {
	}
	 else {
		 e.preventDefault();
	 }  */
}); 
</script>  
 -->
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>


	<div class="sidenav">
		<a
			href="${pageContext.request.contextPath}/showRoom/dataTableEmployee">EmployeeList</a>
		<a href="${pageContext.request.contextPath}/showRoom/dataTable">ShowRoomlist</a>

	</div>


	<div class="main">


		<div style="width: 600px; margin: auto;">
			<h3 align="center">
				<b>Add a new Employee</b>
			</h3>



			<form:form id="material" class="form-horizontal" action="saveEmployee" 
				modelAttribute="employee">
				<form:hidden path="id" />



				<div class="form-row">

					<div class="col">
						<label class="control-label col-sm-6" for="firstName">firstName
						</label>
						<form:input path="firstName" id="firstName" class="form-control"
							placeholder="firstName" />
					</div>

					<div class="col">
						<label class="control-label col-sm-6" for="lastName">lastName:</label>
						<form:input path="lastName" id="lastName" class="form-control"
							placeholder="lastName Name" />
					</div>

				</div>

				<div class="form-row">
					<div class="col">
						<label class="control-label col-sm-6" for=" emailId">
							emailId :</label>
						<form:input path="emailId" id="emailId" class="form-control"
							placeholder="emailId" />
					</div>

				</div>



				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					 <button type="submit"  id ="saveEquipmentButton" class="btn btn-danger">Submit</button> 

						<!-- <button style="visibility: visible" class="btn btn-primary"
							onclick="callJqueryAjax()">Submit</button> -->

					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>





<%-- 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring MVC 5 - form handling | Java Guides</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
	
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-grid.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-grid.min.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-reboot.css" />"
	rel="stylesheet">	
	
	<link href="<c:url value="/resources/css/bootstrap-reboot.min.css" />"
	rel="stylesheet">
	
	
	
	<script src="<c:url value="/resources/js/bootstrap.bundle.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	
	
	
	
	
	
	
	
	
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


		
			<div class="form-row">

				<div class="col">
					<label class="control-label col-sm-6" for="assetName">Material
						Name:</label>
					 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>

				<div class="col">
					<label class="control-label col-sm-6" for="reference">Reference:</label>
			 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>

			</div>
	<!-- <div class="container">
		<div class="col-md-offset-2 col-md-7">
			<h3 class="text-center">Spring MVC 5 + Spring Data JPA 2 + JSP + MySQL
				Example - Customer Management</h3>
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Add Employee</div>
				</div>
				<div class="panel-body">
					
			<div class="form-row">

				<div class="col">
					<label class="control-label col-sm-6" for="assetName">Material
						Name:</label>
					 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>

				<div class="col">
					<label class="control-label col-sm-6" for="reference">Reference:</label>
			 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>

			</div>
				</div>
			</div>
		</div>
	</div> -->
</body>
</html> --%>