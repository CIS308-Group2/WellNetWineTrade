<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList, java.io.IOException"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Wellnet</title>
<%@ include file="NoCache.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="index.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="dataAccess" class="wellnet.DBContext" scope="page"></jsp:useBean>
<jsp:useBean id="displayBean" class="wellnet.beans.DisplayWineryInfo" scope="page"></jsp:useBean>

<%
		ArrayList<Integer> IDsFromDB = dataAccess.getWineryAccountIds();
		request.setAttribute("IDsFromDB", IDsFromDB);
%>

</head>

<body>
<div id ="wrapper">
<%@ include file="titleImageAndNav.jsp" %>

	<div id="rightcolumn">

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
%>
		<form method='post' action=''>
    		
    		<table class="table">
    		<caption>Please select a winery to view bio and stock information.</caption>
    		<tr>
				<td colspan="2">    		
    				<hr>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				Account Number:
    				<select name="account" id="account" required>
						<c:forEach var="i" items="${IDsFromDB}">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input type='submit' value='Enter' />
    			</td>
    		</tr>
    		</table>
		</form>
<%	
	}else if(request.getMethod().equalsIgnoreCase("POST")){
		
		int accountId = Integer.parseInt(request.getParameter("account"));
		
		String wineryBio = displayBean.displayWineryBio(dataAccess.getWineryBio(accountId, "english"));
%>		
		<div class="content-cushion">
		<span class="bio">
<%
		out.println(wineryBio);
%>
		</span>
		</div>

		<br>
		<hr>
		<br>
		<hr>
		<br>

		<div class="content-cushion">
		<span class="wines">
<%
		String wines = displayBean.displayWines(dataAccess.getWineryWineStock(accountId, "english"));
		
		out.println(wines);

	}
%>		
		</span>
		</div>
		
	</div>
		
<%@ include file="footer.jsp" %>	
</div>
</body>
</html>