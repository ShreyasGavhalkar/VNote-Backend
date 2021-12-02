package com.operations;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class addNote  extends HttpServlet 
{
	static final String url = "jdbc:mysql://localhost/"; // init attributes for jdbc
	static final String sqlUser = "root";
	static final String sqlPass= "root@SQL123";
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
        HttpSession session = req.getSession();
		
		if(session.getAttribute("user")==null || session.getAttribute("user") == "FAIL")
        {
           
              res.sendRedirect("login.jsp");
              
              
        }
		else
		{
			
			
			
			 res.sendRedirect("main.jsp");
		}
		
		
		
	}
	public boolean add() throws SQLException {
		String email="shreyas@gmail.com", note="";  //hardcoded for now, will need the following:
													//email, note, task(could be int or bool) and deadline
		int task=0;
		int deadline=50;
		try(Connection conn= DriverManager.getConnection(url, sqlUser, sqlPass); Statement smt= conn.createStatement();){
			
			smt.executeUpdate("USE Vnote"); //shift to the working DB
			
			ResultSet rs= smt.executeQuery("SHOW TABLES LIKE 'shreyas@gmail.com");
			
			if(!rs.next()) {   //empty result set.. the tbale does not exist..
				
				smt.executeUpdate("CREATE TABLE `"+email+"`(note VARCHAR(8000), task INTEGER, deadline INTEGER)");
				//create new table with email as name
				
				smt.executeUpdate("INSERT INTO `"+email+"` VALUES("+note+", "+task+", "+deadline+")");
				//TODO: figure out how to save deadline
				return true;
			}
			else { //the user already has a table named after them.. just add the note
				smt.executeUpdate("INSERT INTO `"+email+"` VALUES("+note+", "+task+", "+deadline+")");
				return true;
			}	
		}
		catch (SQLException e) {
			//TODO: handle this shit
			return false;
		}
	}
	

}
