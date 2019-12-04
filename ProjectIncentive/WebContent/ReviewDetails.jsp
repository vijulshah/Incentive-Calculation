<%@page import="java.util.ArrayList"%>
<%@ page errorPage="ErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Details</title>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<link rel="stylesheet" type="text/css" href="css/reviewDetails.css"/>
<script type="text/javascript" language="javascript" src="js/noBack.js"></script>
</head>
<%
	if(session.getAttribute("String_ArrayList")==null||session.getAttribute("Double_ArrayList")==null)
	{
		response.sendRedirect("FillDetails.jsp");
	}
%>
<%
	ArrayList<String> string_list = new ArrayList<String>();
	string_list = (ArrayList)session.getAttribute("String_ArrayList");
	
	ArrayList<Double> double_list = new ArrayList<Double>();
	double_list = (ArrayList)session.getAttribute("Double_ArrayList");
	
	ArrayList<String> extra_names = new ArrayList<String>();
	extra_names = (ArrayList)session.getAttribute("Extra_Workers");
%>
<body>
<fieldset>
	<legend><h1>Confirm Details</h1><br></legend>
	<table border="1" cellspacing="0px" cellpadding="15px" class="display nowrap">
		<tr>
			<th style="background: #e4f4ad;">Date</th>
			<th style="background: #e4f4ad;">Report No</th>
			<th style="background: #f2dcab;">Employee Name</th>
			<th style="background: #efb0a0;">Job Name</th>
			<th style="background: #f2dcab;">Working Hours</th>
			<th style="background: #f2dcab;">Working Shift</th>
			<th style="background: #FFFF99;">Slitting Paper Job</th>
			<th style="background: #FFCC00;">Slitting Polyester Job</th>
			<th style="background: #00FFFF;">Slitting Paper <br>&<br> Polyester Job</th>
			<th style="background: #8fb0f7;">Rewinding Paper <br>&<br> Polyester Job </th>
			<th style="background: #dc93f9;">Rewinding Paper <br>&<br> Polyester Job 1</th>
			<th style="background: #f7a5bf;">Rewinding Paper <br>&<br> Polyester Job 2</th>
			<th style="background: #FFFF99;">STD Time</th>
			<th style="background: #FFCC00;">STD Time</th>
			<th style="background: #00FFFF;">STD Time</th>
			<th style="background: #8fb0f7;">STD Time</th>
			<th style="background: #dc93f9;">STD Time</th>
			<th style="background: #f7a5bf;">STD Time</th>
			<th style="background: #CCFFCC;">Size Change 1</th>
			<th style="background: #CCFFCC;">Standard Time/Size 1</th>
			<th style="background: #a0f7a0;">Size Change 2</th>
			<th style="background: #a0f7a0;">Standard Time/Size 2</th>
			<th style="background: #FFFF99;">Total Production 1</th>
			<th style="background: #FFCC00;">Total Production 2</th>
			<th style="background: #00FFFF;">Total Production 3</th>
			<th style="background: #8fb0f7;">Total Production 4</th>
			<th style="background: #dc93f9;">Total Production 5</th>
			<th style="background: #f7a5bf;">Total Production 6</th>
			<th style="background: #e83a3a;">Final Incentive</th>
		</tr>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th style="background: #FFFF99;">No of Lot</th>
			<th style="background: #FFCC00;">No of Lot</th>
			<th style="background: #00FFFF;">No of Lot</th>
			<th style="background: #8fb0f7;">Production in KG</th>
			<th style="background: #dc93f9;">Production in KG</th>
			<th style="background: #f7a5bf;">Production in KG</th>
			<th style="background: #FFFF99;">Slitting Paper</th>
			<th style="background: #FFCC00;">Slitting Polyester</th>
			<th style="background: #00FFFF;">Slitting Paper & Polyester</th>
			<th style="background: #8fb0f7;">Rewinding Paper & Polyester</th>
			<th style="background: #dc93f9;">Rewinding Paper & Polyester 1</th>
			<th style="background: #f7a5bf;">Rewinding Paper & Polyester 2</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th style="background: #FFFF99;">Slitting Paper</th>
			<th style="background: #FFCC00;">Slitting Polyester</th>
			<th style="background: #00FFFF;">Slitting Paper & Polyester</th>
			<th style="background: #8fb0f7;">Rewinding Paper & Polyester</th>
			<th style="background: #dc93f9;">Rewinding Paper & Polyester 1</th>
			<th style="background: #f7a5bf;">Rewinding Paper & Polyester 2</th>
			<th></th>
		</tr>
		<tr>
			<td><% out.print(string_list.get(0)); %></td>
			<td><% out.print(string_list.get(1)); %></td>
			<td><% 
					out.print(string_list.get(2)); 
					for(int i=0;i<extra_names.size();i++)
					{
						if(i!=extra_names.size())
							out.print(" , ");
						out.print(extra_names.get(i));
					}
				%>
			</td>
			<td><% out.print(string_list.get(3)); %></td>
			<td><% out.print(double_list.get(0)); %></td>
			<td><% out.print(string_list.get(4)); %></td>
			<td><% out.print(string_list.get(5)); %></td>
			<td><% out.print(string_list.get(6)); %></td>
			<td><% out.print(string_list.get(7)); %></td>
			<td><% out.print(string_list.get(8)); %></td>
			<td><% out.print(string_list.get(9)); %></td>
			<td><% out.print(string_list.get(10)); %></td>
			<td><% out.print(double_list.get(1)); %></td>
			<td><% out.print(double_list.get(2)); %></td>
			<td><% out.print(double_list.get(3)); %></td>
			<td><% out.print(double_list.get(4)); %></td>
			<td><% out.print(double_list.get(5)); %></td>
			<td><% out.print(double_list.get(6)); %></td>
			<td><% out.print(string_list.get(11)); %></td>
			<td><% out.print(double_list.get(7)); %></td>
			<td><% out.print(string_list.get(12)); %></td>
			<td><% out.print(double_list.get(8)); %></td>
			<td><% out.print(double_list.get(9)); %></td>
			<td><% out.print(double_list.get(10)); %></td>
			<td><% out.print(double_list.get(11)); %></td>
			<td><% out.print(double_list.get(12)); %></td>
			<td><% out.print(double_list.get(13)); %></td>
			<td><% out.print(double_list.get(14)); %></td>
			<td><% out.print(double_list.get(15)); %></td>
		</tr>
	</table>
	<br><br>
	<p align="left">
		<a href="EnterRecordToDB"><button type="button">Save</button></a>
			<span style="margin: 10px"></span>
		<a href="FillDetails.jsp"><button type="button">Cancel</button></a>
	</p>
</fieldset>
</body>
<footer>
	Incentive calculation : made by vijul shah - @2019<br>
	contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
	email : kvkshah19@gmail.com
</footer>
</html>