package com.operations;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
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
	static final String url = "jdbc:mysql://localhost:3306/Vnote"; // required for jdbc
	static final String sqlUser = "root";
	static final String sqlPassword = "root@SQL123";
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
        HttpSession session = req.getSession();
		
		if(session.getAttribute("user")==null || session.getAttribute("user") == "FAIL")
        {
           
              res.sendRedirect("login.jsp");
              
              
        }
		else
		{
			
			String Notes = req.getParameter("NewNote");
			System.out.println(Notes);
			String email=(String) session.getAttribute("user");
			
			String[] details = Notes.split(",");
			ArrayList<String> Data = new ArrayList<String>(Arrays.asList(details));
			System.out.println("Data from user:"+Data);
			
		    try 
		    {
		    	
		    	
		    			
		    	if(add(email,Data.get(0),Data.get(1),(Data.get(1).equals("NULL")?0:1) ) )
				{
					res.sendRedirect("main.jsp");
				}
		    	else
		    	{
		    		//res.sendRedirect("main.jsp");
		    	}
		    }
		    catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}
	public boolean add(String email, String note, String deadline, int task) throws SQLException, ClassNotFoundException {
		
		//String email="shreyas@gmail.com", note="";  //hardcoded for now, will need the following:
													//email, note, task(could be int or bool) and deadline
		//int task=0;
		//int deadline=50;
		Class.forName("com.mysql.jdbc.Driver");
		try(Connection conn= DriverManager.getConnection(url, sqlUser, sqlPassword); Statement smt= conn.createStatement();){
			
			//smt.executeUpdate("USE Vnote"); //shift to the working DB
			    System.out.println("Email Passed: "+ email);
			    System.out.println("Note Passed: "+note);
			    System.out.println("Deadline passed: "+ deadline);
			    System.out.println("task: passed: "+ task);
			    
				smt.executeUpdate("INSERT INTO `"+email+"`(note,task,deadline) VALUES(\""+note+"\", \""+task+"\", \""+deadline+"\")");
				//TODO: figure out how to save deadline
				return true;	
		}
		catch (SQLException e) {
			e.printStackTrace();			//TODO: handle this shit
			return false;
		}
	}
	

}
