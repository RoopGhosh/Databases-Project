<%@page import= "java.util.*"%>
<%@page import= "edu.neu.aarambh.DAO.*" %>
<%@page import= "edu.neu.aarambh.classes.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comments Thread Page</title>

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
<script type="text/javascript">
$(document).ready(function() {
 $("#formdiv123").hide();
  var userName= localStorage.getItem("userName");
 if(userName != null && userName != "")
	 {
		jQuery("#formdiv123").show();
		jQuery("#logout").show();
		jQuery("#login").hide();
	}
	else
	{
	
	jQuery("#formdiv123").hide();
	jQuery("#logout").hide();
	jQuery("#login").show();
	}   
});

function logOutUser()
{
   	 
   	 localStorage.clear();
   	 var userName= localStorage.getItem("userName");
   	 location.reload();	 
}
</script>

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
							<li><a href="#">Home</a>
							<table>
							<tr>
							<td></td>
							</tr>
							</table>
							</li>
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Our Customers</a></li>
							<li><a href="AllLocation.jsp">Our Locations</a></li>
							<li><a href="ContactUs.jsp">Contact Us</a></li>
							<li id="login"><a href="login.jsp" target="_self">Login</a></li>
							<li id="logout" style="display:none"><a href="#LogOut" onClick="logOutUser()" id="logout">LogOut</a></li>
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

			
<!--  IMAGE SLIDER IN ARAMBH -->
			<br>
		
			<div class="div1" style="width: 100%; height: 450px">
				<div id="slider">
				<a href="" target="_blank">
				<img src="resource/img/img1.jpg" alt="" /></a>
				<a class="lazyImage" href="resource/img/img2.jpg" title=""></a>
				<b data-src="resource/img/img3.jpg"></b>
				<a class="lazyImage" href="resource/img/img4.jpg" title=""></a>
				<a class="lazyImage" href="resource/img/img5.jpg" title=""></a>
				</div>
			</div>
			<br>	


<br>

<div style="align:center">
<% if(request.getParameter("commentid") != null)
{
	session.setAttribute("commentId", request.getParameter("commentid"));
}%>
<h1> COMMENT THREAD FOR COMMENT ID : <%=session.getAttribute("commentId").toString()%></h1></div>

<br>

<% 	
		DAOComment dao = new DAOComment();
		int comm= Integer.parseInt(session.getAttribute("commentId").toString());
		String st = request.getParameter("action");
		if ("create".equals(st))
		{
		//var propertyId=request.getParameter('propertyid');
    	
    	java.util.Date utilDate = new java.util.Date();
 	  	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
 	  	
    	if (request.getParameter("head") != null || request.getParameter("desc") != null)
    	{	
    		dao.insertNewComment(session.getAttribute("currentSessionUser").toString(), Integer.parseInt(session.getAttribute("propertyid").toString()), 3, request.getParameter("desc"),request.getParameter("head"), sqlDate, comm);
    	}
		}%>

<table class="table table-hover" id="tab">
        <thead>
        <tr>
            <th>Thread Number</th>
            <th>Thread Header</th>
            <th>Created By</th>
            <th>Description</th>
            <th>Created On</th>
       </tr>
       </thead>
       <%
       
       
       	List<Comment> com = dao.findCommentbyChild(comm);
        	if(com == null)
        	{
        	System.out.println("inside if");%>
        <h2> No Content Found</h2>
        	<%}
        	else
        	{
        		System.out.println("inside else");
        	for (Comment c: com)
        		{%>
        <tbody>
        <tr> 
        <td>
        <%=c.getCommentid()%>
        </td><td>
      	<%=c.getCommheader()%>
        </td><td>
	    <%=c.getUsername()%>
        </td><td>
		<%=c.getCommdesc() %>
        </td><td>
	    <%=c.getCommdte()%>
        </td> </tr> <%} }%>   
     </tbody>
   </table>
   
   
    
<br>
<br>
		
<div class="form-group" id="form1">

	<form action="CommentThread.jsp">
	
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
		<button type="submit" class="btn btn-info" id="submit" name="action" value="create">Add Comment</button>
		</div>
	
	</div>
	</form>
</div>
</div>
	</div>
</div>
</body>
<div id="footer" >
 
			<ul class="footer_menu" id="formdiv123">
			<li><a href="SellProperty.jsp" id="sellHm" class="nav_footer" style="weight:bold"> <b>Post Ad </b></a></li>
			<li><a href="UpdateUser.jsp" id="buyHm" class="nav_footer" style="weight:bold"> <b> Maintain Profile </b> </a></li>
			<li><a href="DisplayHistory.jsp" id="rentHm" class="nav_footer" style="weight:bold"><b> History</b></a></li>
			<li><a href="MyProperties.jsp" id="myproperty" class="nav_footer" style="weight:bold"><b> Favourites</b></a></li>
			<li><a href="Interested.jsp" id="interested" class="nav_footer" style="weight:bold"><b> Interested</b></a></li>
			<li><a href="AllProperties.jsp" id="interested" class="nav_footer" style="weight:bold"><b> All Properties</b></a></li>
			</ul>
</div> 
</html>	