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

<%@ include file="titleImageAndNav.jsp" %>

<div id ="rightcolumn">

			<h2 align='center'>Enter the Business Account info</h2>
			<form method='post' action='insertBusinessAccount.jsp'>

			
					<table class='table'>
						<tr>
							<td>Company Name</td>
							<td><input type='text' name='companyName' id='companyName' required/></td>
						</tr>
					
						<tr>
							<td>Address</td>
							<td><input type='text' name='address' id='address' required/></td>
						</tr>
						
						<tr>
							<td>Phone Number</td>
							<td><input type='text' name='phone' id='phone' required/></td>
						</tr>

						<tr>
							<td>Email</td>
							<td><input type='text' name='email' id='email' required/></td>
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
							<td><input type='text' name='accountTypeId' id='accountTypeId' required/></td>
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

</div>

<%@ include file="footer.jsp" %>

</div>
</body>
</html>			
