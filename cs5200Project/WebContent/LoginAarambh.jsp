<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.Date.*" import= "edu.neu.aarambh.classes.*" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.*" import="edu.neu.aarambh.servelets.Webhitter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<title>Aarambh - Login</title>

<link href="resource\css\star.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<!-- CSS FILE LINK AND JS FILE LINK FOR THE SLIDER -->
    <link href="resource\css\js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="resource\js\js-image-slider.js" type="text/javascript"></script>
    

 <!-- SCRIPT FOR MAPS RENDERING  -->
<script>

var userName= localStorage.getItem("userName");


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
    	 
    	 localStorage.clear();
    	 var userName= localStorage.getItem("userName");
    	 location.reload();
    	 
}
     


//window.onload = loadScript();

// VISIBILITY OF LINKS

jQuery(document).ready(function() 
{
	if(userName != null)
	{	
		alert(username);
		document.getElementById("formdiv").style.visibility = 'visible';
		jQuery('#formdiv').show();		
	}
	else
	{
		document.getElementById("formdiv").style.visibility = 'hidden';
	jQuery('#formdiv').hide();
	}
    	 
    	 
$("#sfl").hide();
$("#min").hide();
$("#max").hide();
$("#select").change(function(event) 
		{
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

//
function abc()
{
   
	alert(document.getElementById("pol").innerHTML);
    	
}
</script>
</head>

<body>

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
							<!-- <li><a href="#RentingHomes">Renting Homes</a></li> -->
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Customers</a></li>
							<li><a href="ContactUs.jsp">Contact</a></li>
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

			
<!--  IMAGE SLIDER IN ARAMBH -->
			<br>
		
			<div class="div1" style="width: 100%; height: 450px">
				<div id="slider">
				<a href="" target="_blank">
				<img src="resource/img/img1.jpg" alt="" /></a>
				<a class="lazyImage" href="resource/img/img2.jpg" title="">t</a>
				<b data-src="resource/img/img3.jpg">Slider</b>
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
        	
        	<div class="form_row">
			       
        	<select class="form-control" id="listing" name = "combolisting"  onchange="setVisibility()">
        	<option>buy</option>
        	<option>let</option>
        	<option>share</option>
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
		  <div id="map" style="width: 600px; height: 450px;"></div>
  
  
  <script>
  <% 
  
	 DAOProperty formap = new DAOProperty();
	 List<Property> proplist = new  ArrayList<Property>();
	 String inpfield;
	 List<Integer> myList = new ArrayList<Integer>();
	 DAOLocation ld = new DAOLocation();
	 Location loki = new Location();
	 if((request.getParameter("inp")) == null)
	 {
		 inpfield = "London";
		 myList.add(0, 2);
		 myList.add(1, 69);
		 myList.add(2, 104);
		 myList.add(3, 145);
		 myList.add(4, 194);
		 
	 }
	 else
	 {
	 	proplist = formap.findPropertybyCity(request.getParameter("inp"));
	 	for( int i = 0 ; i < 11; i++)
	 	{
		 Property singleprop = proplist.get(i);
		 myList.add(i, singleprop.getLocationid());
		 //System.out.println(ld.findLocationbyLocationId(i).getLocname());
	 }
	 }
	 %>
  
    // Define your locations: HTML content for the info window, latitude, longitude
    var locations = [ 
      [ '<%= ld.findLocationbyLocationId(myList.get(0)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(0)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(0)).getLongitude() %>],
      [ '<%= ld.findLocationbyLocationId(myList.get(1)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(1)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(1)).getLongitude() %>],
      [ '<%= ld.findLocationbyLocationId(myList.get(2)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(2)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(2)).getLongitude() %>],
      [ '<%= ld.findLocationbyLocationId(myList.get(3)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(3)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(3)).getLongitude() %>],
      [ '<%= ld.findLocationbyLocationId(myList.get(4)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(4)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(4)).getLongitude() %>],
      ];
    
    // Setup the different icons and shadows
    var iconURLPrefix = 'http://maps.google.com/mapfiles/ms/icons/';
    
    var icons = [
      'http://localhost:8090/Aarambh/resource/img/home4.png',
      iconURLPrefix + 'green-dot.png',
      iconURLPrefix + 'blue-dot.png',
      iconURLPrefix + 'orange-dot.png',
      iconURLPrefix + 'purple-dot.png',
      iconURLPrefix + 'pink-dot.png',      
      iconURLPrefix + 'yellow-dot.png'
    ]
    var iconsLength = icons.length;

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 7,
      center: new google.maps.LatLng(-37.92, 151.25),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false,
      streetViewControl: true,
      panControl: true,
      zoomControlOptions: {
         position: google.maps.ControlPosition.RIGHT_TOP
      }
    });

    var infowindow = new google.maps.InfoWindow({
      maxWidth: 160
    });

    var markers = new Array();
    
    var iconCounter = 0;
    
    // Add the markers and infowindows to the map
    for (var i = 0; i < locations.length; i++) {  
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        icon: icons[iconCounter]
      });

      markers.push(marker);

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
      
      iconCounter++;
      // We only have a limited number of possible icon colors, so we may have to restart the counter
      if(iconCounter >= iconsLength) {
      	iconCounter = 0;
      }
    }

    function autoCenter() {
      //  Create a new viewpoint bound
      var bounds = new google.maps.LatLngBounds();
      //  Go through each...
      for (var i = 0; i < markers.length; i++) {  
				bounds.extend(markers[i].position);
      }
      //  Fit these bounds to the map
      map.fitBounds(bounds);
    }
    autoCenter();
  </script> 
		
		
		
		
		
		
  	<!--  	<div class="span8" id="mapld"> 
  		</div> -->
  		
  		
  		
	</div>	
	
	<br>
	<br>
	
  <div id="well">

   <h1> APARTMENTS LIST</h1>
   <br>
   
   
 
   <% 
   
   	DAOProperty dao = new DAOProperty();
	String st = request.getParameter("action");
	String combo = request.getParameter("combo");
	String listing_type = request.getParameter("combolisting");
	//System.out.println(combo);
	 Webhitter  web = new Webhitter();
	 DAOProperty propDAO = new DAOProperty();
	 List<Property> prop = new  ArrayList<Property>();
   if ("create".equals (st))
   {
	   
	   String name;
  		try {
  			session.getAttribute("currentSessionUser").toString();
  			name = session.getAttribute("currentSessionUser").toString();
  		}
  		catch(NullPointerException e)
  		{
  			name = "";
  		}
  	   java.util.Date utilDate = new java.util.Date();
	   java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
      DAOHistory historydao = new DAOHistory();
      String desc = name + " Searched for property in " + request.getParameter("inp");
      if (name.isEmpty())
      {
    	  
      }
      else
      {
    	  historydao.insertNewHistory( name , sqlDate, 0, 0, 1, desc);
      }  
	 switch (combo)
	 {
	 case "WebCity" :
		 prop =  web.searchResults(request.getParameter("inp"), request.getParameter("combolisting"));
	 	break;
	 case "State":
		 prop =   propDAO.findPropertybyState(request.getParameter("inp"));
	 	break;
	 case "City" :
		prop =   propDAO.findPropertybyCityandType(request.getParameter("inp"),request.getParameter("combolisting"));
	 	break;
	 case "Zip" :
	 	prop = propDAO.findPropertybyZip(request.getParameter("inp"));
	 	break;
	 case "Price" :
	 	prop = propDAO.findPropertybyPrice(Integer.parseInt(request.getParameter("maxprice")), Integer.parseInt(request.getParameter("minprice")));
	 	break;
	 case "Amenity" :
		 prop = propDAO.findPropertybyAmenityId(Integer.parseInt(request.getParameter("inp")));
		 break;
	 default: System.out.println("default hit");
	 }
	
	 //List<Property> prop =   propDAO.findPropertybyCity("London");  //web.searchResults(txtfield);
 	if ( prop.isEmpty())
 	{
 		%> <h1> NO DATA </h1><%
 	}
 	else
 	{
 	%>
 	<table class="table table-hover">   
 	<thead>
 	<tr>
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
 			<b>Type</b>
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
 	</thead>
 	<tbody>
 	<%
    for (Property property : prop)
   		{%>
	   <tr><td>
	   		<div class="row">
  					  <div class="col-sm-6 col-md-4">
    					<div class="thumbnail" style= "width:90px; align:right">
     						<img src = <%=property.getUrl()%> alt="Smiley face" height="40" width="40" > 
     						  </div>
 							 </div>
							</div>
	   					</td>
				<td><%=property.getAddress()%>		</td>
				<td><%=property.getCity()%>			</td>
				<td><a href="Comments.jsp?propertyid=<%=property.getPropertyid()%>">
        		<%=property.getPropertyname()%></a>
        				</td>
				<td><%=property.getPropertytype()%>	</td>
				<td><%=property.getState()%>		</td>
				<td><%=property.getZip()%>			</td>
				<td><%=property.getPrice()%>		</td>
			</tr>
	   <%} } } %>
  </tbody>
  </table>
  </div>
   <br>
  <div id="footer">
			<ul class="footer_menu">
				<li><a href="#" class="nav_footer"> Home </a></li>
				<li><a href="SellProperty.jsp" class="nav_footer"> Post Property Ad </a></li>
				<li><a href="AllProperty.jsp" class="nav_footer"> Our Properties </a></li>
				<li><a href="AllLocation.jsp" class="nav_footer"> Our Location </a></li>
				<li><a href="ContactUs.jsp" class="nav_footer"> Contact </a></li>
			</ul>
		</div>
  </div>	
</div>
</body>
</html>