package com.operations;

import java.io.IOException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class addNote  extends HttpServlet 
{
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
	

}
