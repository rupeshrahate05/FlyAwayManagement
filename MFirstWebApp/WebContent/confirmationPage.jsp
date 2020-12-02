<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation Page</title>
<style>
.center {
	margin: auto;
	width: 1000px;
	height: 100px;
	padding: 50px;
}
</style>
</head>
<body style="background-image: url('flight.jpg');">
	<h1 class="center">Payment is Successfully Done!!!</h1>

	<table border="3" class="center">
		<tr>
			<th>Flight Number</th>
			<th>Flight Name</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Travel Duration</th>
			<th>Fare</th>


		</tr>

		<tr>
			<td><%=session.getAttribute("flightNumber")%></td>
			<td><%=session.getAttribute("flightName")%></td>
			<td><%=session.getAttribute("source")%>
			<td><%=session.getAttribute("destination")%>
			<td><%=session.getAttribute("departureTime")%></td>
			<td><%=session.getAttribute("arrivalTime")%></td>
			<td><%=session.getAttribute("duration")%></td>
			<td><%=session.getAttribute("total")%></td>
			
		</tr>

	</table>
	<%
		/* Load the Driver */
	Class.forName("com.mysql.jdbc.Driver");
	/* Get a reference to the Connection */
	Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");
	%>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date travelDate = sdf.parse(session.getAttribute("travelDate").toString());

	Random random = new Random();
	int pnrNo = (random.nextInt(99) + 10);
	//query for inserting ticket details into confirmationdetails table
	String query = "INSERT INTO `confirmationdetails`(`flightNumber`, `pnrNumber`, `userName`, `passengerCount`) VALUES ('"
			+ session.getAttribute("flightNumber") + "'," + pnrNo + ", '" + session.getAttribute("userName").toString()
			+ "'," + Integer.parseInt(session.getAttribute("noOfPassengers").toString()) + ")";

	Statement stmt = dbCon.createStatement();
	int result = stmt.executeUpdate(query);

	if (result > 0) {
		//query to updte available seats into flightdetails table
		query = "update flightdetails set availableSeat = availableSeat - "
		+ Integer.parseInt(session.getAttribute("noOfPassengers").toString()) + " where travelDate='"
		+ session.getAttribute("travelDate") + "' and flightNumber='" + session.getAttribute("flightNumber") + "'";

		stmt = dbCon.createStatement();
		result = stmt.executeUpdate(query);
	}
	%>
	<br>
	<%
		out.println("<h3 class='center'>PNR Number : " + pnrNo+"</h3>");
	%>
</body>
</html>