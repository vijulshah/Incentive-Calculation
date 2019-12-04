package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Oracle_Connection;

public class ShowDB extends HttpServlet {
	
	private Connection con = null;
	private Statement stmt = null;
	private String fromDate = null;
	private String toDate = null;
	private int flag=0;
	ArrayList<String> arrayList;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		if(request.getParameter("fromDate")!=null||request.getParameter("toDate")!=null)
		{
			fromDate = request.getParameter("fromDate");
			toDate = request.getParameter("toDate");
			if(request.getAttribute("clear")!=null)
			{
				flag=(int)request.getAttribute("clear");
			}
		}
		
		try 
		{
			con = Oracle_Connection.getConnection();
			stmt = con.createStatement();
			if(request.getParameter("fromDate")!=null||request.getParameter("toDate")!=null)
			{
				fromDate = request.getParameter("fromDate");
				toDate = request.getParameter("toDate");
				if(flag!=1)
				{
					if(fromDate.trim().length()!=0||toDate.trim().length()!=0||!fromDate.equals(null)||!toDate.equals(null))
					{
						String storeFromDate = fromDate.substring(8,10);
						storeFromDate = storeFromDate + fromDate.substring(4,8);
						storeFromDate = storeFromDate + fromDate.substring(2,4);
					
						String storeToDate = toDate.substring(8,10);
						storeToDate = storeToDate + toDate.substring(4,8);
						storeToDate = storeToDate + toDate.substring(2,4);
					
						String findQuery = "select * from incentives_report where job_date between '"+storeFromDate+"' and '"+storeToDate+"'";
						stmt.executeQuery(findQuery);
						request.setAttribute("fromDateValue", fromDate);
						request.setAttribute("toDateValue", toDate);
					}
				}
				else if(flag==1)
				{
					fromDate = null;
					toDate = null;
					
					String findQuery = "select * from incentives_report";
					stmt.executeQuery(findQuery);
				}
			}
			else
			{
				String findQuery = "select * from incentives_report";
				stmt.executeQuery(findQuery);
			}
			ResultSet rs = stmt.getResultSet();
			arrayList = new ArrayList<String>();
			
			while(rs.next())
			{
				for(int i=1; i<=29; i++)
				{
					arrayList.add(rs.getString(i));
				}
			}
			
			stmt.close();
			rs.close();
			con.close();
			request.setAttribute("DB_Result_ArrayList", arrayList);
			RequestDispatcher rd = request.getRequestDispatcher("ShowDB.jsp");
			rd.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}
}
