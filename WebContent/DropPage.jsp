<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Wellnet - Drop Tables</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link href="index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id ="wrapper">
<div id ="top">
<div id ="topimg">
<img src="Title.jpg" width = "765" height = "225" alt = "Bottles "/>
</div>

</div>


<div id ="leftcolumn">
<ul class="navList">

    <li><a href="index.html">Menu Page</a></li>
    <li><a href="">Create All Tables</a></li>
    <li><a href="">Drop All Tables</a></li>
    <li><a href="">A Form to Insert Data</a></li>
    <li><a href="">Table Data</a></li>
</ul>
</div>

<div id ="rightcolumn">

<% if(request.getMethod().equals("GET")){ %>

<form method='post' action='http://localhost:7070/DropPage.jsp'>
    <label><h3><center>Press the button below to delete all tables in the database.</center></h3></label><br />
	
    <center><input type='submit' value='Delete Tables' /></center>
</form>

<%
}

if(request.getMethod().equals("POST")){

Connection con = null;
  Statement stmt = null;

  try {
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass");
  stmt = con.createStatement();
  stmt.executeUpdate("DROP SEQUENCE SEQ_USER_ACCOUNT");
  out.println("<b>Sequence SEQ_USER_ACCOUNT Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_BUSINESS_ACCOUNT");
  out.println("<b>Sequence SEQ_BUSINESS_ACCOUNT Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_ACCOUNT_TYPE");
  out.println("<b>Sequence SEQ_ACCOUNT_TYPE Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_WINERY_BIO");
  out.println("<b>Sequence SEQ_WINERY_BIO Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_BIO_TRANSLATION");
  out.println("<b>Sequence SEQ_BIO_TRANSLATION Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_WINE");
  out.println("<b>Sequence SEQ_WINE Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_WINE_IMAGE");
  out.println("<b>Sequence SEQ_WINE_IMAGE Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_WINE_TRANSLATION");
  out.println("<b>Sequence SEQ_WINE_TRANSLATION Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_IMPORT_ORDER");
  out.println("<b>Sequence SEQ_IMPORT_ORDER Dropped</b><br />");
  stmt.executeUpdate("DROP SEQUENCE SEQ_ORDER_ITEM");
  out.println("<b>Sequence SEQ_ORDER_ITEM Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE USER_ACCOUNT CASCADE CONSTRAINTS");
  out.println("<b>Table USER_ACCOUNT Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE BUSINESS_ACCOUNT CASCADE CONSTRAINTS");
  out.println("<b>Table BUSINESS_ACCOUNT Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE ACCOUNT_TYPE CASCADE CONSTRAINTS");
  out.println("<b>Table ACCOUNT_TYPE Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE WINERY_BIO CASCADE CONSTRAINTS");
  out.println("<b>Table WINERY_BIO Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE BIO_TRANSLATION CASCADE CONSTRAINTS");
  out.println("<b>Table BIO_TRANSLATION Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE WINE CASCADE CONSTRAINTS");
  out.println("<b>Table WINE Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE WINE_IMAGE CASCADE CONSTRAINTS");
  out.println("<b>Table WINE_IMAGE Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE WINE_TRANSLATION CASCADE CONSTRAINTS");
  out.println("<b>Table WINE_TRANSLATION Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE IMPORT_ORDER CASCADE CONSTRAINTS");
  out.println("<b>Table IMPORT_ORDER Dropped</b><br />");
  stmt.executeUpdate("DROP TABLE ORDER_ITEM CASCADE CONSTRAINTS");
  out.println("<b>Table ORDER_ITEM Dropped</b><br />");
  
  } catch (Exception e) {
  e.printStackTrace();
  out.println("<body><h4><font color='red'>File could not be deleted <br><br> Exception thrown:<br> " + e.getMessage()
    + "</font></h4></body></html>");
  }
  }
%>
       
</div>
</body>

<html>
