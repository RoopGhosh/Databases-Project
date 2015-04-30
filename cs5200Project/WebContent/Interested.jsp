<%@page import="edu.neu.aarambh.DAO.DAOInterested"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "edu.neu.aarambh.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interested - In</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\admin.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link href="resource\js\bootstrap.min.js" rel="js"/>

<script>

function validate()
{

	var qt = document.getELementById("title").value();
	var qd = document.getELementById("desc").value();
	var minp = document.getELementById("minprice").value();
	var maxp = document.getELementById("maxprice").value();
	var loc = document.getELementById("loc").value();
	alert(qt);
	alert(qd);
	alert(minp);
	alert(maxp);
	alert(loc);
	
	if(qt == "" || qd == "" || minp == null || maxp == null || loc =="" )
	{
		alert(All Fields Mandatory);
		return false;
	}
	else
	{
		alert("Response sucessfully registered. We will get back to you asap.");
		return true;
	}
}
	
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

			<div class="span2">
        	</div>	
        	
        	<div class="span8">
				<legend>Please provide the following details and we will get back to you: &nbsp;</legend>
				<br>
				<br>
			
			<form id="interested" class="form-horizontal" action="Interested.jsp" onsubmit="return validate();">
				<%	
				String st = request.getParameter("action");
				//String user = session.getAttribute("currentSessionUser").toString();
	    		String user = "roop";
	    		
				if ("create".equals(st))
	    		{
	 	  		System.out.println(request.getParameter("title"));
	 	  		System.out.println(request.getParameter("desc"));
	 	  		System.out.println(request.getParameter("loc"));
	 	  		System.out.println(request.getParameter("minprice"));
	 	  		System.out.println(request.getParameter("maxprice"));
				DAOInterested inte = new DAOInterested();
				String qt = request.getParameter("title");
				String qd = request.getParameter("desc");
				int minp = Integer.parseInt(request.getParameter("minprice").toString());
				int maxp = Integer.parseInt(request.getParameter("maxprice").toString());
				String loc = request.getParameter("loc");
				inte.insertNewInterested(qt, qd, user, minp, maxp, loc);
	    		}
			%>
	
      		
  	        	
        		<div class="control-group">
        		<label class="control-label"><b>Username</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<span class="add-on"><i class="icon-home"></i></span>
        		<input type="text" class="input-xlarge" id="username" name="username"  value=<%=user%> placeholder="Username" disabled>
        		</div></div></div>
        		
        		<div class="control-group">
        		<label class="control-label"><b>Query Title</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<span class="add-on"><i class="icon-home"></i></span>
        		<input type="text" class="input-xlarge" id="title" name="title"  placeholder="Title">
        		</div></div></div>
        
             	<div class="control-group">
        		<label class="control-label"><b>Location</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<span class="add-on"><i class="icon-home"></i></span>
        		<input type="text" class="input-xlarge" id="loc" name="loc"  placeholder="City/State/Zip">
        		</div></div></div>
        		
        		<div class="control-group">
        		<label class="control-label"><b>Max Price</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<span class="add-on"><i class="icon-home"></i></span>
        		<input type="number" class="input-xlarge" id="maxprice" name="maxprice"  placeholder="Max">
        		</div></div></div>
        		
        		<div class="control-group">
        		<label class="control-label"><b>Min Price</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<span class="add-on"><i class="icon-home"></i></span>
        		<input type="number" class="input-xlarge" id="minprice" name="minprice"  placeholder="Min">
        		</div></div></div>
        		
        		<div class="control-group">
        		<label class="control-label"><b>Description</b></label>
        		<div class="controls">
        		<div class="input-prepend">
        		<textarea class="form-control" style="margin-left:0px" name = "desc" rows="10" id="desc" placeholder="Enter Query"></textarea>
        		</div></div></div>
 
        <div class="control-group">
        	<label class="control-label"></label>
        		<div class="controls">
        		<button type="submit" class="btn btn-success" id="submit" name="action" value="create" onclick="return validate()">Submit</button>
       		</div>
       </div>
       
       <div class="span2">
       </div>
        
	</form>
	<br>
	<br>
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
			<li><a href=#  id="interested" class="nav_footer" style="weight:bold"><b> Interested</b></a></li>
			<li><a href="AllProperties.jsp" id="interested" class="nav_footer" style="weight:bold"><b> All Properties</b></a></li>
			</ul>
</div> 
</html>