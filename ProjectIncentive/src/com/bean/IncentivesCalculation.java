package com.bean;

public class IncentivesCalculation {

	//Slitting Paper
	public double calculate_SlittingPaper_Production(double number_of_Lot_SlittingPaper, double std_Time_per_Lot_SlittingPaper) 
	{
		return number_of_Lot_SlittingPaper*std_Time_per_Lot_SlittingPaper;	
	}

	//Slitting Polyester
	public double calculate_SlittingPolyester_Production(double number_of_Lot_SlittingPolyester,double std_Time_per_Lot_SlittingPolyester) 
	{
		return number_of_Lot_SlittingPolyester*std_Time_per_Lot_SlittingPolyester;
	}

	//Slitting Paper and Polyester
	public double calculate_Slitting_Paper_and_Polyester_Production(double number_of_Lot_Slitting_Paper_Polyester,double std_Time_per_Lot_Slitting_Paper_Polyester) 
	{

		return number_of_Lot_Slitting_Paper_Polyester*std_Time_per_Lot_Slitting_Paper_Polyester;
	}
	
	//Rewinding Paper and Polyester
	public double calculate_Rewinding_Paper_and_Polyester_Production(double production_in_kg_Rewinding_Paper_Polyester, double std_wt_per_hour_Rewinding_Paper_Polyester) 
	{
		if(std_wt_per_hour_Rewinding_Paper_Polyester!=0)
		{
			return (production_in_kg_Rewinding_Paper_Polyester/std_wt_per_hour_Rewinding_Paper_Polyester)*60;
		}
		else
		{
			return 0;
		}
	}

	//Rewinding Paper and Polyester1
	public double calculate_Rewinding_Paper_and_Polyester1_Production(double production_in_kg_Rewinding_Paper_Polyester1,double std_wt_per_hour_Rewinding_Paper_Polyester1) 
	{
		if(std_wt_per_hour_Rewinding_Paper_Polyester1!=0)
		{
			return (production_in_kg_Rewinding_Paper_Polyester1/std_wt_per_hour_Rewinding_Paper_Polyester1)*60;
		}
		else
		{
			return 0;
		}
	}

	//Rewinding Paper and Polyester2
	public double calculate_Rewinding_Paper_and_Polyester2_Production(double production_in_kg_Rewinding_Paper_Polyester2, double std_wt_per_hour_Rewinding_Paper_Polyester2) 
	{
		if(std_wt_per_hour_Rewinding_Paper_Polyester2!=0)
		{
			return (production_in_kg_Rewinding_Paper_Polyester2/std_wt_per_hour_Rewinding_Paper_Polyester2)*60;
		}
		else
		{
			return 0;
		}
	}
	
	public double calculateIncentive_A(double slittingPaper_totalProdInMin, double slittingPolyester_totalProdInMin, double slitting_Paper_and_Polyester_totalProdInMin, double rewinding_Paper_and_Polyester_totalProdInMin, double rewinding_Paper_and_Polyester1_totalProdInMin, double rewinding_Paper_and_Polyester2_totalProdInMin, double no_Of_Size_Change1, double std_Time_per_Size1, double no_Of_Size_Change2, double std_Time_per_Size2)
	{
		return (slittingPaper_totalProdInMin+slittingPolyester_totalProdInMin+slitting_Paper_and_Polyester_totalProdInMin+rewinding_Paper_and_Polyester_totalProdInMin+rewinding_Paper_and_Polyester1_totalProdInMin+rewinding_Paper_and_Polyester2_totalProdInMin)+(no_Of_Size_Change1*std_Time_per_Size1)+(no_Of_Size_Change2*std_Time_per_Size2);
	}

	public double calculateIncentive_B(double working_Hours) {
	
		return (working_Hours*60);
	}

	public double calculateFinalIncentive(double incentive_A, double incentive_B)
	{
		return (incentive_A-incentive_B)/60;
	}
	
}
