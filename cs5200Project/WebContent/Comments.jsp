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


<script>
function display()
{
var val1= document.getElementById('rating1').checked;
var val2= document.getElementById('rating2').checked;
var val3= document.getElementById('rating3').checked;
var val4= document.getElementById('rating4').checked;
var val5= document.getElementById('rating5').checked;
alert(val1);
alert(val2);
alert(val3);
alert(val4);
alert(val5);
}


</script>
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
							<li><a href="#RentingHomes">Renting Homes</a></li>
							<li><a href="#AboutUs">About Us </a></li>
							<li><a href="#Customers">Customers</a></li>
							<li><a href="#Contact">Contact</a></li>
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
<h1> PROPERTY DETAILS </h1>
<table class="table table-hover" id="propertydeatails">
<thead>
        <tr>
            <th>Address </th>
            <th>City</th>
            <th>Property Name</th>
            <th>State</th>
            <th>Zip</th>
            <th>Price</th>
       </tr>
       </thead>
<%
		if(request.getParameter("propertyid") != null)
		{
			session.setAttribute("propertyid", request.getParameter("propertyid"));
		}

		int propertyid = Integer.parseInt(session.getAttribute("propertyid").toString());
			
		//var propertyId=request.getParameter('propertyid');
		DAOProperty daoprop = new DAOProperty();
		Property property = daoprop.findPropertybyPropertyId(propertyid);
		%>
		<tr>
				<td><%=property.getAddress()%>		</td>
				<td><%=property.getCity()%>			</td>
				<td><%=property.getPropertyname()%>	</td>
				<td><%=property.getState()%>		</td>
				<td><%=property.getZip()%>			</td>
				<td><%=property.getPrice()%>		</td>
			</tr>
</table>



   <% 	
    	DAOComment dao = new DAOComment();
    	java.util.Date utilDate = new java.util.Date();
 	  	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
 	  	String st = request.getParameter("action");
    	if ("create".equals(st))
    	{
 	  	
 	  	if (request.getParameter("head") != null || request.getParameter("desc") != null || request.getParameter("username") != null)
    	{
    		dao.insertNewComment(session.getAttribute("currentSessionUser").toString(), propertyid, 3, request.getParameter("head"), request.getParameter("desc"),sqlDate, 1);
    	}
    	}
    	
    	List<Comment> com = dao.findCommentbyproperty(propertyid);
    	
    	if(com.isEmpty())
        {%>
        <h1>No Comments! Be the first one to write one!</h1>
        <%}
        else
        {
        	%>
        	<table class="table table-hover" id="tab">
            <thead>
            <tr>
                <th>Thread Number</th>
                <th>Comment Header</th>
                <th>Created By</th>
                <th>Description</th>
                <th>Created On</th>
           </tr>
           </thead>
        <%
        for (Comment c: com)
        	{if (c.getReplyid() == 1 )
        {%>
        <tbody>
        <tr> 
        <td><a href="CommentThread.jsp?commentid=<%=c.getCommentid()%>">
        <%=c.getCommentid()%></a>
        </td><td>
      	<%=c.getCommheader()%>
        </td><td>
	    <%=c.getUsername()%>
        </td><td>
		<%=c.getCommdesc() %>
        </td><td>
	    <%=c.getCommdte()%>
        </td> </tr> <%} } } %>   
     </tbody>
   </table>
<br>
<br>
		
<div class="form-group" id="form1">

	<form action="Comments.jsp">
	
	<input type="hidden" name="test" id="test" value="">
	<div class="container">
		
		 <fieldset disabled>
	   		<div class="row" style="display:inline-block">
         	<label for="disabledTextInput"  class="col-sm-2 control-label" style="width:100px;"><b> Username &nbsp;</b> </label>
    	     <div class="col-sm-10">
        	 <input type="text" id="disabledTextInput" name="username" class="form-control" value=<%=session.getAttribute("currentSessionUser")%>>
         	</div>
      		</div>
	 	</fieldset>
	<br>
	<div class="row" style="display:table-caption" id="sfl">
	<label class="left" style="width:100px;text-align:left"><b>Thread Title &nbsp;</b> </label>
	<input type="text" style= "background-color:white; width:500px; height:70px" class="form_input" id="header" name="head" placeholder="Enter Title"/>
	</div>
	<br>
	<br>
  	<div class="row">
    	<label for="name"><b>Please provide comments &nbsp;</b></label>
    	<textarea class="form-control" style="margin-left:0px" name = "desc" rows="10"></textarea>
  	</div>
	<br>
	<div id="rating" >
	 <p><h2> Rating &nbsp;</h2>
      	<span class="starRating">
        	
        	<input id="rating5" type="radio" name="rating" value="5">
        	<label for="rating5">5</label>
        
        	<input id="rating4" type="radio" name="rating" value="4">
        	<label for="rating4">4</label>
        
        	<input id="rating3" type="radio" name="rating" value="3">
        	<label for="rating3">3</label>
        
        	<input id="rating2" type="radio" name="rating" value="2">
        	<label for="rating2">2</label>
        
        	<input id="rating1" type="radio" name="rating" value="1">
        	<label for="rating1">1</label>

      	</span>
    </p>
    </div>
	
		<div style="float: left; padding: 10px 25px 0 0;">
		<button type="submit" class="btn btn-info" id="submit" name="action" value="create">Add Comment Thread</button>
		</div>
	
	</div>
	</form>
	
	</div>
</div>
</body>
</html>	