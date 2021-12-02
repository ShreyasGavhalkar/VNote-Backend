package com.authenticate;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
	// init of req attributes for connection with DB
	static final String url = "jdbc:mqsql://localhost/";
	static final String user = "root";
	static final String pass= "root@SQL123";

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("user") == null || session.getAttribute("user") == "FAIL") {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String Fname = req.getParameter("Fname");
			String Lname = req.getParameter("Lname");

			if (registered(Fname, Lname, password, email)) 
			{
				session.setAttribute("user", email);
				res.sendRedirect("main.jsp");
			}
			else 
			{
				session.setAttribute("user", "FAIL");
				res.sendRedirect("register.jsp");
			}

		} 
		
		else
		{
			res.sendRedirect("main.jsp");
		}

	}
	

	public boolean registered(String Fname, String Lname, String password, String email) // Lord Shreyas will write this
	{
		// code for registration
		try (Connection conn = DriverManager.getConnection(url, user, password); Statement smt = conn.createStatement()) {
//			// checking for email in userauth, i am assuming passqord integrity is already
//			// verified
			smt.executeUpdate("USE trial"); //TODO: chnage to final DB before presentation
			ResultSet rs = smt.executeQuery("SELECT * FROM userauth WHERE email= " + email);
			if (!rs.next()) { // rs will be empy if the email does not exist in our database, so this part
												// will add it to the databse
				System.out.println("Registering...");
				smt.executeUpdate("INSERT INTO userauth VALUES(email= " + email + ", fname= " + Fname + ", lname= " + Lname
						+ ",pass= " + password + ")");
				return true;

			} else {
				// the user already exists which is a no no
				return false; // politely tell the user to stop spamming and fuck off
			}

		}
		catch(SQLException e) {
			return false;
			//TODO: handle exception
		}
		


	}


}
	