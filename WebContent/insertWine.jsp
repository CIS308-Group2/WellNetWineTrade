<%@ page import="wellnet.*"%>

<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<%Wine one = new Wine();%>

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
    <li><a href="">Create All Tables</a></li>
    <li><a href="">Drop All Tables</a></li>
    <li><a href="insertIndex.html">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">
    


			<h2 align='center'>Enter the Wine Info</h2>
			<form method='post' action='insertWine.jsp'>

			
					<table class='table'>
						<tr>
							<td>Wine Name</td>
							<td><input type='text' name='name' id='wineInfo' /></td>
						</tr>
					
						<tr>
							<td>Year</td>
							<td><input type='text' name='year' id='wineInfo' /></td>
						</tr>
						
						<tr>
							<td>Type of Wine</td>
							<td><input type='text' name='type' id='wineInfo' /></td>
						</tr>

						<tr>
							<td>Stock Number</td>
							<td><input type='text' name='stock' id='wineInfo' /></td>
						</tr>
						
						<tr>
							<td>Promo Material</td>
							<td><input type='text' name='promoMaterial' id='wineInfo' /></td>
						</tr>
						
						<tr>
							<td>Pairing Tasting Notes</td>
							<td><input type='text' name='pairingTastingNotes' id='wineInfo' /></td>
						</tr>
						
						<tr>
							<td>Account ID</td>
							<td><input type='text' name='accountId' id='wineInfo' /></td>
						</tr>
						
						<tr>
							<td></td>
							<td><input type='submit' value='Enter'/></td>
						</tr>
					</table>
			</form>

<%
if(request.getMethod().equals("POST")){ 

	one.setName(request.getParameter("name"));
	one.setYear(Integer.parseInt(request.getParameter("year")));
	one.setType(request.getParameter("type"));
	one.setStock(Integer.parseInt(request.getParameter("stock")));
	one.setPromoMaterials(request.getParameter("promoMaterial"));
	one.setPairingTastingNotes(request.getParameter("pairingTastingNotes"));
	one.setAccountId(Integer.parseInt(request.getParameter("accountId")));
	
	one.addWine();
	
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