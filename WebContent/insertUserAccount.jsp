<%@ page import="wellnet.*, wellnet.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


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

<%@ include file="titleImageAndNav.jsp" %>

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

</div>

<%@ include file="footer.jsp" %>

</div>
</body>
</html>			
