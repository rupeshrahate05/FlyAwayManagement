<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Flight Details</title>
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


	String fQry = "SELECT source,destination, flightNumber, fare FROM flightdetails ";

	Statement stmt = dbCon.createStatement();

	ResultSet theResultSet = stmt.executeQuery(fQry);
	
	%>
	<button onclick="goBack()">Go Back</button><br><br>
	<table border="2" class= "center">
		<tr>
			<th>Source</th>
		    <th>Destination</th>
		    <th>Flight Name</th>
		    <th>Fare</th>
		</tr>
		<% while(theResultSet.next()) { %>
		
	  	<tr>
	  		<td>
	  			<%= theResultSet.getString("source") %> 
	  		</td>
	  		<td>
	  			<%= theResultSet.getString("destination") %> 
	  		</td>
	  		<td>
	  			<%= theResultSet.getString("flightNumber") %>
	  		</td>
	  		<td>
	  			<%= theResultSet.getString("fare") %> 
	  		</td>
	  		
	  		</tr>
	  		
	  		<% }
				dbCon.close();
	  		%>
	  		</table><br><br></br>
	  		<button onclick="goBack()">Go Back</button>


<script>
function goBack() {
  window.history.back();
}
</script>
	  		
</body>
</html>