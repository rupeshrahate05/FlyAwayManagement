<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Source and Destination</title>
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


	String fQry = "SELECT flightdetails.source, flightdetails.destination FROM flightdetails ";

	Statement stmt = dbCon.createStatement();

	ResultSet theResultSet = stmt.executeQuery(fQry);
	
	%>
	<button onclick="goBack()">Go Back</button><br><br>
	<table border="2" class="center">
		<tr>
		<th>Source</th>
		    <th>Destination</th>
		</tr>
		<% while(theResultSet.next()) { %>
		
	  	<tr>
	  		<td>
	  			<%= theResultSet.getString(1) %> 
	  			<input type="hidden"  name = "sorce" value="<%= theResultSet.getString(1) %>" />
	  		</td>
	  		<td>
	  			<%= theResultSet.getString(2) %> 
	  			<input type="hidden"  name = "destination" value="<%= theResultSet.getString(2) %>" />
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