<%@page import= "java.util.*"%>
<%@page import= "edu.neu.aarambh.DAO.*" %>
<%@page import= "edu.neu.aarambh.classes.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comments Page</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<link href="resource\js\jquery-1.11.2.min.js" rel="js"/>
<link href="resource\css\star.css" rel="stylesheet"/>
</head>

<body>


<!--  IMAGE SLIDER IN ARAMBH -->
<div class="container">
<div id="header">
					<div id="logo">
						<a href=""><img src="resource/img/logo.gif" width="147" height="78" alt="" border="0" /></a>
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
							<li><a href="SellProperty.jsp">Renting Homes</a></li>
							<li><a href="login.jsp" target="_self">Login</a></li>
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Our Customers</a></li>
							<li><a href="#LogOut" onClick="logOutUser()">LogOut</a></li>
							<li id = "pol" style="font:16px; weight:bold; color:white"><script>if(localStorage.getItem("userName") != null)
								{
								
								document.write(localStorage.getItem("userName"));
								}
								else
								{
									//document.write("No User");
								}
							</script></li>
							
						</ul>
					</div>
				</div>

<br>
<h1> My History </h1>
<table class="table table-hover" id="historydeatails">
<thead>
        <tr>
            <th>History Id </th>
            <th>Date</th>
            <th>Description</th>
       </tr>
       </thead>
       <tr>
<%
	DAOHistory history = new DAOHistory();
	String username = session.getAttribute("currentSessionUser").toString();
	List<History> histories = history.getAllHistoryforUser(username);
	 for (History h : histories)
		{%>
	   <tr> <td> <%= h.getHistid() %></td>
		 	<td><%= h.getCdate()%>	</td>
			<td><%= h.getDescription()%>		</td>
			 <!--	<td><input type="button" onClick="test2()" value="Show Table" id="showTable"/>
				</td>  -->
			</tr>
	   <% } %>
</tbody>
</table>
</div>
<div id="footer">
			<ul class="footer_menu">
				<li><a href="#" class="nav_footer" style="weight:bold"> Home </a></li>
				<li><a href="SellProperty.jsp" class="nav_footer" style="weight:bold"> Post Property Ad </a></li>
				<li><a href="AllProperty.jsp" class="nav_footer" style="weight:bold"> Our Properties </a></li>
				<li><a href="AllLocation.jsp" class="nav_footer" style="weight:bold"> Our Location </a></li>
				<li><a href="#" class="nav_footer" style="weight:bold"> Contact </a></li>
			</ul>
</div>
</body>
</html>