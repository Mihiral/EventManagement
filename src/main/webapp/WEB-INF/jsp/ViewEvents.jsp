<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View Event Information</title>
    <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
        .btn-cancel{
                   width 20%;
                   font-size: 16px;
                   cursor: pointer;
                   font-color: black;
                   background-color: cadetblue;
                 }
        .btn-logout{
                         width 20%;
                         position: absolute;
                         top: 10px;
                         right: 10px;
                           padding: 12px 16px;
                           font-size: 16px;
                           cursor: pointer;
                           font-color: black;
                         }
    </style>

</head>
<body style="background-color:darkseagreen;">

    <div class="container">

		<center><b><h1 class="p-3"> Events </h1></b></center>
      </button>
		<button type="button"  class= "btn btn-warning btn-logout">
		<i class="fa fa-sign-out" aria-hidden="true"></i>
			<a href="http://localhost:8080"/>Logout</a>
		</button>
        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Title</th>
            		<th>Event Start Date</th>
            		<th>Event End Date</th>
            		<th>Event Details</th>
					<th>Event Member</th>
					<th>Edit Action</th>
					<th>Delete Action</th>
            	</tr>

            	<c:forEach var="events" items="${eventList}">
                    <tr>
                		<td>${events.eventTitle}</td>
						<td>${events.eventStartDate}</td>
						<td>${events.eventEndDate}</td>
                		<td>${events.eventDetails}</td>
						<td>${events.eventConductedBy}</td>
						<td><button type="button" class="btn btn-success">
                		    <a href="/editEvent/${events.id}">Edit Event</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteEvent/${events.id}">Delete Event</a>
                		</button></td>
                	</tr>

            	</c:forEach>
            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addEvent">Add New Event</a>


    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Event added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Event deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete user")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Event updated successfully!!")
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