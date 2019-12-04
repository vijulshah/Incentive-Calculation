package com.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.IncentivesCalculation;

public class IncentiveDetails extends HttpServlet {
	
	private String date;
	private String reportNo;
	private String workerName;
	private String workerName2=null;
	private String workerName3=null;
	private String workerName4=null;
	private String workingHours;
	private String workingShift;
	private String jobName;
	private String noOfSizeChange1;
	private String stdTimePerSize1;
	private String noOfSizeChange2;
	private String stdTimePerSize2;
	private double totalProdInMin;
	private double incentive_A;
	private double incentive_B;
	private double finalIncentive;
	private String noOfLotSlittingPaper;
	private String stdTimePerLotSlittingPaper;
	private String noOfLotSlittingPolyester;
	private String stdTimePerLotSlittingPolyester;
	private String noOfLotSlitting_Paper_Polyester;
	private String stdTimePerLotSlitting_Paper_Polyester;
	private String productionInKg_Rewinding_Paper_Polyester;
	private String stdWtPerHour_Rewinding_Paper_Polyester;
	private String productionInKg_Rewinding_Paper_Polyester1;
	private String stdWtPerHour_Rewinding_Paper_Polyester1;
	private String productionInKg_Rewinding_Paper_Polyester2;
	private String stdWtPerHour_Rewinding_Paper_Polyester2;
	private double SlittingPaper_totalProdInMin;
	private double SlittingPolyester_totalProdInMin;
	private double Slitting_Paper_and_Polyester_totalProdInMin;
	private double Rewinding_Paper_and_Polyester_totalProdInMin;
	private double Rewinding_Paper_and_Polyester1_totalProdInMin;
	private double Rewinding_Paper_and_Polyester2_totalProdInMin;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
		date = request.getParameter("date");
		String storeDate = date.substring(8,10);
		storeDate = storeDate + date.substring(4,8);
		storeDate = storeDate + date.substring(2,4);
		reportNo = request.getParameter("report_no");
		workerName = request.getParameter("worker_name");
		workerName2 = request.getParameter("worker_name2");
		workerName3 = request.getParameter("worker_name3");
		workerName4 = request.getParameter("worker_name4");
		workingHours = request.getParameter("working_hour");
		workingShift = request.getParameter("working_shift");
		jobName = request.getParameter("job_name");
		noOfSizeChange1 = request.getParameter("no_of_sizeChange1");
		stdTimePerSize1 = request.getParameter("std_time_per_size1");
		noOfSizeChange2 = request.getParameter("no_of_sizeChange2");
		stdTimePerSize2 = request.getParameter("std_time_per_size2");
		
		//Slitting Paper
		noOfLotSlittingPaper = request.getParameter("no_of_lot_SlittingPaper");
		stdTimePerLotSlittingPaper = request.getParameter("std_time_per_lot_SlittingPaper");
		
		//Slitting Polyester
		noOfLotSlittingPolyester = request.getParameter("no_of_lot_SlittingPolyester");
		stdTimePerLotSlittingPolyester = request.getParameter("std_time_per_lot_SlittingPolyester");
		
		//Slitting Paper and Polyester
		noOfLotSlitting_Paper_Polyester = request.getParameter("no_of_lot_SlittingPaper_Polyester");
		stdTimePerLotSlitting_Paper_Polyester = request.getParameter("std_time_per_lot_SlittingPaper_Polyester");
		
		//Rewinding Paper and Polyester
		productionInKg_Rewinding_Paper_Polyester = request.getParameter("production_in_kg_RewindingPaper_Polyester");
		stdWtPerHour_Rewinding_Paper_Polyester = request.getParameter("std_wt_per_hour_RewindingPaper_Polyester");
		
		//Rewinding Paper and Polyester1
		productionInKg_Rewinding_Paper_Polyester1 = request.getParameter("production_in_kg_RewindingPaper_Polyester1");
		stdWtPerHour_Rewinding_Paper_Polyester1 = request.getParameter("std_wt_per_hour_RewindingPaper_Polyester1");
		
		//Rewinding Paper and Polyester2
		productionInKg_Rewinding_Paper_Polyester2 = request.getParameter("production_in_kg_RewindingPaper_Polyester2");
		stdWtPerHour_Rewinding_Paper_Polyester2 = request.getParameter("std_wt_per_hour_RewindingPaper_Polyester2");
		
		double working_Hours = Double.parseDouble(workingHours);
		double std_Time_per_Size1 = Double.parseDouble(stdTimePerSize1);
		double no_Of_Size_Change1 = Double.parseDouble(noOfSizeChange1);
		double std_Time_per_Size2 = Double.parseDouble(stdTimePerSize2);
		double no_Of_Size_Change2 = Double.parseDouble(noOfSizeChange2);
		
		//Slitting Paper
		double number_of_Lot_SlittingPaper = Double.parseDouble(noOfLotSlittingPaper);
		double std_Time_per_Lot_SlittingPaper = Double.parseDouble(stdTimePerLotSlittingPaper);
		
		//Slitting Polyester
		double number_of_Lot_SlittingPolyester = Double.parseDouble(noOfLotSlittingPolyester);
		double std_Time_per_Lot_SlittingPolyester = Double.parseDouble(stdTimePerLotSlittingPolyester);
		
		//Slitting Paper and Polyester
		double number_of_Lot_Slitting_Paper_Polyester = Double.parseDouble(noOfLotSlitting_Paper_Polyester);
		double std_Time_per_Lot_Slitting_Paper_Polyester = Double.parseDouble(stdTimePerLotSlitting_Paper_Polyester);
		
		//Rewinding Paper and Polyester
		double production_in_kg_Rewinding_Paper_Polyester = Double.parseDouble(productionInKg_Rewinding_Paper_Polyester);
		double std_wt_per_hour_Rewinding_Paper_Polyester = Double.parseDouble(stdWtPerHour_Rewinding_Paper_Polyester);
		
		//Rewinding Paper and Polyester1
		double production_in_kg_Rewinding_Paper_Polyester1 = Double.parseDouble(productionInKg_Rewinding_Paper_Polyester1);
		double std_wt_per_hour_Rewinding_Paper_Polyester1 = Double.parseDouble(stdWtPerHour_Rewinding_Paper_Polyester1);
				
		//Rewinding Paper and Polyester2
		double production_in_kg_Rewinding_Paper_Polyester2 = Double.parseDouble(productionInKg_Rewinding_Paper_Polyester2);
		double std_wt_per_hour_Rewinding_Paper_Polyester2 = Double.parseDouble(stdWtPerHour_Rewinding_Paper_Polyester2);
				
		IncentivesCalculation incentivesCalculation = new IncentivesCalculation();
		
		//Slitting Paper
		SlittingPaper_totalProdInMin = incentivesCalculation.calculate_SlittingPaper_Production(number_of_Lot_SlittingPaper,std_Time_per_Lot_SlittingPaper);
		
		//Slitting Polyester
		SlittingPolyester_totalProdInMin = incentivesCalculation.calculate_SlittingPolyester_Production(number_of_Lot_SlittingPolyester,std_Time_per_Lot_SlittingPolyester);
		
		//Slitting Paper and Polyester
		Slitting_Paper_and_Polyester_totalProdInMin = incentivesCalculation.calculate_Slitting_Paper_and_Polyester_Production(number_of_Lot_Slitting_Paper_Polyester,std_Time_per_Lot_Slitting_Paper_Polyester);
		
		//Rewinding Paper and Polyester
		Rewinding_Paper_and_Polyester_totalProdInMin = incentivesCalculation.calculate_Rewinding_Paper_and_Polyester_Production(production_in_kg_Rewinding_Paper_Polyester,std_wt_per_hour_Rewinding_Paper_Polyester);
		
		//Rewinding Paper and Polyester1
		Rewinding_Paper_and_Polyester1_totalProdInMin = incentivesCalculation.calculate_Rewinding_Paper_and_Polyester1_Production(production_in_kg_Rewinding_Paper_Polyester1,std_wt_per_hour_Rewinding_Paper_Polyester1);
				
		//Rewinding Paper and Polyester2
		Rewinding_Paper_and_Polyester2_totalProdInMin = incentivesCalculation.calculate_Rewinding_Paper_and_Polyester2_Production(production_in_kg_Rewinding_Paper_Polyester2,std_wt_per_hour_Rewinding_Paper_Polyester2);
		
		//Incentive A
		incentive_A = incentivesCalculation.calculateIncentive_A(SlittingPaper_totalProdInMin,SlittingPolyester_totalProdInMin,Slitting_Paper_and_Polyester_totalProdInMin,Rewinding_Paper_and_Polyester_totalProdInMin,Rewinding_Paper_and_Polyester1_totalProdInMin,Rewinding_Paper_and_Polyester2_totalProdInMin,no_Of_Size_Change1,std_Time_per_Size1,no_Of_Size_Change2,std_Time_per_Size2);
		
		//Incentive B
		incentive_B = incentivesCalculation.calculateIncentive_B(working_Hours);
		
		finalIncentive = incentivesCalculation.calculateFinalIncentive(incentive_A,incentive_B);		
		DecimalFormat df = new DecimalFormat("#.##");
		finalIncentive = Double.parseDouble(df.format(finalIncentive));
		//System.out.println("Final Incentive = "+finalIncentive);
		
		ArrayList<String> string_list = new ArrayList<String>();
		string_list.add(storeDate);
		string_list.add(reportNo);
		string_list.add(workerName);
		string_list.add(jobName);
		string_list.add(workingShift);
		string_list.add(noOfLotSlittingPaper);
		string_list.add(noOfLotSlittingPolyester);
		string_list.add(noOfLotSlitting_Paper_Polyester);
		string_list.add(productionInKg_Rewinding_Paper_Polyester);
		string_list.add(productionInKg_Rewinding_Paper_Polyester1);
		string_list.add(productionInKg_Rewinding_Paper_Polyester2);
		string_list.add(noOfSizeChange1);
		string_list.add(noOfSizeChange2);
		
		ArrayList<Double> double_list = new ArrayList<Double>();
		double_list.add(working_Hours);
		double_list.add(std_Time_per_Lot_SlittingPaper);
		double_list.add(std_Time_per_Lot_SlittingPolyester);
		double_list.add(std_Time_per_Lot_Slitting_Paper_Polyester);
		double_list.add(std_wt_per_hour_Rewinding_Paper_Polyester);
		double_list.add(std_wt_per_hour_Rewinding_Paper_Polyester1);
		double_list.add(std_wt_per_hour_Rewinding_Paper_Polyester2);
		double_list.add(std_Time_per_Size1);
		double_list.add(std_Time_per_Size2);
		double_list.add(SlittingPaper_totalProdInMin);
		double_list.add(SlittingPolyester_totalProdInMin);
		double_list.add(Slitting_Paper_and_Polyester_totalProdInMin);
		double_list.add(Rewinding_Paper_and_Polyester_totalProdInMin);
		double_list.add(Rewinding_Paper_and_Polyester1_totalProdInMin);
		double_list.add(Rewinding_Paper_and_Polyester2_totalProdInMin);
		double_list.add(finalIncentive);
		
		ArrayList<String> extra_names = new ArrayList<String>();
		if(workerName2.trim().length()>0)
		{
			extra_names.add(workerName2);
		}
		if(workerName3.trim().length()>0)
		{
			extra_names.add(workerName3);
		}
		if(workerName4.trim().length()>0)
		{
			extra_names.add(workerName4);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("String_ArrayList", string_list);
		session.setAttribute("Double_ArrayList", double_list);
		session.setAttribute("Extra_Workers", extra_names);
		response.sendRedirect("ReviewDetails.jsp");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}
}