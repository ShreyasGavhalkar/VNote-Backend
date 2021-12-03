package com.operations;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class deleteNote  extends HttpServlet{
	
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
			
			if(!IDs.isEmpty())
			{ //delete in database, do the needful
				res.sendRedirect("main.jsp");
			}
			
			 
			
			
		}
	}
	
	public boolean delete_note(ArrayList<String> IDs)
	{
		return true;
	}

}
