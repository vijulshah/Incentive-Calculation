<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.dao.Oracle_Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<script type="text/javascript" language="javascript" src="js/noBack.js"></script>
<title>Incentive Calculation</title>
<%!
	private Connection con = null;
	private Statement stmt1 = null;
	private Statement stmt2 = null;
	private Statement stmt3 = null;
	private Statement stmt4 = null;
	private Statement stmt5 = null;
	private Statement stmt6 = null;
	private Statement stmt7 = null;
	private Statement stmt8 = null;
	private ResultSet rs1 = null;
	private ResultSet rs2 = null;
	private ResultSet rs3 = null;
	private ResultSet rs4 = null;
	private ResultSet rs5 = null;
	private ResultSet rs6 = null;
	private ResultSet rs7 = null;
	private ResultSet rs8 = null;
	private String actionResult = null;
	private String actionResultDB = null;
 %>
<%	
	actionResult = (String)request.getAttribute("action_result");
	actionResultDB = (String)request.getParameter("action_result");
	try 
	{
		con = Oracle_Connection.getConnection();
		stmt1 = con.createStatement();
		stmt2 = con.createStatement();
		stmt3 = con.createStatement();
		stmt4 = con.createStatement();
		stmt5 = con.createStatement();
		stmt6 = con.createStatement();
		stmt7 = con.createStatement();
		stmt8 = con.createStatement();
		
		String findQuery1 = "select * from DEFINED_STD_TIME_PER_LOT";
		stmt1.executeQuery(findQuery1);
		rs1 = stmt1.getResultSet();
		
		String findQuery2 = "select * from DEFINED_STD_TIME_PER_LOT";
		stmt2.executeQuery(findQuery2);
		rs2 = stmt2.getResultSet();
		
		String findQuery3 = "select * from DEFINED_STD_TIME_PER_LOT";
		stmt3.executeQuery(findQuery3);
		rs3 = stmt3.getResultSet();
		
		String findQuery4 = "select * from DEFINED_STD_WT_PER_HOUR";
		stmt4.executeQuery(findQuery4);
		rs4 = stmt4.getResultSet();
		
		String findQuery5 = "select * from DEFINED_STD_WT_PER_HOUR";
		stmt5.executeQuery(findQuery5);
		rs5 = stmt5.getResultSet();
		
		String findQuery6 = "select * from DEFINED_STD_WT_PER_HOUR";
		stmt6.executeQuery(findQuery6);
		rs6 = stmt6.getResultSet();
		
		String findQuery7 = "select * from DEFINED_STD_TIME_PER_SIZE";
		stmt7.executeQuery(findQuery7);
		rs7 = stmt7.getResultSet();
		
		String findQuery8 = "select * from DEFINED_STD_TIME_PER_SIZE";
		stmt8.executeQuery(findQuery8);
		rs8 = stmt8.getResultSet(); 
		
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
	}
%>
</head>
<body>

<fieldset style="background-color: white;">	
	<legend style="font-family: sans-serif;"><h2><u>Incentive Calculation</u></h2></legend>

	<form action="IncentiveDetails" method="post" class="ToLeft">
		<table cellspacing="5px" cellpadding="10px" >
			<tr>
				<td style="background: #e4f4ad;">
					<label>Date : </label>
					<input type="date" name="date" required>
				</td>
				<td style="background: #e4f4ad;">
					<label>Report No : </label>
					<input type="text" name="report_no" required autocomplete="off">
				</td>
			</tr>
		</table>
		<br>

		<table cellspacing="5px" cellpadding="10px">
			<tr>
				<td style="background: #f2dcab">
					<label>Worker Name : </label>
					<input type="text" name="worker_name" required>
				</td>
				<td style="background: #f2dcab">
					<input type="text" name="worker_name2">
				</td>
				<td style="background: #f2dcab">
					<input type="text" name="worker_name3">
				</td>
				<td style="background: #f2dcab">
					<input type="text" name="worker_name4">
				</td>
				<td style="background: #f2dcab;">
					<label>Working Shift : </label>
					<select name="working_shift">
						<option>day</option>
						<option>night</option>
					</select>
				</td>
				<td style="background: #fff;">
					<!-- <label>Working Hours : </label> -->
					<input type="hidden" name="working_hour" value="12" autocomplete="off" required>
				</td>
			</tr>
		</table>		 
		<br>
		
		<table cellspacing="5px" cellpadding="10px">
			<tr>
				<td style="background: #efb0a0;">
					<label>Job Name OR Job Details : </label><br>
					<textarea name="job_name" rows="2" cols="1" autocomplete="off" style="padding-left: 10px;padding-top: 5px;width: 500px"></textarea>
				</td>
			</tr>
		</table>
		<br>
		
		<table cellspacing="1px" cellpadding="8px" >
			<tr>
				<th style="background: #FFFF99;"><h3>Slitting<br>Paper</h3></th>
				<th style="background: #FFCC00;"><h3>Slitting<br>Polyester</h3></th>
				<th style="background: #00FFFF;"><h3>Slitting<br>Paper<br>&<br>Polyester</h3></th>
				<th style="background: #8fb0f7;"><h3>Rewinding<br>Paper<br>&<br>Polyester</h3></th>
				<th style="background: #dc93f9;"><h3>Rewinding<br>Paper<br>&<br>Polyester 1</h3></th>
				<th style="background: #f7a5bf;"><h3>Rewinding<br>Paper<br>&<br>Polyester 2</h3></th>

				<th style="background: #CCFFCC;"><h3>Size Change 1 <br>&<br> Standard <br>Time/Size 1</h3></th>
				<th style="background: #a0f7a0;"><h3>Size Change 2 <br>&<br> Standard <br>Time/Size 2</h3></th>
			</tr>
			<tr>
				<td style="background: #FFFF99;">
					<label>No of Lot : </label><br>
					<input type="text" name="no_of_lot_SlittingPaper" autocomplete="off" required value="0" >			
				</td>
				<td style="background: #FFCC00;">
					<label>No of Lot : </label><br>
					<input type="text" name="no_of_lot_SlittingPolyester"  autocomplete="off" required value="0" >
				</td>
				<td style="background: #00FFFF;">
					<label>No of Lot : </label><br>
					<input type="text" name="no_of_lot_SlittingPaper_Polyester"  autocomplete="off" required value="0" >
				</td>
				<td style="background: #8fb0f7;">
					<label>Total Prod in Kg : </label><br>
					<input type="text" name="production_in_kg_RewindingPaper_Polyester" autocomplete="off" required value="0" >
				</td>
				<td style="background: #dc93f9;">
					<label>Total Prod in Kg : </label><br>
					<input type="text" name="production_in_kg_RewindingPaper_Polyester1"  autocomplete="off" required value="0" >
				</td>
				<td style="background: #f7a5bf;">
					<label>Total Prod in Kg : </label><br>
					<input type="text" name="production_in_kg_RewindingPaper_Polyester2" autocomplete="off" required value="0" >
				</td>
				
				<td style="background: #CCFFCC;">
					<label>No of Size Change:</label><br>
					<input type="text" name="no_of_sizeChange1" autocomplete="off" required value="0" >					
				</td>
				<td style="background: #a0f7a0;">
					<label>No of Size Change:</label><br>
					<input type="text" name="no_of_sizeChange2" autocomplete="off" required value="0" >
				</td>
			</tr>
			<tr>
				<td style="background: #FFFF99;">
					<label>Std Time / Lot : </label><br>
					<select name="std_time_per_lot_SlittingPaper">
						<%
							if(rs1!=null)
							while(rs1.next())
							{
								out.print("<option>"+rs1.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #FFCC00;">
					<label>Std Time / Lot : </label><br>
					<select name="std_time_per_lot_SlittingPolyester">
						<%
							if(rs2!=null)
							while(rs2.next())
							{
								out.print("<option>"+rs2.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #00FFFF;">
					<label>Std Time / Lot : </label><br>
					<select name="std_time_per_lot_SlittingPaper_Polyester">
						<%
							if(rs3!=null)
							while(rs3.next())
							{
								out.print("<option>"+rs3.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #8fb0f7;">
					<label>Std Wt / Hour : </label><br>
					<select name="std_wt_per_hour_RewindingPaper_Polyester">
						<%
							if(rs4!=null)
							while(rs4.next())
							{
								out.print("<option>"+rs4.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #dc93f9;">
					<label>Std Wt / Hour : </label><br>
					<select name="std_wt_per_hour_RewindingPaper_Polyester1">
						<%
							if(rs5!=null)
							while(rs5.next())
							{
								out.print("<option>"+rs5.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #f7a5bf;">
					<label>Std Wt / Hour : </label><br>
					<select name="std_wt_per_hour_RewindingPaper_Polyester2">
						<%
							if(rs6!=null)
							while(rs6.next())
							{
								out.print("<option>"+rs6.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>
				</td>
				<td style="background: #CCFFCC;">
					<label>Std Time / Size : </label><br>
					<select name="std_time_per_size1">
						<%
							if(rs7!=null)
							while(rs7.next())
							{
								out.print("<option>"+rs7.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>
					</select>				
				</td>
				<td style="background: #a0f7a0;">
					<label>Std Time / Size : </label><br>
					<select name="std_time_per_size2">
						<%
							if(rs8!=null)
							while(rs8.next())
							{
								out.print("<option>"+rs8.getString(1)+"</option>");
							}
						out.print("<option selected>"+0+"</option>");
						%>	
					</select>
				</td>
			</tr>
		</table>
		<br>
	
		<p align="center">
			<input type="submit" value="Next">
				<span style="margin: 15px"></span>
			<input type="reset" value="Reset">
		</p> 
	</form>
</fieldset>
	
<div align="center">
	<br><br>
	<button id="myBtn1">Add new <br>Std Time / Lot</button><br><br>
	<button id="myBtn2">Add new <br>Std Wt / Hr</button><br><br>
	<button id="myBtn3">Add new <br>Std Time / Size</button><br><br>
	<a href="ShowStdValues"><button>Delete <br>Std Time or Wt</button></a><br><br>
	<a href="ShowDataForDelete"><button>Delete <br>Record</button></a><br><br>
	<a href="ShowDB"><button>Show Report</button><br></a>
	<h3 style="background: yellow;text-align: center;float: inherit;">STATUS : </h3>
	<span style="font-size: 18px"><%=actionResultDB==null?"":actionResultDB%></span>
	<span style="font-size: 18px"><%=actionResult==null?"":actionResult%></span>
</div>

<div id="myModal1" class="modal">
  <div class="modal-content">
    <span id="close1" class="close">&times;</span>
    <h3>Add New Std Time / Lot</h3>
    <form action="Enter_StdTimePerLot" method="post">
    	<input type="text" name="std_value" required autocomplete="off" style="width: 150px;height: 40px;border-width: 2px;font-size: 20px;padding-left: 10px;"><br><br>
    	<input type="submit" value="Save">
    	<input type="button" value="Cancel" onclick="window.location = 'http://192.168.1.24:8080/ProjectIncentive/FillDetails.jsp'">
    </form>
  </div>
</div>

<div id="myModal2" class="modal">
  <div class="modal-content">
    <span id="close2" class="close">&times;</span>
    <h3>Add New Std Wt / Hr</h3>
    <form action="Enter_StdWtPerHour" method="post">
    	<input type="text" name="std_value" required autocomplete="off" style="width: 150px;height: 40px;border-width: 2px;font-size: 20px;padding-left: 10px"><br><br>
    	<input type="submit" value="Save">
    	<input type="button" value="Cancel" onclick="window.location = 'http://192.168.1.24:8080/ProjectIncentive/FillDetails.jsp'">
    </form>
  </div>
</div>

<div id="myModal3" class="modal">
  <div class="modal-content">
    <span id="close3" class="close">&times;</span>
    <h3>Add New Std Time / Size</h3>
    <form action="Enter_StdTimePerSize" method="post">
    	<input type="text" name="std_value" required autocomplete="off" style="width: 150px;height: 40px;border-width: 2px;font-size: 20px;padding-left: 10px"><br><br>
    	<input type="submit" value="Save">
    	<input type="button" value="Cancel" onclick="window.location = 'http://192.168.1.24:8080/ProjectIncentive/FillDetails.jsp' ">
    </form>
  </div>
</div>


<script type="text/javascript" language="javascript" src="js/main.js"></script>
	
	<%
	rs1.close();
	stmt1.close();
	
	rs2.close();
	stmt2.close();
	
	rs3.close();
	stmt3.close();
	
	rs4.close();
	stmt4.close();
	
	rs5.close();
	stmt5.close();
	
	rs6.close();
	stmt6.close();
	
	rs7.close();
	stmt7.close();
	
	rs8.close();
	stmt8.close();
	
	con.close();
	
	%>
	
<footer>
	Incentive calculation : made by vijul shah - @2019<br>
	contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
	email : kvkshah19@gmail.com
</footer>
</body>
</html>