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
	//static final String sqlPassword;// = will decide this when the final machince is decided;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("user") == null) {
			String email = req.getParameter("email");
			String password = req.getParameter("password");

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
		} 
		else 
		{
			res.sendRedirect("main.jsp");
		}

	}

	public boolean valid_login(String email, String password) // Lord Shreyas has written this
	{ // data base code goes here
//		try (Connection conn = DriverManager.getConnection(url, user, pass); Statement smt = conn.createStatement();) {
//			smt.executeUpdate("USE Vnote"); // select jdbc
//
//			ResultSet rs = smt.executeQuery("SELECT * FROM userauth WHERE email= " + email);
//
//			String pass = rs.getString("pass");
//			if (pas.equals(password)) { // check password
//				return true;
//			} else {
//				return false;
//			}
//		} catch (SQLException e) {
//			// will decide what this does a bit later
//		}
		return true;
	}

}