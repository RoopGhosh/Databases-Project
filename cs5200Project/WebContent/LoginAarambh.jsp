<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.DAOProperty" import="edu.neu.aarambh.servelets.Webhitter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<title>Aarambh - Login</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<!-- CSS FILE LINK AND JS FILE LINK FOR THE SLIDER -->
    <link href="resource\css\js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="resource\js\js-image-slider.js" type="text/javascript"></script>
    
 <!-- -->
 
 <!-- SCRIPT FOR MAPS RENDERING  -->
<script>

var userName= localStorage.getItem("userName");


// MAP RENDERING SCRIPT

function initialize() {
	var myLatlng = new google.maps.LatLng(53.5500,2.4333);
	var mapOptions = {
    zoom: 4,
    center: myLatlng
  };

  var map = new google.maps.Map(document.getElementById('mapld'),
      mapOptions);

//To add the marker to the map, use the 'map' property
  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title:"Current Location"
  });
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);
}

     function toggleBounce() {

	  if (marker.getAnimation() != null) {
	    marker.setAnimation(null);
	  } else {
	    marker.setAnimation(google.maps.Animation.BOUNCE);
	  }
	}
 

window.onload = loadScript;



// - > SEARCH VISIBILITY

     function setVisibility()
     {
    	
     	if(document.getElementById('select').value == 'Price')
     		{
     			document.getElementById('inp').style.display = 'NONE';
     			document.getElementById('minprice').style.display = 'block';
     			document.getElementById('maxprice').style.display = 'block';
     		}
     	else
     		{
	     		document.getElementById('inp').style.display = 'block';
	 			document.getElementById('minprice').style.display = 'NONE';
	 			document.getElementById('maxprice').style.display = 'NONE';
     		}
     		
     }
     function logOutUser()
     {
    	 alert("Log Out");
    	 localStorage.clear();
    	 var userName= localStorage.getItem("userName");
    	 alert("after logout"+userName);
    	 location.reload();
     }
     


		window.onload = loadScript();

// Comment

     jQuery(document).ready(function() {
    	 if(userName != null)
    		{
    			jQuery('#formdiv').show();
    		
    		}
    	else
    		{
    		jQuery('#formdiv').hide();
    		}
    	 
    	 
    	 $("#sfl").hide();
    	 $("#min").hide();
    	 $("#max").hide();
         $("#select").change(function(event) {
        	 
                    var selval=$("#select option:selected").text();
                    
             	    if(selval === "City" ||selval === "State" ||selval === "Zip" ||selval === "Aminity")
             	    {
             	    	$("#sfl").show();
             	    	
             	    	
             	    }
             	    else if(selval === "Price")
             	    {
             	    	$("#min").show();
             	    	$("#max").show();
             	    }         
            });
         });

    // </script>
</head>
<body>


	<script>

// FOR REFRESHING THE EMBEDDED PAGE ON TIME INTERVALS 
	//$(function(){
     //   $('#mapld').load('http://www.somesitehere.com');
    //});
	
	// TO RENDER MAP ON CLICK OF SEARCH
	//$(document). ready(function(){
	//	$('#submit'). click(function(){
	//	$('#mapld'). load ("maps.html");
	//	});
	//	});

	</script>

<style type="text/css">
div#mapld {
	width: 62%;
	height:350px;
}
</style>


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
							<li><a href="">Home</a>
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
							<li style="font:16px; weight:bold; color:white"><script>if(localStorage.getItem("userName") != null)
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
				<a class="lazyImage" href="resource/img/img2.jpg" title="">t</a>
				<b data-src="resource/img/img3.jpg">Slider</b></a>
				<a class="lazyImage" href="resource/img/img4.jpg" title="">Slide</a>
				<a class="lazyImage" href="resource/img/img5.jpg" title=""></a>
				</div>
			</div>
			<br>	

<!-- CREATING SEARCH TAB IN ARAMBH -->
	<div class="row"> 
	
	<div class="span4">
		
		<div class="box_title">
		<div class="active"><h3>Find your Apartment</h3></div>
		</div>
		
		<form action="LoginAarambh.jsp"> 
		<div class="form" style="width:100%">	
        
		 	<div class="form_row">
			       
        	<select class="form-control" id="select" name = "combo"  onchange="setVisibility()">
        	<option>Select</option>
        	<option>WebCity</option>
        	<option>State</option>
        	<option>Zip</option>
        	<option>Price</option>
        	<option>Amenity</option>
        	<option>City</option>
        	</select>
        	</div>
        	
			<div class="form_row" id="sfl">
			
			<label class="left"><b>&nbsp;</b> </label>
			
			 <input type="text"
			class="form_input" id="inp" name="inp" placeholder="Enter Value"/>
			
			</div>
						
			<div class="form_row" id="min">
			
			<label class="left"><b>&nbsp;</b></label> <input type="text"
			class="form_input"  id="minprice" name="minprice" placeholder="minimum price"/>
			
			</div>
			
			<div class="form_row" id="max">
			<label class="left"><b>&nbsp;</b></label> <input type="text"
			class="form_input" id="maxprice" name="maxprice" placeholder="max price"/>
			</div>
			
			<div class="form_row">
			<div style="float: right; padding: 10px 25px 0 0;">
			<button type="submit" class="btn btn-info" id="submit" name="action" value="create">Search</button>
			</div>
			</div>
			
			<br>
			<br>
			
			<div id = "formdiv" style="display:none;float: right; padding: 10px 25px 0 0;">
			<a href="#" id="sellHm" class="nav_footer"> Selling Homes </a>
			<a href="#" id="buyHm" class="nav_footer"> Buying Homes </a>
			<a href="#" id= "rentHm" class="nav_footer"> Renting Homes</a>
			</div> 
		</div>
		</form>
  		</div>
 
<!-- CREATING MAPS IN AARAMBH -->
		
  		<div class="span8" id="mapld">
  		</div>
	</div>	
	
	<br>
	<br>
	
  <div id="well">

   <h1> APARTMENTS LIST</h1>
   <br>
   
  <table class="table table-striped">   
   <% 
   DAOProperty dao = new DAOProperty();
	String st = request.getParameter("action");
	String st1 = request.getParameter("inp");
	String st2 = request.getParameter("combo");
	String city = "City";
   if ("create".equals (st))
   {
	
	   Webhitter  web = new Webhitter();
 	List<Property> prop = web.searchResults(st1);
 	
    for (Property property : prop)
   		{%>
	   <tr>
				<td><%=property.getAddress()%>		</td>
				<td><%=property.getCity()%>			</td>
				<td><%=property.getPropertyname()%>	</td>
				<td><%=property.getPropertytype()%>	</td>
				<td><%=property.getState()%>		</td>
				<td><%=property.getZip()%>			</td>
				<td><%=property.getGuiid()%>		</td>
			</tr>
	   <%
   		}
   }  %>
  </table>
  </div>
  
  <br>
  <div id="footer">
			<ul class="footer_menu">
				<li><a href="#" class="nav_footer"> Home </a></li>
				<li><a href="#" class="nav_footer"> RSS </a></li>
				<li><a href="#" class="nav_footer"> Contact </a></li>
			</ul>
		</div>
  </div>	
</div>
</body>
</html>