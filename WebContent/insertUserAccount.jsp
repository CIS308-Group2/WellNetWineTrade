<%@ page import="wellnet.*, wellnet.dao.*"%>

<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<%UserAccount one = new UserAccount();%>
<%DBContext dataAccess = new DBContext(); %>


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
    <li><a href="">Create All Tables</a></li>
    <li><a href="">Drop All Tables</a></li>
    <li><a href="insertIndex.html">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">
    


			<h2 align='center'>Enter the User Account info</h2>
			<form method='post' action='insertUserAccount.jsp'>

			
					<table class='table'>
						<tr>
							<td>User ID</td>
							<td><input type='text' name='userId' id='userId' /></td>
						</tr>
					
						<tr>
							<td>User Name</td>
							<td><input type='text' name='username' id='username' /></td>
						</tr>
						
						<tr>
							<td>Password</td>
							<td><input type='text' name='password' id='password' /></td>
						</tr>						
						
						<tr>
							<td>Password Salt</td>
							<td><input type='text' name='passwordSalt' id='passwordSalt' /></td>
						</tr>						
						<!-- Account Id is system assigned by using sequence in DB. User should not be aware of it or be able to set it.
						<tr>
							<td>Account ID</td>
							<td><input type='text' name='accountId' id='accountId' /></td>
						</tr>						
						 -->
						
						<tr>
							<td></td>
							<td><input type='submit' value='Enter'/></td>
						</tr>
					</table>
			</form>


<%
if(request.getMethod().equals("POST")){ 

	one.setUserId(Integer.parseInt(request.getParameter("userId")));
	one.setUsername(request.getParameter("username").toString());
	one.setPswd(request.getParameter("password").toString());
	one.setPswdSalt(request.getParameter("passwordSalt").toString());
	
	one.setAccountId(dataAccess.getNextAccountId());
	
	dataAccess.addUserAccount(one);
	
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