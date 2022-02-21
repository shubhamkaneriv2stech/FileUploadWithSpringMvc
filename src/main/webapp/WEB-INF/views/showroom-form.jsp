
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<title>Add ShowRoom!</title>


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

.img
{
height: 100px;
width:100px;
margin-left: 10px;
padding: 60px 90px;

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
<script type="text/javascript">
	function addObject() {
	
		    
		    var id = $('#id').val();
		    var showRoomName = $('#showRoomName').val();
		    var username = $('#username').val();
		    var registrationNo = $('#registrationNo').val();
		    var ownerName = $('#ownerName').val();
		    var address1 = $('#address1').val();
		    var registrationDate = $('#registrationDate').val(); 
		    var list = $('#list').val();
		    
		   // var license = $('#license').val();
		    
		    
		    var license =  $("input[type='radio'][name='license']:checked").val();
		    
		    var json = { "showRoomName" : showRoomName, "username" :username,"registrationNo" :registrationNo,
		    		"ownerName" :ownerName,"address1" :address1, 
		    		"registrationDate" :registrationDate,"list" :list,"license" :license,"id": id};
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
			 url: '${pageContext.request.contextPath}/showRoom/saveShowRoom',
			success : function(data) {
				window.location.href = "${pageContext.request.contextPath}/showRoom/dataTable";
			}
		});
	}
</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	  $('#material').submit(function(event) {
	      var assetName = $('#assetName').val();
	      var reference = $('#reference').val();
	      var serialNumber = $('#serialNumber').val();
	      var model = $('#model').val();
	      var type = $('#type').val();
	      var make = $('#make').val();
	      var status = $('#status :selected').val();
	      var operational = $('#operational  :selected').val();
	      var specification = $('input[name="specification"]:checked').val();
	      var assetNotes = $('#assetNotes').val();
	      
	      var purchaseDate=$('#purchaseDate').val();
	      var id = $('#id').val();
	   

	      var json = { "assetName" : assetName, "reference" :reference,"serialNumber" :serialNumber,
	    		  "model" :model,"type" :type,"make"  :make,"purchaseDate"  :purchaseDate,
	    		  "status" :status,"operational" :operational,"specification" :specification, 
	    		  "assetNotes" :assetNotes,    "id": ""};

		      /* 
		      var json = { "assetName" : assetName, "reference" :reference,"serialNumber" :serialNumber,
		    		  "model" :model,"type" :type,"make"  :make,
		    		  "status" :status,"operational" :operational,"specification" :specification, 
		    		  "assetNotes" :assetNotes,    "id": ""};
		        */
	      console.log(json);
	    $.ajax({
	    	   url: $("#material").attr( "action"),
	    	   data: JSON.stringify(json),
	    	   
	    	/*     data: JSON.stringify('{"companyName":"shubham","companycode":"shubham007","id":1,"cars":
	    		   [{"id":1,"carName":"carName"},{"id":2,"carName":"carName2"}]}'),  */
	    		   
	        type: "POST",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(response) {
	        		  window.location.href = "${pageContext.request.contextPath}/list";
	        }
	    });
	  });
	});

</script>  -->

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

<div class="img">
				
				
						<img width="600"
							src="<c:url value='/resources/files/'/>${showRooms.name}" />
			
			

			
				</div>

		<div style="width: 600px; margin: auto;">
			<h3 align="center">
				<b>Add a new Material</b>
			</h3>

			<form:form class="form-horizontal" method="post"
				action="saveShowRoom" modelAttribute="showRooms"
				enctype="multipart/form-data">
				<form:hidden path="id" id="id" />

				<div class="form-row">

					<div class="col">
						<label class="control-label col-sm-6" for="showRoomName">showRoomName
						</label>
						<form:input path="showRoomName" id="showRoomName"
							class="form-control" placeholder="showRoomName" />
					</div>

					<div class="col">
						<label class="control-label col-sm-6" for="username">username:</label>
						<form:input path="username" id="username" class="form-control"
							placeholder="username Name" />
					</div>

				</div>

				<div class="form-row">
					<div class="col">
						<label class="control-label col-sm-6" for="registrationNo">registrationNo
							:</label>
						<form:input path="registrationNo" id="registrationNo"
							class="form-control" placeholder="registrationNo" />
					</div>
					<div class="col">
						<label class="control-label col-sm-6" for="ownerName">ownerName:</label>
						<form:input path="ownerName" id="ownerName" class="form-control"
							placeholder="ownerName Name" />
					</div>
				</div>

				<div class="form-row">
					<div class="col">
						<label class="control-label col-sm-6" for="address1">address1
							:</label>
						<form:input path="address1" id="address1" class="form-control"
							placeholder="type" />
					</div>
				</div>

				<div class="form-row">
					<div class="col">
						<label class="control-label col-sm-6" for="registrationDate">registrationDate
							:</label>
						<form:input path="registrationDate" id="registrationDate"
							type="text" class="form-control"
							placeholder="registrationDate  in yyyy/MM/dd" />
					</div>
				</div>

				<div class="form-row">
					<div class="col">
						<label class="control-label col-sm-6" for="employeelists">
							Employee list :</label>

						<form:select path="employeelists" id="employeelists"
							class="form-control" multiple="true">
							<form:options items="${list}" />
						</form:select>
					</div>
				</div>


				<div class="col">
					<label class="control-label col-sm-3">license :</label> New
					vechicle dealer license
					<form:radiobutton path="license" id="license" value="1" />
					Used vechicle dealer license
					<form:radiobutton path="license" id="license" value="2" />
				</div>



				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="file">Upload a
							document</label>
						<div class="col-md-7">
							<form:input type="file" path="file" id="file"
								class="form-control input-sm" />


							<!-- <input type="file" name=""  class="form-control input-sm"/> -->
						</div>
					</div>
				</div>


			


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-danger">Submit</button>


						<!-- 				<button style="visibility: visible" class="btn btn-primary"
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