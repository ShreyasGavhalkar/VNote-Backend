package com.operations;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

public class deleteNote  extends HttpServlet{
	static final String url = "jdbc:mysql://localhost:3306/trial"; // required for jdbc
	static final String sqlUser = "root";
	static final String sqlPassword = "root@SQL123";	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		HttpSession session = req.getSession();
		
//		if(session.getAttribute("user")==null || session.getAttribute("user") == "FAIL")
//        {
//           
//              res.sendRedirect("login.jsp");
//              
//        }
		//else
		{
			String IDs = req.getParameter("SelectedItems");
			System.out.println(IDs);
			
			String[] ID_array = IDs.split(",");
			ArrayList<String> ID_list= new ArrayList<String>(Arrays.asList(ID_array));  //for debugging
			
			if(!IDs.isEmpty())
			{   try {
				delete_note(ID_list,(String)session.getAttribute("user"));
				res.sendRedirect("main.jsp");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			}
			
			 //whenever you call the delete_note function, you will have to handle the ClassNotFound Exception
			//just add a try and catch and call it a day
			
			
		}
	}
	
	public boolean delete_note(ArrayList<String> IDs, String email) throws ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver"); 		//dont touch this.. this loads the jdbc driver, super important
		try(Connection conn= DriverManager.getConnection(url,sqlUser,sqlPassword); Statement smt= conn.createStatement()) {
			for(int i=0;i<IDs.size();i++) { //loop to iterate between elements of IDs
				
				
				String query="DELETE FROM `"+email+"` WHERE ID= "+IDs.get(i); //selects ith id form database and reduces it to atoms
				smt.executeUpdate(query);  //well this actually does that.. the line before just selects it..
				
			}
			return true;   //lord alok wanted every function to return something so here this is...
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();   //mandatory todo added which will obviouly be ignored
			return false;
		}
	}

}
