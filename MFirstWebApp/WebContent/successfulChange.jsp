<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Changed </title>
<style>
.center {
	margin: auto;
	width: 500px;
	height: 100px;
	padding: 50px;
}
</style>
</head>

<body style="background-image: url('flight.jpg'); ">
<div class="center">

	<%
		/* Load the Driver */
	Class.forName("com.mysql.jdbc.Driver");

	/* Get a reference to the Connection */
	Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");

	String oldPassword = request.getParameter("oldpwd");
	String newPassword = request.getParameter("newpwd");
	String cnfPassword = request.getParameter("pwd");

	String admin = session.getAttribute("admin").toString();
	
	String fQry = "select password from userdetails where userName= '" + admin + "'";

	Statement stmt = dbCon.createStatement();
	ResultSet theResultSet = stmt.executeQuery(fQry);

	String result = null;
	while (theResultSet.next()) {
		result = theResultSet.getString("password");
	}
	
	%>

	<%
		if (newPassword.equals(cnfPassword)) {
		if (result.equals(oldPassword)) {
			fQry = "update userdetails set password = '" + newPassword + "' where userName = '" + admin + "'";
			if (stmt.executeUpdate(fQry) == 1)
		out.println("<h3>Password Changed Successfully!!!</h3>");
			else
		out.println("<h3>System issue....Please try later</h3>");
		} else {
			out.println("<h3>Password Does Not Match</h3>");
			
		}
	} else {
		out.println("<h3>Error in New Password</h3>");
	}
	%><button onclick="goBack()">Go Back</button>

<script>
function goBack() {
  window.history.back();
}
</script>
</div>
</body>
</html>