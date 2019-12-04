package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Oracle_Connection;

public class Enter_StdTimePerSize extends HttpServlet {
	
	private Connection con=null;
	private PreparedStatement ps = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String std_value = request.getParameter("std_value");
		try
		{
			con=Oracle_Connection.getConnection();
			String psQuery = "insert into  DEFINED_STD_TIME_PER_SIZE values (?)";
			ps = con.prepareStatement(psQuery);
			if(std_value!=null)
			{
				ps.setString(1, std_value);
				ps.executeUpdate();
				ps.close();
				con.close();
				request.setAttribute("action_result", "Std time per size :<br>"+std_value+" saved");
				RequestDispatcher rd = request.getRequestDispatcher("FillDetails.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("FillDetails.jsp");
			}
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
