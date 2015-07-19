<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Wellnet</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<link href="index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id ="wrapper">

<%@ include file="titleImageAndNav.jsp" %>

<div id ="rightcolumn">
    


	<h2 align='center'>What do you want to enter?</h2>

<ul>
    <li><a href="insertUserAccount.jsp">User Account</a></li>
    <li><a href="insertBusinessAccount.jsp">Business Account</a></li>
    <li><a href="insertBio.jsp">Winery</a></li>
    <li><a href="insertWine.jsp">Wine</a></li>
</ul>

</div>

<%@ include file="footer.jsp" %>

</div>
</body>
</html>			