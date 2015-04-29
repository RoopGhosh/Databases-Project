<%@page import= "java.util.*"%>
<%@page import= "edu.neu.aarambh.DAO.*" %>
<%@page import= "edu.neu.aarambh.classes.*"%>
<%@page import= "edu.neu.aarambh.servelets.*"%>
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
</script>

</head>

<body>
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
<div align="center">
<h1> PROPERTY DETAILS </h1>
</div>
<br>
<% 
	if(request.getParameter("propertyid") != null)	
	{
		session.setAttribute("propertyid", request.getParameter("propertyid"));
	}

	int propertyid = Integer.parseInt(session.getAttribute("propertyid").toString());

	DAOProperty daoprop = new DAOProperty();
	Property property = daoprop.findPropertybyPropertyId(propertyid);
   	String url = property.getUrl();
    %>

<br>

<img src=<%=url %> alt="http://www.ht-real-estate.com/template/ht2014/images/landscape/05.jpg" style="width:1000px; height:400px; margin: 0 auto;">

<br>
<br>
<table class="table table-hover" id="tab">
        <thead>
        <tr>
            <th>Property Attributes</th>
            <th>Values</th>
       </tr>
       </thead>
 
<tbody>
<tr><td>
<h3> Property Name &nbsp;&nbsp;&nbsp;</h3>
</td>
<td> <%=property.getPropertyname() %></td></tr>

<tr><td>
<h3> Address &nbsp;&nbsp;&nbsp;</h3> 
</td><td>
<%=property.getAddress() %> </td></tr>

<tr><td>
<h3> Description &nbsp;&nbsp;&nbsp;</h3>
</td><td> 
<%  DAOLocation loki = new DAOLocation();
	Location location = loki.findLocationbyLocationId(property.getLocationid());%>
	<%= location.getDescription()%> </td></tr>

<tr><td>
<h3> Amenties &nbsp;&nbsp;&nbsp;</h3> 
</td><td>
<%  DAOAmenity amenity = new DAOAmenity();
	Amenity amen = amenity.findAmenityById(property.getAmenityid());%>
	<%= amen.getAmenname()%>
	<%= amen.getDescription() %> </td></tr>

<tr><td>
<h3> City &nbsp;&nbsp;&nbsp;</h3></td>
<td> 

<%=property.getCity() %></td></tr>

<tr><td>
<h3> State &nbsp;&nbsp;&nbsp;</h3>
</td><td> 
<%=property.getState() %> </td></tr>

<tr><td>
<h3> Zip &nbsp;&nbsp;&nbsp;</h3></td> 
<td><%=property.getZip() %></td> </tr>

<tr><td>
<h3> Price &nbsp;&nbsp;&nbsp;</h3>
</td><td> 
<%=property.getPrice() %></td></tr>

<tr><td>
<h3> Average Property Rating:&nbsp;&nbsp;&nbsp;</h3></td> 
<td><% DAORating dao = new DAORating();
  Double avg = dao.getAverage(Integer.parseInt(session.getAttribute("propertyid").toString()));%>
<%=avg %> </td></tr>

</tbody>
</table>

<br>
<br>


<% 	
   		java.util.Date utilDate = new java.util.Date();
 	  	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
 	  	String st = request.getParameter("action");
 	  	DAOComment daoc = new DAOComment();
    	if ("create".equals( request.getParameter("action")))
    	{
 	  	
    		//INSERTION OF RATINGS
       		
        	DAORating ratdao = new DAORating();
            String rat5 = request.getParameter("rating5");
        	String rat4 = request.getParameter("rating4");
        	String rat3 = request.getParameter("rating3");
        	String rat2 = request.getParameter("rating2");
        	String rat1 = request.getParameter("rating1"); 
        	 int  publicval =  0;
        	 if(request.getParameter("mkpublic") == "Y" ||request.getParameter("mkpublic") == "y")
        	 {
        		 publicval = 1;
        		 
        	 }
        	 if(request.getParameter("mkpublic") == "N" ||request.getParameter("mkpublic") == "n")
        	{
        		publicval = 0; 
        	}
    		
        	if(rat1 != null && rat1.equalsIgnoreCase("1"))
        	{
        		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 1, publicval);
        	}
        	else if(rat2 != null && rat2.equalsIgnoreCase("2"))
            {
            		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 2, publicval);
            }
        	else if(rat3 != null && rat3.equalsIgnoreCase("3"))
            {
            		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 3, publicval);
            }
        	else if(rat4 != null && rat4.equalsIgnoreCase("4"))
            {
            		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 4, publicval);
            }
        	else if(rat5 != null && rat5.equalsIgnoreCase("5"))
            {
            		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 5, publicval);
            }
        	else 
            {
            		ratdao.insertNewRating(Integer.parseInt(session.getAttribute("propertyid").toString()),session.getAttribute("currentSessionUser").toString(), 0, publicval);
            }
         
    		
 	  	if (request.getParameter("head") != null || request.getParameter("desc") != null || request.getParameter("username") != null)
    	{
    		daoc.insertNewComment(session.getAttribute("currentSessionUser").toString(), propertyid, 3, request.getParameter("head"), request.getParameter("desc"),sqlDate, 1);	
    	}
    	}
    	List<Comment> com = daoc.findCommentbyproperty(propertyid);
    	
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
                <th><b>Thread Number</b></th>
                <th><b>Comment Header</b></th>
                <th><b>Created By</b></th>
                <th><b>Description</b></th>
                <th><b>Created On</b></th>
            <!-- Comment Count Header Creation -->
                <th><b>No Of Comments</b></th>
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
        </td><td>

        <% 
     		// ADDING NEW COMMENTS FOR COMMENT COUNT
        	List<Comment> c2 = daoc.findCommentbyChild( c.getCommentid());
        	if(c2 == null)
        	{ %>
        		0
        	<% }
        	else
        	{ %>
        		<%= c2.size() %>
       		<% } %></td> </tr> <% } } } %>   
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
        	
        	<input id="rating5" type="radio" name="rating5" value="5">
        	<label for="rating5">5</label>
        
        	<input id="rating4" type="radio" name="rating4" value="4">
        	<label for="rating4">4</label>
        
        	<input id="rating3" type="radio" name="rating3" value="3">
        	<label for="rating3">3</label>
        
        	<input id="rating2" type="radio" name="rating2" value="2">
        	<label for="rating2">2</label>
        
        	<input id="rating1" type="radio" name="rating1" value="1">
        	<label for="rating1">1</label>

      	</span>
    </p>
    </div>
	
	<br>
	
	<div class="control-group">
        	<label class="left"><b>Make Public</b> </label>
        		<div class="controls">
        			<div class="input-prepend">
        			
        					<span class="add-on"><i class="icon-lock"></i></span>
        					<input type="text" id="public" class="input-xlarge" name="mkpublic" placeholder="Y/N">
        			</div>
        		</div>
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