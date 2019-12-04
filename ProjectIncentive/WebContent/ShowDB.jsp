<%@page import="java.util.ArrayList"%>
<%@ page errorPage="ErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/showDataTable.css"/>
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css"/>
<script type="text/javascript" language="javascript" src="js/noBack.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="js/buttons.flash.min.js"></script>
<script type="text/javascript" language="javascript" src="js/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="js/pdfmake.min.js"></script>
<script type="text/javascript" language="javascript" src="js/vfs_fonts.js"></script>
<script type="text/javascript" language="javascript" src="js/buttons.html5.min.js"></script>
<script type="text/javascript" language="javascript" src="js/buttons.print.min.js"></script>
<script type="text/javascript" language="javascript" src="js/showDataTable.js"></script>
<title>Incentive Report</title>
</head>
<%!
	private String FromDate=null;
	private String ToDate=null;
%>
<%
	int flag = 0;
	ArrayList<String> DB_ResultArrayList = (ArrayList) request.getAttribute("DB_Result_ArrayList");
	FromDate = (String)request.getAttribute("fromDateValue");
	ToDate = (String)request.getAttribute("toDateValue");
%>
<body>
	<a href="FillDetails.jsp"><button class="home">Go to Home</button></a>
	<h1 align="center">Report</h1><br>
	<form action="ShowDB" method="post">
		<table border="0" cellspacing="5" cellpadding="5" align="center">
    		<tbody>
    			<tr>
        			<td>From:</td>
        			<td><input type="date" id="datepicker" name="fromDate" required value="<%=FromDate==null?"":FromDate %>"></td>
    		
        			<td>To:</td>
        			<td><input type="date" id="datepicker" name="toDate" required value="<%=ToDate==null?"":ToDate %>"></td>
        			
        			<td><input type="submit" value="Search"></td>
        			<td><input type="reset" value="Clear" onclick="window.location = '/ProjectIncentive/ShowDB?clear=1' ">
    			</tr>
			</tbody>
		</table>
	</form>
	<table id="example" class="display nowrap" border="1" cellpadding="5"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th style="background: #e4f4ad;">Date</th>
				<th style="background: #e4f4ad;">Report No</th>
				<th style="background: #f2dcab;">Employee Name</th>
				<th style="background: #efb0a0;">Job Name</th>
				<th style="background: #f2dcab;">Working Hours</th>
				<th style="background: #f2dcab;">Working Shift</th>
				<th style="background: #FFFF99;">Paper Job <br> | <br>No of Lot</th>
				<th style="background: #FFCC00;">Polyester Job <br> | <br>No of Lot</th>
				<th style="background: #00FFFF;">Paper <br>&<br>
					Polyester Job <br> | <br>No of Lot
				</th>
				<th style="background: #8fb0f7;">Rewinding Job <br> | <br>Prod in KG
				</th>
				<th style="background: #dc93f9;">Rewinding Job 1 <br> | <br>Prod in KG
				</th>
				<th style="background: #f7a5bf;">Rewinding Job 2 <br> | <br>Prod in KG
				</th>
				<th style="background: #FFFF99;">STD Time <br> | <br>Paper</th>
				<th style="background: #FFCC00;">STD Time <br> | <br>Polyester</th>
				<th style="background: #00FFFF;">STD Time <br> | <br>Paper <br>&<br> Polyester</th>
				<th style="background: #8fb0f7;">STD Time <br> | <br>Rewinding </th>
				<th style="background: #dc93f9;">STD Time <br> | <br>Rewinding 1</th>
				<th style="background: #f7a5bf;">STD Time <br> | <br>Rewinding 2</th>
				<th style="background: #CCFFCC;">Size Change 1</th>
				<th style="background: #CCFFCC;">STD Time/Size 1</th>
				<th style="background: #a0f7a0;">Size Change 2</th>
				<th style="background: #a0f7a0;">STD Time/Size 2</th>
				<th style="background: #FFFF99;">Total Prod 1 <br> | <br>Paper</th>
				<th style="background: #FFCC00;">Total Prod 2 <br> | <br>Polyester</th>
				<th style="background: #00FFFF;">Total Prod 3 <br> | <br>Paper <br>&<br> Polyester</th>
				<th style="background: #8fb0f7;">Total Prod 4 <br> | <br>Rewinding </th>
				<th style="background: #dc93f9;">Total Prod 5 <br> | <br>Rewinding 1</th>
				<th style="background: #f7a5bf;">Total Prod 6 <br> | <br>Rewinding 2</th>
				<th style="background: #e83a3a;">Incentive</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
					for (int i = 0; i < DB_ResultArrayList.size(); i++) 
					{
						if (flag == 28) 
						{
							out.print("<td>" + DB_ResultArrayList.get(i) + "</td>");
							out.print("</tr>");
							if (i != DB_ResultArrayList.size() - 1) 
							{
								out.print("<tr>");
							}
							flag = 0;
						}
						else 
						{
							out.print("<td>" + DB_ResultArrayList.get(i) + "</td>");
							flag++;
						}
					}
				%>
			
		</tbody>
	</table>
	<br>
	<a href="ClearDB.jsp"><button class="home" style="margin-bottom: 50px">Clear All Data</button></a>
	<a href="ShowDataForDelete"><button class="home" style="margin-bottom: 50px">Delete Record</button></a>
	<footer>
		Incentive calculation : made by vijul shah - @2019<br>
		contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
		email : kvkshah19@gmail.com
	</footer>
</body>
</html>