<%@page import="edu.neu.aarambh.DAO.DAOHistory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "edu.neu.aarambh.DAO.DAOUser" import= "edu.neu.aarambh.classes.User" import ="java.text.SimpleDateFormat" import= "java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update your Profile</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\admin.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>


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
							<li><a href="LoginAarambh.jsp">Home</a>
							<table>
							<tr>
							<td></td>
							</tr>
							</table>
							</li>
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Our Customers</a></li>
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




<%
DAOUser user = new DAOUser();
User u = user.getUserbyUsername(session.getAttribute("currentSessionUser").toString());%>

		<div class="well">

      		<form id="signup" class="form-horizontal" method="get" action="UpdateUser.jsp">
        	<legend>Update Profile</legend>
        <fieldset disabled>
        		<div class="control-group">
        			<label class="control-label">Username</label>
        				<div class="controls">
        					<div class="input-prepend">
        						<span class="add-on"><i class="icon-envelope"></i></span>
        						<input type="text" id="disabledTextInput" name="username" class="form-control" value=<%=session.getAttribute("currentSessionUser")%>>
        					</div>
        				</div>
        		</div>
        </fieldset>
             
        <div class="control-group">
        	<label class="control-label">Password</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-lock"></i></span>
        					<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password", value=<%= u.getPassword() %>>
        			</div>
        		</div>
        </div>

        <div class="control-group">
        	<label class="control-label">Confirm Password</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-lock"></i></span>
        				<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password", value=<%= u.getPassword() %>>
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">First Name</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="fname" name="fname" placeholder="First Name", value=<%= u.getFirstname() %>>
        			</div>
        		</div>
        </div>

        <div class="control-group ">
        	<label class="control-label">Last Name</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="lname" name="lname" placeholder="Last Name", value=<%= u.getLastname() %>>
        			</div>
        		</div>
        </div>
        
        <div class="control-group ">
        	<label class="control-label">Date Of Birth</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="date" class="input-xlarge" id="dob" name="dob" placeholder="Date Of Birth", value=<%= u.getDob() %>>
        			</div>
        		</div>
        </div>
        

        <div class="control-group">
        	<label class="control-label">Email</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-envelope"></i></span>
        				<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email", value=<%= u.getEmail() %>>
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">Phone</label>
        		<div class="controls">
        			<div class="input-prepend">
        					<span class="add-on"><i class="icon-lock"></i></span>
        					<input type="number" id="phone" class="input-xlarge" name="phone" placeholder="Mobile / Landline", value=<%= u.getPhnumber() %>>
        			</div>
        		</div>
       </div>
        

 
        <div class="control-group">
        	<label class="control-label"></label>
        		<div class="controls">
        			<button type="submit" class="btn btn-info" id="submit" name="action" value="create">Update Profile</button>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label"></label>
        		<div class="controls">
        			<button type="submit" class="btn btn-info" id="deleteuser" name="delete" value="delete">Delete Profile</button>
        		</div>
        	</div>
        
		</form>
		</div>
		
	<% 
	String st = request.getParameter("action");
	
	if ("create".equals(st))
	{
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date parsed;
		parsed = format.parse(request.getParameter("dob"));
	    java.util.Date utilDate = parsed;
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		DAOUser upuser = new DAOUser();
		java.util.Date utilNewDate = new java.util.Date();
 	  	java.sql.Date newDate = new java.sql.Date(utilNewDate.getTime());
 	  	System.out.println(session.getAttribute("currentSessionUser").toString());
 	  	System.out.println(request.getParameter("passwd"));
 	  	System.out.println(request.getParameter("lname"));
 	  	System.out.println(sqlDate);
 	  	System.out.println(Integer.parseInt(request.getParameter("phone").toString()));
		upuser.updateUser(session.getAttribute("currentSessionUser").toString(), request.getParameter("passwd"), request.getParameter("fname"), request.getParameter("lname"), sqlDate, Integer.parseInt(request.getParameter("phone").toString()), request.getParameter("email"));
		DAOHistory daohist = new DAOHistory();
		//daohist.insertNewHistory(session.getAttribute("currentSessionUser").toString(), newDate, 0, 0, 0, " Updated your profile");
	}
	
	
	if ("delete".equals(request.getParameter("delete")))
	{	DAOUser upuser1 = new DAOUser();
		System.out.println("from delete");
		String usr = session.getAttribute("currentSessionUser").toString();
		upuser1.deleteUser(usr);
		session.setAttribute("currentSessionUser", null);
		session.invalidate();
		response.sendRedirect(response.encodeRedirectURL("login.jsp"));
		
		
	}
		
		%>
	</div>
</div>
</body>
<div id="footer" >
 
			<ul class="footer_menu" id="formdiv123">
			<li><a href="SellProperty.jsp" id="sellHm" class="nav_footer" style="weight:bold"> <b>Post Ad </b></a></li>
			<li><a href=# id="buyHm" class="nav_footer" style="weight:bold"> <b> Maintain Profile </b> </a></li>
			<li><a href="DisplayHistory.jsp" id="rentHm" class="nav_footer" style="weight:bold"><b> History</b></a></li>
			<li><a href="MyProperties.jsp" id="myproperty" class="nav_footer" style="weight:bold"><b> Favourites</b></a></li>
			<li><a href="Interested.jsp" id="interested" class="nav_footer" style="weight:bold"><b> Interested</b></a></li>
			<li><a href="AllProperties.jsp" id="interested" class="nav_footer" style="weight:bold"><b> All Properties</b></a></li>
			</ul>
</div> 
</html>