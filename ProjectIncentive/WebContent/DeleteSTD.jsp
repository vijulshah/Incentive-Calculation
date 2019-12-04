<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Std Time-Wt-Size</title>
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<link rel="stylesheet" type="text/css" href="css/showDataTable.css"/>
<script type="text/javascript" language="javascript" src="js/noBack.js"></script>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache" );
response.setHeader("Expires", "0");

	ArrayList<String> DB_ResultArrayList1 = (ArrayList) request.getAttribute("DB_Result_ArrayList1");
	ArrayList<String> DB_ResultArrayList2 = (ArrayList) request.getAttribute("DB_Result_ArrayList2");
	ArrayList<String> DB_ResultArrayList3 = (ArrayList) request.getAttribute("DB_Result_ArrayList3");
%>
<body>
	<a href="FillDetails.jsp"><button class="home">Go to Home</button></a>
	<h1 align="center">Delete Std Values</h1><br><br>
	
	<div style="float: left;width: 33%">
	<h2 align="center">Delete Std Time / Lot</h2>
	<table id="example1" class="display nowrap" border="1" cellpadding="5"
		cellspacing="0" align="center">
		<thead>
			<tr>
				<th style="background: #e4f4ad;">Std Time / Lot</th>
				<th style="background: #e83a3a;">Delete</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<%
				if( DB_ResultArrayList1.size()!=0)
				{					
					for (int i = 0; i < DB_ResultArrayList1.size(); i++) 
					{
						if (i == DB_ResultArrayList1.size()-1) 
						{
							out.print("<tr>");
							out.print("<td width='120px'>" + DB_ResultArrayList1.get(i) + "</td>");
							out.print("<td width='120px'><a href='DeleteStdTimePerLot?stdTimeperLot="+DB_ResultArrayList1.get(i)+"'><button>Delete</button></a></td>");
						}
						else
						{
							out.print("<td width='120px'>" + DB_ResultArrayList1.get(i) + "</td>");
							out.print("<td width='120px'><a href='DeleteStdTimePerLot?stdTimeperLot="+DB_ResultArrayList1.get(i)+"'><button>Delete</button></a></td>");
							out.print("</tr><tr>");		
						}
					}
				}
			%>
			</tr>
		</tbody>
	</table>
	</div>
	
	<div style="float: left;width: 33%">
	<h2 align="center">Delete Std Weight / Hour</h2>
	<table id="example2" class="display nowrap" border="1" cellpadding="5"
		cellspacing="0" align="center">
		<thead>
			<tr>
				<th style="background: #e4f4ad;">Std Wt / Hour</th>
				<th style="background: #e83a3a;">Delete</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<%
				if( DB_ResultArrayList2.size()!=0)
				{					
					for (int i = 0; i < DB_ResultArrayList2.size(); i++) 
					{
						if (i == DB_ResultArrayList2.size()-1) 
						{
							out.print("<tr>");
							out.print("<td width='120px'>" + DB_ResultArrayList2.get(i) + "</td>");
							out.print("<td width='120px'><a href='DeleteStdWtPerHour?stdWtperHr="+DB_ResultArrayList2.get(i)+"'><button>Delete</button></a></td>");
						}
						else
						{
							out.print("<td width='120px'>" + DB_ResultArrayList2.get(i) + "</td>");
							out.print("<td width='120px'><a href='DeleteStdWtPerHour?stdWtperHr="+DB_ResultArrayList2.get(i)+"'><button>Delete</button></a></td>");
							out.print("</tr><tr>");		
						}
					}
				}
			%>
			</tr>
		</tbody>
	</table>
	</div>
	
	<div style="float: Left;width: 33%">
	<h2 align="center">Delete Std Time / Size</h2>
	<table id="example3" class="display nowrap" border="1" cellpadding="5"
		cellspacing="0" style="margin-bottom: 100px" align="center">
		<thead>
			<tr>
				<th style="background: #e4f4ad;">Std Time / Size</th>
				<th style="background: #e83a3a;">Delete</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<%
				if( DB_ResultArrayList3.size()!=0)
				{					
					for (int i = 0; i < DB_ResultArrayList3.size(); i++) 
					{
						if (i == DB_ResultArrayList3.size()-1) 
						{
							out.print("<tr>");
							out.print("<td>" + DB_ResultArrayList3.get(i) + "</td>");
							out.print("<td><a href='DeleteStdTimePerSize?stdTimeperSize="+DB_ResultArrayList3.get(i)+"'><button>Delete</button></a></td>");
						}
						else
						{
							out.print("<td>" + DB_ResultArrayList3.get(i) + "</td>");
							out.print("<td><a href='DeleteStdTimePerSize?stdTimeperSize="+DB_ResultArrayList3.get(i)+"'><button>Delete</button></a></td>");
							out.print("</tr><tr>");		
						}
					}
				}
			%>
			</tr>
		</tbody>
	</table>
	</div>
	<footer>
		Incentive calculation : made by vijul shah - @2019<br>
		contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
		email : kvkshah19@gmail.com
	</footer>
</body>
</html>