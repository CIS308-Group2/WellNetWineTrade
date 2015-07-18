<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Wellnet</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="index.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div id="wrapper">
<div id="top">
			<div id="topimg">
				<img src="images/title.jpg" width="765" height="225" alt="Bottles" />
			</div>

		</div>
		<div id="leftcolumn">
			<ul class="navList">

				<li><a href="index.html">Menu Page</a></li>
				<li><a href="initializeIndex.html">Create All Tables</a></li>
				<li><a href="DropPage.jsp">Drop All Tables</a></li>
				<li><a href="insertIndex.html">A Form to Insert Data</a></li>
				<li><a href="">Table Data</a></li>
			</ul>
		</div>

		<div id="rightcolumn">
		<h2 align='center'>Sql statement results</h2>
			<div class="result-message">${message }</div>

			<div id="footer">
				<p>
					<a href="">Winery Portal</a> <a href="">Importer Portal</a>
				</p>


				<p>
					Managing Director: <a href="mailto:pauld@wellnet.au">Paul
						Evenson</a>
				</p>
				<p>&copy; Copyright 2015</p>

				<p>
					Photos courtesy of <a href="http://www.yadkinvalleywineblog.com/">Wine
						&amp; Wine Cellars</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>