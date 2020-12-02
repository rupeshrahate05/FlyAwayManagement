<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
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
	<h2>Registration Details</h2>

	<div class="center">
	<form action="payment.jsp">
		<%
		session.setAttribute("id", request.getParameter("Book"));
		
		
		Class.forName("com.mysql.jdbc.Driver");

		/* Get a reference to the Connection */
		Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");
		
		String source = session.getAttribute("source").toString();
		String dest= session.getAttribute("destination").toString();
		String traveldate= session.getAttribute("travelDate").toString();
		int n= Integer.parseInt(session.getAttribute("noOfPassengers").toString());
				
		String qry = "select * from flightdetails where flightNumber = '"+request.getParameter("Book")+"' and source='"+source+"' and destination='"+ 
					dest+"' and travelDate='"+traveldate+"' and availableSeat>=" + n + ";";
		
		Statement stmt = dbCon.createStatement();

		ResultSet rs = stmt.executeQuery(qry);
		while(rs.next()){
			session.setAttribute("flightNumber", rs.getString("flightNumber"));
			session.setAttribute("flightName",  rs.getString("flightName"));
			session.setAttribute("source",  rs.getString("source"));
			session.setAttribute("destination",  rs.getString("destination"));
			session.setAttribute("departureTime",  rs.getString("departureTime"));
			session.setAttribute("arrivalTime",  rs.getString("arrivalTime"));
			session.setAttribute("fare",  rs.getInt("fare"));
		}
		
		

		//Integer n = Integer.parseInt(session.getAttribute("noOfPassengers").toString());

		for (int i = 1; i <= n; i++) {
		%>
		<h3>
			Passenger
			<%=i%></h3>
		Name: <input type="text" id="username" name="username" required />
		Gender: <select name="gender" required>
			<option>Male</option>
			<option>Female</option>
		</select>
		<%
			}
		%>



		<br />
		<br />
		<br />
		<h3>Applicant:</h3>
		<br /> Email ID: <input type="email" id="emailId" name="emailId"
			required /> <br /> Phone No.: <input type="number"
			pattern="[0-9]{10}" required /> <br /> Date of Birth: <input
			type="date" id="dob" name="dob" required /> <br /> <br /> <br />
		<input type="submit" />
	</form>
	</div>
</body>
</html>