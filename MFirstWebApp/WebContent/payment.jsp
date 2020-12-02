<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
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
	<form action="confirmationPage.jsp" class="center">

		<%
			session.setAttribute("userName", request.getParameter("emailId"));
		int fare = Integer.parseInt(session.getAttribute("fare").toString());
		int n = Integer.parseInt(session.getAttribute("noOfPassengers").toString());
		int total = fare * n;
		session.setAttribute("total", total);
		%>
		<h3>
			Fare : Rs.<%=total%></h3>
		<br />
		<br />
		<h3>Applicant:</h3>
		<br /> Name on Card: <input type="text" id="name_on_card"
			name="name_on_card" required /> <br /> Card No.: <input type="text"
			pattern="[0-9]{4}" required placeholder="1234" size="4" />- <input
			type="text" pattern="[0-9]{4}" required placeholder="5678" size="4" />-
		<input type="text" pattern="[0-9]{4}" required placeholder="9876"
			size="4" />- <input type="text" pattern="[0-9]{4}" required
			placeholder="1234" size="4" /> <br /> CVV No.: <input type="text"
			pattern="[0-9]{3}" required size="4" /> <br /> Expiry Date: <input
			type="text" pattern="[0-9]{2}" placeholder="mm" required size="2" />/<input
			type="text" pattern="[0-9]{2}" placeholder="yy" required size="2" />
		<br /> <br /> <input type="submit" />
	</form>
</body>
</html>