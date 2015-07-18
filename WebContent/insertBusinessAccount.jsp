<%@ page import="wellnet.*, wellnet.dao.*"%>
<%@page import="java.util.ArrayList"%>




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
    <li><a href="DropPage.jsp">Drop All Tables</a></li>
    <li><a href="insertIndex.html">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">

			<h2 align='center'>Enter the User Account info</h2>
			<form method='post' action='insertBusinessAccount.jsp'>

			
					<table class='table'>
						<tr>
							<td>Company Name</td>
							<td><input type='text' name='companyName' id='companyName' /></td>
						</tr>
					
						<tr>
							<td>Address</td>
							<td><input type='text' name='address' id='address' /></td>
						</tr>
						
						<tr>
							<td>Phone Number</td>
							<td><input type='text' name='phone' id='phone' /></td>
						</tr>

						<tr>
							<td>Email</td>
							<td><input type='text' name='email' id='email' /></td>
						</tr>

						<tr>
							<td>Is business approved?</td>
							<td>
								<select name='approved' id='approved'>
										<option value='N'>N</option>
										<option value='Y'>Y</option>
								</select>
							</td>
						</tr>

						<tr>
							<td>Select Account Type</td>
							<td><input type='text' name='accountTypeId' id='accountTypeId' /></td>
						</tr>						
						
						<tr>
							<td></td>
							<td><input type='submit' value='Enter'/></td>
						</tr>
					</table>
			</form>
			
	<jsp:useBean id="one" class="wellnet.DBContext" ></jsp:useBean>

<%
if(request.getMethod().equals("POST")){ 

	one.addBusinessAccount(one.getBusinessAccountFromForm(request));
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
