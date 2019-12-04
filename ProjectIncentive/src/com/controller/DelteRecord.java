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

public class DelteRecord extends HttpServlet {
	
	private Connection con = null;
	private Statement stmt = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String reportno = request.getParameter("reportno");
		String name = request.getParameter("name");
		try 
		{
			con = Oracle_Connection.getConnection();
			stmt = con.createStatement();
			String findQuery = "delete from incentives_report where REPORT_NUMBER = '"+reportno+"' and EMPLOYEE_NAME='"+name+"'";
			stmt.executeQuery(findQuery);
			
			stmt.close();
			con.close();
			
			response.sendRedirect("ShowDataForDelete");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
			
	}

}
