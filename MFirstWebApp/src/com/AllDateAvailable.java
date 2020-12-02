

package com;

import java.sql.Connection;
import java.sql.DriverManager;



import java.sql.*;




public class AllDateAvailable {
public static void main(String[] args) {
	

	try {
	Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyawaydetails", "root", "");
	/* Write the query to get data from the table */
	
	Statement myStmt = dbConn.createStatement();
	
	String qry = null;
		
	for(int i = 1; i<32; i++) {
		qry = "insert into flightdetails values('2020-12-"+i+"','EA-27354','Etihad Airways','Pune','Chennai',6000,'10:00:00','11:00:00',200,200)";
	
		if(myStmt.executeUpdate(qry) == 1) {
			System.out.println("Done");
		}
	}
	
	dbConn.close();
}
	catch(Exception e) {
		System.out.println(e);
	}
	
	
}

}
