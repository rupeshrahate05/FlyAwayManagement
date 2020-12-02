<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.center {
	margin: auto;
	width: 500px;
	height: 100px;
	padding: 50px;
}
</style>
<body style="background-image: url('flight.jpg');">
	<%
		/* Load the Driver */
	Class.forName("com.mysql.jdbc.Driver");

	/* Get a reference to the Connection */
	Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");

	String userName = request.getParameter("uname");
	session.setAttribute("admin", userName);

	String password = request.getParameter("psw");

	String fQry = "SELECT * FROM userdetails where userName = '" + userName + "'";

	Statement stmt = dbCon.createStatement();

	ResultSet theResultSet = stmt.executeQuery(fQry);

	String result = null;
	while (theResultSet.next()) {
		result = theResultSet.getString("password");
	}
	%>
	<%
		if (result.equals(password)) {
	%>

	<h1>Welcome <%=session.getAttribute("admin")%></h1>
	<br />

	<table border="2" class= "center">
		<tr>
			<th><a href="changePassword.jsp">Change password</a>
			<th><br> <br />
			<th><a href="listSD.jsp">List of source and Destination</a>
			<th><br> <br />
			<th><a href="listAirline.jsp">List of Airlines</a>
			<th><br> <br />
			<th><a href="listFlightDetails.jsp">List of Flight Details</a>

			<br> <br />
		</tr>

	</table>
	<%} else {
	%>
	<form action="adminDashboard.jsp" method="post" >
		<label for="uname"><b>Username</b></label> <input type="text"
			placeholder="Enter Username" name="uname" required><br>
		<br> <label for="psw"><b>Password</b></label> <input
			type="password" placeholder="Enter Password" name="psw" required><br>
		<br>
		<h4>Invalid username/password</h4>
		<button type="submit">Login</button>
		<button type="button" class="cancelbtn">Cancel</button>
	</form>

	<%
		}
	dbCon.close();
	%>


</body>
</html>