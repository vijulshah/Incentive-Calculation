package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Oracle_Connection;

public class ClearDB extends HttpServlet {
	
	private Connection con=null;
	private Statement stmt = null;
	private String fromDate = null;
	private String toDate = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if(request.getParameter("fromDate")!=null||request.getParameter("toDate")!=null)
		{
			fromDate = request.getParameter("fromDate");
			toDate = request.getParameter("toDate");
		}
		
		try
		{
			con=Oracle_Connection.getConnection();
			stmt=con.createStatement();
			if(request.getParameter("fromDate")!=null||request.getParameter("toDate")!=null)
			{
				fromDate = request.getParameter("fromDate");
				toDate = request.getParameter("toDate");
				
					if(fromDate.trim().length()!=0||toDate.trim().length()!=0||!fromDate.equals(null)||!toDate.equals(null)||toDate!=" "||fromDate!=" ")
					{
						String storeFromDate = fromDate.substring(8,10);
						storeFromDate = storeFromDate + fromDate.substring(4,8);
						storeFromDate = storeFromDate + fromDate.substring(2,4);
					
						String storeToDate = toDate.substring(8,10);
						storeToDate = storeToDate + toDate.substring(4,8);
						storeToDate = storeToDate + toDate.substring(2,4);
					
						String findQuery = "DELETE FROM INCENTIVES_REPORT where job_date between '"+storeFromDate+"' and '"+storeToDate+"'";
						stmt.executeQuery(findQuery);
						request.setAttribute("fromDateValue", fromDate);
						request.setAttribute("toDateValue", toDate);

						request.setAttribute("action_result", "Data from<br> "+storeFromDate+" to "+storeToDate+"<br> Deleted");
					}
			}
			else
			{
				String stmtQuery = "DELETE FROM INCENTIVES_REPORT";
				stmt.executeQuery(stmtQuery);
				request.setAttribute("action_result", "All Data<br>Deleted");
			}
			stmt.close();
			con.close();
			RequestDispatcher rd = request.getRequestDispatcher("FillDetails.jsp");
			rd.forward(request, response);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}

}
