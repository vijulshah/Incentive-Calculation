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

public class ShowStdValues extends HttpServlet {
	
	private Connection con = null;
	private Statement stmt1 = null;
	private Statement stmt2 = null;
	private Statement stmt3 = null;
	private ArrayList<String> arrayList1;
	private ArrayList<String> arrayList2;
	private ArrayList<String> arrayList3;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			con = Oracle_Connection.getConnection();
			
			stmt1 = con.createStatement();
			String findQuery1 = "SELECT * FROM DEFINED_STD_TIME_PER_LOT";
			stmt1.executeQuery(findQuery1);
			ResultSet rs1 = stmt1.getResultSet();
			arrayList1 = new ArrayList<String>();
			
			stmt2 = con.createStatement();
			String findQuery2 = "SELECT * FROM DEFINED_STD_WT_PER_HOUR";
			stmt2.executeQuery(findQuery2);
			ResultSet rs2 = stmt2.getResultSet();
			arrayList2 = new ArrayList<String>();
			
			stmt3 = con.createStatement();
			String findQuery3 = "SELECT * FROM DEFINED_STD_TIME_PER_SIZE";
			stmt3.executeQuery(findQuery3);
			ResultSet rs3 = stmt3.getResultSet();
			arrayList3 = new ArrayList<String>();
			
			while(rs1.next())
			{
				arrayList1.add(rs1.getString(1));
			}
			
			while(rs2.next())
			{
				arrayList2.add(rs2.getString(1));
			}
			
			while(rs3.next())
			{
				arrayList3.add(rs3.getString(1));
			}
			
			rs1.close();
			rs2.close();
			rs3.close();
			stmt1.close();
			stmt2.close();
			stmt3.close();
			con.close();
			
			request.setAttribute("DB_Result_ArrayList1", arrayList1);
			request.setAttribute("DB_Result_ArrayList2", arrayList2);
			request.setAttribute("DB_Result_ArrayList3", arrayList3);
			
			RequestDispatcher rd = request.getRequestDispatcher("DeleteSTD.jsp");
			rd.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}
}
