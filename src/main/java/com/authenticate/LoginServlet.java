package com.authenticate;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {
	static final String url = "jdbc:mysql://localhost:3306/Vnote"; // required for jdbc
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
					session.setAttribute("user", email); // i am sending email as the corresponding value for user
					res.sendRedirect("main.jsp");
				} 
				else
				{	
					
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
			} catch (ClassNotFoundException e) {
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
	public boolean valid_login(String email, String password) throws SQLException, ClassNotFoundException 
	{ // data base code goes here
		Class.forName("com.mysql.jdbc.Driver");
		try ( Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword); Statement smt = conn.createStatement();) {
			//smt.executeUpdate("USE Vnote"); // select jdbc
			
			

//			email="shreyas@gmail.com";
//			password="shreyas";
			
			ResultSet rs = smt.executeQuery("SELECT * FROM userauth WHERE email= '" + email+"'");
													
			if (rs.next()) {
			
				String pass = rs.getString("pass");
				System.out.println("Password in DB: " + rs.getString("pass"));
				if (pass.equals(password)) { // check password
					return true;
				}

				else {
					return false;
				} 
			}
			else {
				
				return false;
			}
		}
	}

}