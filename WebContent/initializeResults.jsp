<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Wellnet</title>
<%@ include file="NoCache.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="index.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div id="wrapper">

	<%@ include file="titleImageAndNav.jsp" %>

		<div id="rightcolumn">
		<h2 align='center'>Sql statement results</h2>
			<div class="result-message">${message }</div>

		</div>
		
		<%@ include file="footer.jsp" %>
		
	</div>
</body>
</html>