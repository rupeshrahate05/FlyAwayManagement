<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Password Change</title>    
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

<form action="successfulChange.jsp" method="post" class = "center">
	<h2>Password Configuration <br><br> <%=session.getAttribute("admin")%> </h2>
	Old Password:<input type="password" id="oldpwd" name="oldpwd" required/><br>
	New Password:<input type="password" id="newpwd" name="newpwd" required/><br/>
	Confirm new Password: <input type="password" id="pwd" name="pwd" required/><br/>
	
	<input type="submit" value="submit"/>
	<button onclick="goBack()">Go Back</button>

<script>
function goBack() {
  window.history.back();
}
</script>
</form>



</body>
</html>