<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.Date.*" import= "edu.neu.aarambh.classes.*" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.*" import="edu.neu.aarambh.servelets.Webhitter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="resource\css\star.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetch All Locations</title>
</head>
<body>

<!--  HEADER FORMATTING ARAMBH -->
<div id="main_container">
<div class="container">
				<div id="header">
					<div id="logo">
						<a href=""><img src="boot/Images/logo.gif" width="147" height="78" alt="" border="0" /></a>
					</div>
					<div class="banner_adds"></div>
					<div class="menu">
						<ul>
							<li><a href="LoginAarambh.jsp">Home</a>
							<table>
							<tr>
							<td></td>
							</tr>
							</table>
							</li>
							<li><a href="login.jsp" target="_self">Login</a></li>
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Our Customers</a></li>
							<li></li>
							<li><a href=#>Contact Us</a></li>
						</ul>
					</div>
				</div>

			
<!--  IMAGE SLIDER IN ARAMBH -->
<div align="center"><H1>ALL LOCATION DETAILS</H1>
</div>
<div class="form-row">
<table class="table table-bordered">

<%
  int i=0;
  DAOLocation location = new DAOLocation();
  List<Location> list = location.getAllLocation();
%>
<td> SNO</td>
<td> Name</td>
<td> Description</td>
<td> Latitude</td>
<td> Longitude</td>
<td> City</td>
<td> State</td>
<td> Zip</td>
<% for (Location loc : list) 
{%>		
	<tr>
	<td><%=  ++i%></td>
	<td><%=loc.getLocname()%></td>
	<td><%= loc.getDescription()%></td>
	<td><%= loc.getLatitude()%></td>
	<td><%= loc.getLongitude()%></td>
	<td><%= loc.getCity()%></td>
	<td><%= loc.getState()%></td>
	<td><%= loc.getZip()%></td>
	</tr>
<% }%>
</table>
</div>
</body>
</html>

