<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.DAOProperty" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
	<%
	DAOProperty dao = new DAOProperty();
	List<Property> properties = dao.findPropertybyAmenityId(2);
	
	%>
	<h1>PROPERTIES</h1>
	<table>
	<%
		
		String st = "London";
		String st1 = "City"; 
	   if (st1 == "City")
	   {
	 	List<Property> prop = dao.findPropertybyCity(st);
		for (Property property : prop)
		{
	%>		<tr>
				<td><%=property.getAddress()%>		</td>
				<td><%=property.getCity()%>			</td>
				<td><%=property.getPropertyname()%>	</td>
				<td><%=property.getPropertytype()%>	</td>
				<td><%=property.getState()%>		</td>
				<td><%=property.getZip()%>			</td>
				<td><%=property.getGuiid()%>		</td>
			</tr>
	<%		
		}}
	
	%>
	
	</table></div>
  

</body>
</html>