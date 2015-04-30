<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "edu.neu.aarambh.DAO.*" import= "edu.neu.aarambh.classes.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Property</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\admin.css" rel="stylesheet"/>
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link href="resource\css\style.css" rel="stylesheet"/>

<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>

<script>
function validate()
{
	  
	var pname = document.getElementById("propName").value;
	var ptype = document.getElementById("propType").value;
	var add= document.getElementById("address").value;
	var sta = document.getElementById("state").value;
	var zip = document.getElementById("zip").value;
	var price = document.getElementById("price").value;
	var url = document.getElementById("url").value;
	
	if (pname == null || ptype == null || add == null || sta == null || zip == null || price == null || url == null)
	{
		alert("All fields Mandatory");
		return false;
	}
	else
	{
		alert("Property Sucessfully Added");
		return true;
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
							<li><a href="LoginAarambh.jsp">Home</a>
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
		
		

		<div class="well">

      		<form id="signup" class="form-horizontal"  action="SellProperty.jsp" onsubmit="validate()">
        	<legend><b>POST PROPERTY DETAILS</b></legend>
        
        		<div class="control-group">
        			<label class="control-label">Property Name</label>
        				<div class="controls">
        					<div class="input-prepend">
        						<span class="add-on"><i class="icon-envelope"></i></span>
        						<input type="text" class="input-xlarge" id="propName" name="propName" placeholder="Name">
        					</div>																																																																																																																																												
        				</div>
        		</div>
        
             
        <div class="control-group">
        	<label class="control-label">Rent/Share/Buy</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-lock"></i></span>
        					<input type="text" id="propType" class="input-xlarge" name="propType" placeholder="Household/Commercial">
        			</div>
        		</div>
        </div>

            <div class="control-group">
        	<label class="control-label">Address</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="address" name="address" placeholder="Flat/Street">
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">Location Name</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="locname" name="locname" placeholder="Location Name">
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">City</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="city" name="city" placeholder="City">
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">State</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="state" name="state" placeholder="State">
        			</div>
        		</div>
        </div>

        <div class="control-group ">
        	<label class="control-label">Zip</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="zip" name="zip" placeholder="Zip">
        			</div>
        		</div>
        </div>
        
        <div class="control-group ">
        	<label class="control-label">Country</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="country" name="country" placeholder="Country">
        			</div>
        		</div>
        </div>
        

        <div class="control-group">
        	<label class="control-label">Price</label>
        		<div class="controls">
        			<div class="input-prepend">
        				<span class="add-on"><i class="icon-user"></i></span>
        				<input type="text" class="input-xlarge" id="price" name="price" placeholder="Expected Price">
        			</div>
        		</div>
        </div>
        
        <div class="control-group">
        	<label class="control-label">Images Url</label>
        		<div class="controls">
        			<div class="input-prepend">
        					<span class="add-on"><i class="icon-lock"></i></span>
        					<input type="text" id="url" class="input-xlarge" name="url" placeholder="Image Url">
        			</div>
        		</div>
       </div>
        

 
        <div class="control-group">
        	<label class="control-label"></label>
        		<div class="controls">
        			<button type="submit" class="btn btn-success" name="action" value="create">Post Ad</button>
        		</div>
        </div>
        
		</form>
		</div>
	<% DAOProperty dao = new DAOProperty();
	String st = request.getParameter("action");
	if ("create".equals (st))
	   {
		   DAOLocation location = new DAOLocation();
		   if (location.findLocationbyName(request.getParameter("locname").toString()).isEmpty())
		   {
			   int locationid = location.insertNewLocation(request.getParameter("locname"),request.getParameter("address"), 0.0, 0.0, request.getParameter("city"), request.getParameter("state"), request.getParameter("zip"));
			   int id = dao.insertNewProperty (request.getParameter("propName"), locationid, request.getParameter("propType"), 2, request.getParameter("address"), request.getParameter("city"), request.getParameter("state"), request.getParameter("zip"), Integer.parseInt(request.getParameter("price")), request.getParameter("url"), "guiid");
			   DAOShortlist shortlist = new DAOShortlist();
		       shortlist.insertNewShortlist(session.getAttribute("currentSessionUser").toString(), id);
		   }
       
}%>
	</div>
</div>


</body>
<div id="footer" >
 
			<ul class="footer_menu" id="formdiv123">
			<li><a href=# id="sellHm" class="nav_footer" style="weight:bold"> <b>Post Ad </b></a></li>
			<li><a href="UpdateUser.jsp" id="buyHm" class="nav_footer" style="weight:bold"> <b> Maintain Profile </b> </a></li>
			<li><a href="DisplayHistory.jsp" id="rentHm" class="nav_footer" style="weight:bold"><b> History</b></a></li>
			<li><a href="MyProperties.jsp" id="myproperty" class="nav_footer" style="weight:bold"><b> Favourites</b></a></li>
			<li><a href="Interested.jsp" id="interested" class="nav_footer" style="weight:bold"><b> Interested</b></a></li>
			<li><a href="AllProperties.jsp" id="interested" class="nav_footer" style="weight:bold"><b> All Properties</b></a></li>
			</ul>
</div> 
</html>