package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Oracle_Connection;

public class EnterRecordToDB extends HttpServlet {

	private Connection con=null;
	private PreparedStatement ps = null;
	
	ArrayList<String> string_list = new ArrayList<String>();
	ArrayList<Double> double_list = new ArrayList<Double>();
	ArrayList<String> extra_names = new ArrayList<String>();
	
	String date;
	String reportNo;
	String workerName;
	String jobName;
	String workingShift;
	String noOfLotSlittingPaper;
	String noOfLotSlittingPolyester;
	String noOfLotSlitting_Paper_Polyester;
	String productionInKg_Rewinding_Paper_Polyester;
	String productionInKg_Rewinding_Paper_Polyester1;
	String productionInKg_Rewinding_Paper_Polyester2;
	String noOfSizeChange1;
	String noOfSizeChange2;
	
	Double working_Hours ;
	Double std_Time_per_Lot_SlittingPaper;
	Double std_Time_per_Lot_SlittingPolyester;
	Double std_Time_per_Lot_Slitting_Paper_Polyester;
	Double std_wt_per_hour_Rewinding_Paper_Polyester;
	Double std_wt_per_hour_Rewinding_Paper_Polyester1;
	Double std_wt_per_hour_Rewinding_Paper_Polyester2;
	Double std_Time_per_Size1;
	Double std_Time_per_Size2;
	Double totalProd1;
	Double totalProd2;
	Double totalProd3;
	Double totalProd4 ;
	Double totalProd5;
	Double totalProd6;
	Double finalIncentive;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);
		string_list = (ArrayList)session.getAttribute("String_ArrayList");
		
		double_list = (ArrayList)session.getAttribute("Double_ArrayList");
		
		extra_names = (ArrayList)session.getAttribute("Extra_Workers");
		
		date = string_list.get(0);
		reportNo = string_list.get(1);
		workerName = string_list.get(2);
		jobName = string_list.get(3);
		workingShift = string_list.get(4);
		noOfLotSlittingPaper = string_list.get(5);
		noOfLotSlittingPolyester = string_list.get(6);
		noOfLotSlitting_Paper_Polyester = string_list.get(7);
		productionInKg_Rewinding_Paper_Polyester = string_list.get(8);
		productionInKg_Rewinding_Paper_Polyester1 = string_list.get(9);
		productionInKg_Rewinding_Paper_Polyester2 = string_list.get(10);
		noOfSizeChange1 = string_list.get(11);
		noOfSizeChange2 = string_list.get(12);
		
		working_Hours = double_list.get(0);
		std_Time_per_Lot_SlittingPaper = double_list.get(1);
		std_Time_per_Lot_SlittingPolyester = double_list.get(2);
		std_Time_per_Lot_Slitting_Paper_Polyester = double_list.get(3);
		std_wt_per_hour_Rewinding_Paper_Polyester = double_list.get(4);
		std_wt_per_hour_Rewinding_Paper_Polyester1 = double_list.get(5);
		std_wt_per_hour_Rewinding_Paper_Polyester2 = double_list.get(6);
		std_Time_per_Size1 = double_list.get(7);
		std_Time_per_Size2 = double_list.get(8);
		totalProd1 = double_list.get(9);
		totalProd2 = double_list.get(10);
		totalProd3 = double_list.get(11);
		totalProd4 = double_list.get(12);
		totalProd5 = double_list.get(13);
		totalProd6 = double_list.get(14);
		finalIncentive = double_list.get(15);
		
		try
		{
			con=Oracle_Connection.getConnection();
			storeToDB(string_list.get(2));
			
			for(int i=0;i<extra_names.size();i++)
			{
				storeToDB(extra_names.get(i));
			}
			con.close();
			session.invalidate();
			response.sendRedirect("FillDetails.jsp?action_result=Data Saved");
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

	private void storeToDB(String worker_name) throws SQLException 
	{
		String psQuery = "insert into incentives_report values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ps = con.prepareStatement(psQuery);
		ps.setString(1, date);
		ps.setString(2, reportNo);
		ps.setString(3, worker_name);
		ps.setString(4, jobName);
		ps.setDouble(5, working_Hours);
		ps.setString(6, workingShift);
		ps.setString(7, noOfLotSlittingPaper);
		ps.setString(8, noOfLotSlittingPolyester);
		ps.setString(9, noOfLotSlitting_Paper_Polyester);
		ps.setString(10, productionInKg_Rewinding_Paper_Polyester);
		ps.setString(11, productionInKg_Rewinding_Paper_Polyester1);
		ps.setString(12, productionInKg_Rewinding_Paper_Polyester2);
		ps.setDouble(13, std_Time_per_Lot_SlittingPaper);
		ps.setDouble(14, std_Time_per_Lot_SlittingPolyester);
		ps.setDouble(15, std_Time_per_Lot_Slitting_Paper_Polyester);
		ps.setDouble(16, std_wt_per_hour_Rewinding_Paper_Polyester);
		ps.setDouble(17, std_wt_per_hour_Rewinding_Paper_Polyester1);
		ps.setDouble(18, std_wt_per_hour_Rewinding_Paper_Polyester2);
		ps.setString(19, noOfSizeChange1);
		ps.setDouble(20, std_Time_per_Size1);
		ps.setString(21, noOfSizeChange2);
		ps.setDouble(22, std_Time_per_Size2);
		ps.setDouble(23, totalProd1);
		ps.setDouble(24, totalProd2);
		ps.setDouble(25, totalProd3);
		ps.setDouble(26, totalProd4);
		ps.setDouble(27, totalProd5);
		ps.setDouble(28, totalProd6);
		ps.setDouble(29, finalIncentive);
		ps.executeUpdate();
		ps.close();		
	}
}
