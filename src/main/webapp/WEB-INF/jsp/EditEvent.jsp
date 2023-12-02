<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Edit Event</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
 .btn-cancel{
                    width 20%;
                    font-size: 16px;
                    cursor: pointer;
                    font-color: black;
                    background-color: cadetblue;
                  }
</style>

</head>
<body style="background-color:darkseagreen;">

    <div class="container">

        <h1 class="p-3"> Edit Event Information </h1>

        <form:form action="/editSaveEvent" method="post" modelAttribute="event">


			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="id">Id</label>
					<div class="col-md-6">
						<form:input type="text" path="id" id="id"
									class="form-control input-sm"  readonly="true" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="eventTitle">Title</label>
					<div class="col-md-6">
						<form:input type="text" path="eventTitle" id="eventTitle"
									class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="eventStartDate">Event Start Date</label>
					<div class="col-md-6">
						<form:input type="date" path="eventStartDate" id="eventStartDate"
									class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="eventEndDate">Event End Date</label>
					<div class="col-md-6">
						<form:input type="date" path="eventEndDate" id="eventEndDate"
									class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="eventDetails">Event Details</label>
					<div class="col-md-6">
						<form:input type="text" path="eventDetails" id="eventDetails"
									class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="eventConductedBy">Event Member</label>
					<div class="col-md-6">
						<form:input type="text" path="eventConductedBy" id="eventConductedBy"
									class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-md-2">
					<button type="submit" value="Register" class="btn btn-success">Save</button>
				</div>
				<button type="button" class="btn btn-warning btn-cancel">
                   <i class="fa fa-close" aria-hidden="true"></i>
                   <a href="/ViewEvents">Cancel</a>
                </button>
			</div>

                </form:form>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Edit Failure") {
        				Command: toastr["error"]("Something went wrong with the edit.")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>