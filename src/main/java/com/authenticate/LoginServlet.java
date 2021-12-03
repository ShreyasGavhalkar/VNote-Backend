package com.authenticate;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {
	static final String url = "jdbc:mysql://localhost/"; // required for jdbc
	static final String sqlUser = "root";
	static final String sqlPassword = "root@SQL123";

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		System.out.println("In get post");
		if (session.getAttribute("user") == null || session.getAttribute("user") == "FAIL") {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			System.out.println("In session IF");
			
			try {
				if (valid_login(email, password)) 
				{
					System.out.println("In valid IF");
					session.setAttribute("user", email); // i am sending email as the corresponding value for user
					res.sendRedirect("main.jsp");
				} 
				else
				{	
					System.out.println("In session else");
					session.setAttribute("user", "FAIL");
					res.sendRedirect("login.jsp");
					// redirect to login jsp, display wrong password through jsp scripting
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		else
		{
			System.out.println("In session else");
			res.sendRedirect("main.jsp");
		}

	}
	public boolean valid_login(String email, String password) throws SQLException 
	{ // data base code goes here
		try (Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword); Statement smt = conn.createStatement();) {
			smt.executeUpdate("USE Vnote"); // select jdbc

			ResultSet rs = smt.executeQuery("SELECT * FROM userauth WHERE email= " + email);
													
			String pass = rs.getString("pass");
			System.out.println("Password passed: "+password);
			System.out.println("Password in DB: "+rs.getString("pass"));
			if (pass.equals(password)) { // check password
				return true;
			} 
			
			else {
				return false;				
			}
		}
	}

}