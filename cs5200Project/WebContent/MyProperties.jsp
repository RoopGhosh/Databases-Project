<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.Date.*" import="edu.neu.aarambh.classes.*" import="edu.neu.aarambh.DAO.*" import="edu.neu.aarambh.servelets.Webhitter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Properties</title>
</head>
<body>

<!--  HEADER FORMATTING ARAMBH -->
<div id="main_container">
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
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Our Customers</a></li>
							<li></li>
							<li><a href=#>Contact Us</a></li>
						</ul>
					</div>
				</div>

			
<!--  IMAGE SLIDER IN ARAMBH -->
	  <div id="well">

   <h1> APARTMENTS LIST</h1>
   <br>
   
   
   <script>
        $(document).ready(function() {

                $('.ajax-link').click(function() {
                       // $('.page-content').hide();
                        var category = $(this).attr("data-category");
                       // the URL for the request
                        $.get('deleteProperty', {
                                // Parameter to be sent to server side
                                category : category
                        });
                });
        });
</script>
   
  <table class="table table-bordered">   
  <tr>
   		 	<td></td>
   		 	
   		 		<td>
   		 			<b>Image</b>
   		 		</td>
   		 		<td>
   		 			<b>Address</b>
   		 		</td>
   		 		<td>
   		 			<b>City</b>
   		 		</td>
   		 		<td>
   		 			<b>Property Name</b>
   		 		</td>
   		 		<td>
   		 			<b>State</b>
   		 		</td>
   		 		<td>
   		 			<b>Zip</b>
   		 		</td>
   		 		<td>
   		 			<b>Price</b>
   		 		</td>	
   		 	</tr>
   <% DAOShortlist st = new DAOShortlist();
   ArrayList<Integer> propertyidlist = new ArrayList<Integer>();
   propertyidlist = st.getPropertyIdfromShortlistByUser(session.getAttribute("currentSessionUser").toString());
   		for( int i = 0; i< propertyidlist.size(); i++)
   		{
   			DAOProperty prop = new DAOProperty(); 
   			Property property = prop.findPropertybyPropertyId(propertyidlist.get(i)); %>
   			
   			   <tr>
   			   <td><%= i %></td>
   			   <td>
   			   		<div class="row">
   		  					  <div class="col-sm-6 col-md-4">
   		    					<div class="thumbnail">
   		     						<img src = <%=property.getUrl()%> alt="" height="40" width="40" > 
   		     						  </div>
   		 							 </div>
   									</div>
   			   					</td>
   						<td><%=property.getAddress()%>		</td>
   						<td><%=property.getCity()%>			</td>
   						<td><%=property.getPropertyname()%>	</td>
   						<td><%=property.getState()%>		</td>
   						<td><%=property.getZip()%>			</td>
   						<td><%=property.getPrice()%>		</td>
   						<td><a href="#" class="ajax-link" data-category= <%= property.getPropertyid() %>>DELETE PROPERTY</a>
   					</tr>
   			   <%
   		   		}  %>

</body>
</html>