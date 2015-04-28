<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.Date.*" import= "edu.neu.aarambh.classes.User" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.*" import="edu.neu.aarambh.servelets.Webhitter" %>

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
	  <div id="well">

   <h1> APARTMENTS LIST</h1>
   <br>
   
   
  <table class="table table-bordered">   
   <% 
   int i = 0;
   
   	 DAOProperty propDao = new DAOProperty();
   	 List<Property> prop =   propDao.getAllProperty();  //web.searchResults(txtfield);
   	 
 	if ( prop.isEmpty())
 	{
 		%> <td> <h1> NO DATA </h1></td><%
 	}
 	%>
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
 	<%
    for (Property property : prop)
   		{%>
	   <tr>
	   <td><%=++i %></td>
	   <td>
	   		<div class="row">
  					  <div class="col-sm-6 col-md-4">
    					<div class="thumbnail">
     						<img src = <%=property.getUrl()%> alt alt="Smiley face" height="40" width="40" > 
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
			</tr>
	   <%
   		}  %>
  </table>
  </div>
</body>
</html>