<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Record</title>
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/showDataTable.css"/>
<script type="text/javascript" language="javascript"
	src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/vfs_fonts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var table = $('#example').DataTable();
	});
</script>
</head>
<%!
	private String FromDate=null;
	private String ToDate=null;
%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache" );
response.setHeader("Expires", "0");

	int flag = 0;
	int rowno = 1;
	int  i=0;
	ArrayList<String> DB_ResultArrayList = (ArrayList) request.getAttribute("DB_Result_ArrayList");
	FromDate = (String)request.getAttribute("fromDateValue");
	ToDate = (String)request.getAttribute("toDateValue");
%>
<body>
	<a href="FillDetails.jsp"><button class="home">Go to Home</button></a>
	<h1 align="center">Delete Record</h1><br>
	<form action="ShowDataForDelete" method="post">
		<table border="0" cellspacing="5" cellpadding="5" align="center">
    		<tbody>
    			<tr>
        			<td>From:</td>
        			<td><input type="date" id="datepicker" name="fromDate" required value="<%=FromDate==null?"":FromDate %>"></td>
    		
        			<td>To:</td>
        			<td><input type="date" id="datepicker" name="toDate" required value="<%=ToDate==null?"":ToDate %>"></td>
        			
        			<td><input type="submit" value="Search"></td>
        			<td><input type="reset" value="Clear" onclick="window.location = '/ProjectIncentive/ShowDataForDelete?clear=1' ">
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
				<th style="background: #efb0a0;">Incentive</th>
				<th style="background: #e83a3a;">Delete</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				if( DB_ResultArrayList.size()!=0)
				{					
					for (i = 0; i < DB_ResultArrayList.size(); i++) 
					{
						if (flag == 4) 
						{
							out.print("<td><a href='DelteRecord?reportno="+DB_ResultArrayList.get(i-3)+"&name="+DB_ResultArrayList.get(i-2)+"'><button>Delete</button></a></td>");
							out.print("</tr>");
							if (i != DB_ResultArrayList.size()-1) 
							{
								out.print("<tr>");
								out.print("<td>" + DB_ResultArrayList.get(i) + "</td>");
							}
							flag = 1;
							rowno++;
						}
						else 
						{
							out.print("<td>" + DB_ResultArrayList.get(i) + "</td>");
							flag++;
						}
					}
					out.print("<td><a href='DelteRecord?reportno="+DB_ResultArrayList.get(i-3)+"&name="+DB_ResultArrayList.get(i-2)+"'><button>Delete</button></a></td>");
				}
				%>
			</tr>
		</tbody>
	</table>
	<br><br><br>
	<a href="ClearDB.jsp"><button class="home" style="margin-bottom: 30px">Clear All Data</button></a>
	<a href="ShowDB"><button class="home">Show Report</button></a><br><br>
	<footer>
		Incentive calculation : made by vijul shah - @2019<br>
		contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
		email : kvkshah19@gmail.com
	</footer>
</body>
</html>