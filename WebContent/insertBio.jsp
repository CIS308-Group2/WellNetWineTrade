<%@ page import="wellnet.*, wellnet.dao.*"%>

<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<%WineryBio one = new WineryBio();%>
<%DBContext dataAccess = new DBContext(); %>

<!-- 
Steve Simpson 21066092
06/30/15
CIS404-M308
Assignment 7.1
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Wellnet</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link href="index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id ="wrapper">

<div id ="leftcolumn">
<ul class="navList">

    <li><a href="index.html">Menu Page</a></li>
    <li><a href="initializeIndex.html">Create All Tables</a></li>
    <li><a href="">Drop All Tables</a></li>
    <li><a href="insertIndex.html">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">
    


			<h2 align='center'>Enter the Winery Bio</h2>
			<form method='post' action='insert.jsp'>

			
					<table class='table'>
						<!-- Account Id is system assigned by using sequence in DB. User should not be aware of it or be able to set it.
							 In this case we should already have account ID because the user had to login to get to this page.
							 The login page will need to store the user account and/or business account in the session to be retrieved by the proceeding pages.
						<tr>
							<td>Account ID</td>
							<td><input type='text' name='accountId' id='accountId' /></td>
						</tr>						
						 -->
					
						<tr>
							<td>Bio</td>
							<td><input type='text' name='bio' id='bio' /></td>
						</tr>

						<tr>
							<td></td>
							<td><input type='submit' value='Enter'/></td>
						</tr>
					</table>
			</form>


<%
if(request.getMethod().equals("POST")){ 


	one.setAccountId(Integer.parseInt(request.getParameter("accountId")));
	one.setBio(request.getParameter("bio"));
	
	dataAccess.addBio(one);
	
}


%>
			</p>

	
<div id ="footer">
<p><a href="">Winery Portal</a>
<a href="">Importer Portal</a>
</p>


<p>Managing Director: <a href="mailto:pauld@wellnet.au">Paul Evenson</a></p> 
<p>&copy; Copyright 2015</p>

<p>Photos courtesy of <a href="http://www.yadkinvalleywineblog.com/">Wine & Wine Cellars</a></p>
</div>
</div>
</div>
</body>
</html>			