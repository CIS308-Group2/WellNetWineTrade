<%@ page import="wellnet.*, wellnet.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>




<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Wellnet</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link href="index.css" rel="stylesheet" type="text/css" />

</head>

	<jsp:useBean id="one" class="wellnet.DBContext" ></jsp:useBean>

<%
		ArrayList<Integer> accountIds1 = one.getAccountIds();
		request.setAttribute("accountIds", accountIds1);
	
%>

<body>
<div id ="wrapper">

<div id ="leftcolumn">
<ul class="navList">

    <li><a href="index.html">Menu Page</a></li>
    <li><a href="initializeIndex.html">Create All Tables</a></li>
    <li><a href="DropPage.jsp">Drop All Tables</a></li>
    <li><a href="insertIndex.html">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">
    


			<h2 align='center'>Enter the User Account info</h2>
			<form method='post' action='insertUserAccount.jsp'>

			
					<table class='table'>
						<tr>
						
						<tr>
							<td>User Name</td>
							<td><input type='text' name='username' id='username' required/></td>
						</tr>
						
						<tr>
							<td>Password</td>
							<td><input type='text' name='pswd' id='pswd' required/></td>
						</tr>

						<tr>
							<td>Account ID</td>
							<td>
								<select name="chosenAccount" id="account">
									<c:forEach var="i" items="${accountIds}">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> 
							</td>
						</tr>
							
						<tr>
							<td></td>
							<td><input type='submit' value='Enter'/></td>
						</tr>
					</table>
			</form>

<%
if(request.getMethod().equals("POST")){ 

	one.addUserAccount(one.getUserAccountFromForm(request));
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
