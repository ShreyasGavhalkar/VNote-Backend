package com.authenticate;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
	// init of req attributes for connection with DB
	static final String url = "jdbc:mysql://localhost:3306/Vnote"; // required for jdbc
	static final String sqlUser = "root";
	static final String sqlPassword = "root@SQL123";
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("user") == null || session.getAttribute("user") == "FAIL") {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			//String Fname = req.getParameter("Fname");
		// Lname = req.getParameter("Lname");

			try {
				System.out.println("in TRY");
				if (registered(password, email)) 
				{
					System.out.println("In session IF");
					session.setAttribute("user", email);
					res.sendRedirect("main.jsp");
				}
				else 
				{
					System.out.println("In session Else");
					session.setAttribute("user", "FAIL");
					res.sendRedirect("register.jsp");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} 
		
		else
		{
			res.sendRedirect("main.jsp");
		}

	}
	

	public boolean registered(String password, String email) throws ClassNotFoundException 
	{
		// code for registration
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword); Statement smt = conn.createStatement()) {
//			// checking for email in userauth, i am assuming passqord integrity is already
//			// verified
			
			System.out.println("Passed password: "+password);
			System.out.println("passed email: "+email);

			
			ResultSet rs = smt.executeQuery("SELECT * FROM userauth WHERE email= \"" + email+"\"");
			
			
			if (!rs.next()) { // rs will be empy if the email does not exist in our database, so this part
												// will add it to the databse
				System.out.println("Registering...");
				String query="INSERT INTO userauth VALUES(\""+email+"\", \""+password+"\")";
				System.out.println("query is: "+query);
				smt.executeUpdate(query);
				
				query="CREATE TABLE `"+email+"` (id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, note VARCHAR(8000), task INTEGER, deadline VARCHAR(100));";
				System.out.println("query is: "+query);
				smt.executeUpdate(query);
				
				return true;

			} else {
				// the user already exists which is a no no
				return false; 
			}

		}
		catch(SQLException e) {
			System.out.println("Exception occured "+e);
			return false;
			//TODO: handle exception
		}
		


	}


}
	