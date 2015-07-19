<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Wellnet - Drop Tables</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link href="index.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="dataAccess" class="wellnet.DBContext" scope="page"></jsp:useBean>

</head>

<body>
<div id ="wrapper">
<div id ="top">
<div id ="topimg">
<img src="images/title.jpg" width = "765" height = "225" alt = "Bottles "/>
</div>

</div>


<div id ="leftcolumn">
<ul class="navList">

    <li><a href="index.html">Menu Page</a></li>
    <li><a href="">Create All Tables</a></li>
    <li><a href="">Drop All Tables</a></li>
    <li><a href="">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">

<% if(request.getMethod().equals("GET")){ %>

<form method='post' action=''>
    <label><h3><center>Press the button below to delete all tables in the database.</center></h3></label><br />
	
    <center><input type='submit' value='Delete Tables' /></center>
</form>

<%
}

if(request.getMethod().equals("POST")){
	
	if(dataAccess.dropDB()){
%>
 <h3 style="text-align:center">The database tables were dropped successfully!></h3>
<%		
	}else{
%>
 <h3 style="text-align:center">Failure to drop the database tables!</h3>
<%
	}
	
}
%>
       
</div>
</body>

<html>
