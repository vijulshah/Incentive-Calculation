package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Oracle_Connection;

public class DeleteStdWtPerHour extends HttpServlet {
	
	private Connection con = null;
	private Statement stmt = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String stdWtperHr = request.getParameter("stdWtperHr");
		try 
		{
			con = Oracle_Connection.getConnection();
			stmt = con.createStatement();
			String findQuery = "delete from DEFINED_STD_WT_PER_HOUR where STD_VALUE = '"+stdWtperHr+"'";
			stmt.executeQuery(findQuery);
			
			stmt.close();
			con.close();
		
			RequestDispatcher rd = request.getRequestDispatcher("ShowStdValues");
			rd.include(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}

}
