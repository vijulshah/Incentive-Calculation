<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/Allfooters.css"/>
<script type="text/javascript" language="javascript" src="js/noBack.js"></script>
<title>Clear All Records</title>
<style type="text/css">
#Div2 {
	  display: none;
	}
</style>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache" );
response.setHeader("Expires", "0");
String user_pswd_error = (String)request.getAttribute("user_pswd_error");
%>
<script>
function switchVisible() {

    if (document.getElementById('Div1')) {

        if (document.getElementById('Div1').style.display == 'none')
        {
            document.getElementById('Div1').style.display = 'block';
            document.getElementById('Div2').style.display = 'none';
        }
        else 
        {
            document.getElementById('Div1').style.display = 'none';
            document.getElementById('Div2').style.display = 'block';
        }
    }
}
</script>
<body>
<h2 style="font-size: 20px;font-family: cursive;">
	<img src="Images/lock.png" align="middle">Enter password to clear data
</h2>
<fieldset style="padding: 20px;width: 50%;float:none;">
<button id="button1" onclick="switchVisible()" style="float: right;">Hide Date</button>
	<div id="Div1">
		<form action="ClearDB" method="post">
			<table style="font-size: 20px">
				<tr>
        			<td>From:</td>
        			<td><input type="date" id="datepicker" name="fromDate" required></td>
    			
        			<td>To:</td>
        			<td><input type="date" id="datepicker" name="toDate" required></td>
    			</tr>
			</table>
			<br><br>
			<label style="font-size: 20px;float: left;">Password : </label>
			<input type="password" name="password" required style="font-size: 20px;padding-left: 5px;margin-left: 5px">
			<font color='red' style="float: none;;font-size: 18px"><%=user_pswd_error==null?"":user_pswd_error %></font><br><br>
			<br>
			<input type="submit" value="OK" style="float: left;">
			<input type="button" value="Cancel" onclick="window.location = '/ProjectIncentive/FillDetails.jsp'" style="margin-left: 20px">
		</form>
	</div>
	<div id="Div2">
		<form action="ClearDB" method="post">
			<label style="font-size: 20px;float: left;">Password : </label>
			<input type="password" name="password" required style="font-size: 20px;padding-left: 5px;margin-left: 5px">
			<font color='red' style="float: none;font-size: 18px"><%=user_pswd_error==null?"":user_pswd_error %></font><br><br>
			<br>
			<input type="submit" value="OK" style="float: left;">
			<input type="button" value="Cancel" onclick="window.location = '/ProjectIncentive/FillDetails.jsp'" style="margin-left: 20px">
		</form>
	</div>
</fieldset><br>
<p style="font-family: cursive;font-size: 18px;text-align: justify;color: red">
	<img src="Images/Error.png" width="40px" height="40px" align="middle" style="margin-right: 10px">To clear all data , click on 'hide date' and proceed without entering date.
</p>
<footer>
		Incentive calculation : made by vijul shah - @2019<br>
		contact info : +919328149037 <span style="margin-left: 5px; margin-right: 5px"></span>
		email : kvkshah19@gmail.com
	</footer>
</body>
</html>