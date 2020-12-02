<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jdbc Code here</title>
<style>
.center {
	margin: auto;
	width: 500px;
	height: 100px;
	padding: 50px;
}
</style>
</head>

<body style="background-image: url('flight.jpg');">
	<%
		/* DONT FORGET TO ADD THE MYSQL CONNECTOR J INTO YOUR CLASSPATH */

	/* Load the Driver */
	Class.forName("com.mysql.jdbc.Driver");

	/* Get a reference to the Connection */
	Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");

	String source = request.getParameter("source");
	session.setAttribute("source", source);

	String destination = request.getParameter("destination");
	session.setAttribute("destination", destination);

	String travelDateStr = request.getParameter("travel_date");
	session.setAttribute("travelDate", travelDateStr);

	int noOfPassengers = Integer.parseInt(request.getParameter("passengers"));
	session.setAttribute("noOfPassengers", noOfPassengers);

	/* Write the query to get data from the table */
	String qry = "SELECT flightdetails.fare, DATE_FORMAT(flightdetails.departureTime, \"%H:%i\") AS departureTime, DATE_FORMAT(flightdetails.arrivalTime, \"%H:%i\") AS arrivalTime, timediff(arrivalTime,departureTime) as duration,flightdetails.source,flightdetails.destination, airlinedetails.flightNumber, airlinedetails.flightName FROM flightdetails "
			+ "INNER JOIN airlinedetails ON flightdetails.flightNumber = airlinedetails.flightNumber"
			+ " where flightdetails.source='" + source + "' and flightdetails.destination='" + destination
			+ "' and flightdetails.travelDate='" + travelDateStr + "' and flightdetails.availableSeat>=" + noOfPassengers + ";";

	Statement stmt = dbCon.createStatement();

	ResultSet theResultSet = stmt.executeQuery(qry);
	%>
	<div class="center">
	<form action="dbConnect.jsp" method="post">
		Source:<input type="text" id="source" name="source" required /><br>
		Destination:<input type="text" id="destination" name="destination"
			required /><br /> Travel Date: <input type="date" id="travel_date"
			name="travel_date" required /><br /> No of passengers: <input
			type="number" id="passengers" name="passengers" required /><br /> <input
			type="submit" />
	</form>
	<form name="form" method="post" action="registrationPage.jsp">
		<table border="2">
			<tr>
				<th>Flight Number</th>
				<th>Flight Name</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Duration</th>
				<th>Fare</th>
				<th></th>
			</tr>
			<%
				while (theResultSet.next()) {
			%>
			<tr>
				<td><%=theResultSet.getString("airlinedetails.flightNumber")%>
					<input type="hidden" name="flightNumber"
					value="<%=theResultSet.getString("airlinedetails.flightNumber")%>" />
				</td>
				<td><%=theResultSet.getString("airlinedetails.flightName")%>
					<input type="hidden" name="flightName"
					value="<%=theResultSet.getString("airlinedetails.flightName")%>" />
				</td>
				<td><%=theResultSet.getString("flightdetails.source")%> <input
					type="hidden" name="source"
					value="<%=theResultSet.getString("flightdetails.source")%>" /></td>
				<td><%=theResultSet.getString("flightdetails.destination")%>
					<input type="hidden" name="destination"
					value="<%=theResultSet.getString("flightdetails.destination")%>" />
				</td>
				<td><%=theResultSet.getString("departureTime")%> <input
					type="hidden" name="departureTime"
					value="<%=theResultSet.getString("departureTime")%>" /></td>
				<td><%=theResultSet.getString("arrivalTime")%> <input
					type="hidden" name="arrivalTime"
					value="<%=theResultSet.getString("arrivalTime")%>" /></td>
				<td><%=theResultSet.getString("duration")%> <input
					type="hidden" name="duration"
					value="<%=theResultSet.getString("duration")%>" /></td>
				<td><%=theResultSet.getString("flightdetails.fare")%> <input
					type="hidden" name="fare"
					value="<%=theResultSet.getString("flightdetails.fare")%>" /></td>
				<td><input type="submit" name="Book" value="<%=theResultSet.getString("airlinedetails.flightNumber")%>"/>
				</td>
			</tr>
			<%
				}
			dbCon.close();
			%>
		</table>
	</form>
</div>
</body>
</html>