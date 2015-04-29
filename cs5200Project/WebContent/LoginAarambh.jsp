<%@page import="edu.neu.aarambh.servelets.Webhitter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="edu.neu.aarambh.classes.*" import="java.sql.Date.*" import= "edu.neu.aarambh.classes.User" import="edu.neu.aarambh.classes.Property" import="edu.neu.aarambh.DAO.*" import="edu.neu.aarambh.servelets.Webhitter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<title>Aarambh - Login</title>

<!--  LINKING CSS FILES AND JS FILES -->

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

<!-- SCRIPT AND CSS FOR THE NEW TABLE FAVOURITES -->
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<!-- script for AJAX mapping over URL -->
<script>
        $(document).ready(function() {

                $('.ajax-link').click(function() {
                       // $('.page-content').hide();
                        var category = $(this).attr("data-category");
                       // the URL for the request
                        $.get('ajaxAction', {
                                // Parameter to be sent to server side
                                category : category
                        });
                });
        });
</script>



<script type="text/javascript">
$(document).ready(function() {
 $("#tablediv").hide();
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
	}+
     $("#showTable").click(function(event)
    	{
           $.get('PopulateTable',function(responseJson) 
        	{
             	if(responseJson!=null)
             	{
                $("#countrytable").find("tr:gt(0)").remove();
                var table1 = $("#countrytable");
                	$.each(responseJson, function(key,value)
                	{
                     var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                     rowNew.children().eq(0).text(value['code']);
                     rowNew.children().eq(1).text(value['name']);
                     rowNew.children().eq(2).text(value['continent']);
                     rowNew.children().eq(3).text(value['region']);
                     rowNew.children().eq(4).text(value['population']);
                     rowNew.children().eq(5).text(value['capital']);
                     rowNew.appendTo(table1);
               		 });
                }
              });           $("#tablediv").show();         
  });     
});
</script>

<!-- CSS FILE LINK AND JS FILE LINK FOR THE SLIDER -->
    <link href="resource\css\js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="resource\js\js-image-slider.js" type="text/javascript"></script>
    

 <!-- SCRIPT FOR VISIBILITY SETTING  -->
<script>


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
     

// VISIBILITY OF LINKS

jQuery(document).ready(function() 
{
$("#sfl").hide();
$("#min").hide();
$("#max").hide();
$("#select").change(function(event) 
		{
        var selval=$("#select option:selected").text();
                    
        if(selval === "WebCity" ||selval === "City" ||selval === "State" ||selval === "Zip" ||selval === "Amenity")
        {
          	$("#sfl").show();
        }
        else if(selval === "Price")
        {
            $("#min").show();
            $("#max").show();
        }
        else if(selval === "Select")
        {
        	$("#sfl").hide();
        	$("#min").hide();
        	$("#max").hide();
        }
   });
});

// -------------------------------TBD---------------
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
							<li id="login"><a href="login.jsp" target="_self">Login</a></li>
							<li><a href="AboutUs.jsp">About Us </a></li>
							<li><a href="Customers.jsp">Customers</a></li>
							<li><a href="ContactUs.jsp">Contact</a></li>
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
			<br>
			<br>
			
			<div id = "formdiv123" style="display:none;float: right; padding: 10px 25px 0 0;">
			<a href="SellProperty.jsp" id="sellHm" class="nav_footer"> <b>Post Property Ad </b></a>
			<a href="UpdateUser.jsp" id="buyHm" class="nav_footer"> <b> Update Profile </b> </a>
			<a href="DisplayHistory.jsp" id="rentHm" class="nav_footer"><b> Display History</b></a>
			<a href="MyProperties.jsp" id="myproperty" class="nav_footer"><b> My properties</b></a>
			<a href="Interested.jsp" id="interested" class="nav_footer"><b> Interested</b></a>
			</div> 
	
		</div>
		</form>
  		</div>
 
<!-- CREATING MAPS IN AARAMBH -->
		  <div id="map" style="width: 600px; height: 450px;"></div>
  
	
	</div>	
	
	<br>
	<br>
	
  <div id="well">
	<div id = "apthead" style= "margin:0 auto">
   	<h1> APARTMENTS LIST</h1>
   	</div>
   <br>
   <%   
   DAOShortlist daoshortlist = new DAOShortlist();
   	DAOProperty dao = new DAOProperty();
	String st = request.getParameter("action");
	String combo = request.getParameter("combo");
	String listing_type = request.getParameter("combolisting");
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
    	  historydao.insertNewHistory(name , sqlDate, 0, 0, 1, desc);
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
 	<!-- 	<td>
 		<b>Shortlist</b>
 		</td>  -->
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
     		<img src = <%=property.getUrl()%> alt="Smiley face" height="40" width="40"> 
     		</div>
 			</div>
			</div>
	   		</td>
			
			<td><%=property.getAddress()%></td>
			<td><%=property.getCity()%></td>
			<td>
			<%if(session.getAttribute("currentSessionUser") != null)
				{%>
			<a href="Comments.jsp?propertyid=<%=property.getPropertyid()%>">
        	<%=property.getPropertyname()%></a>
        	<%} 
        	  else
        	  {%><%=property.getPropertyname()%>
        	<%} %>
        	</td>
		 	<td><%=property.getPropertytype()%>	</td>
			<td><%=property.getState()%>		</td>
			<td><%=property.getZip()%>			</td>
			<td><%=property.getPrice()%>		</td>
			<%-- <td><a href="#" class="ajax-link" data-category= <%= property.getPropertyid() %>>SHORTLIST</a> --%>
			<td>
			
<div class="list-group">
    <a href="#" class="ajax-link active" data-category= <%= property.getPropertyid() %> SHORLIST/>
        <span class="glyphicon glyphicon-file"></span> SHORLISTED <span class="badge"><%= daoshortlist.countbyPropertyid(property.getPropertyid()) %></span>
   
</div>
			</td>
			 <!--	<td><input type="button" onClick="test2()" value="Show Table" id="showTable"/>
				</td>  -->
			</tr>
	   <%} } } %>
  </tbody>
  </table>
    <script>
 
  <% 
  
	 DAOProperty formap = new DAOProperty();
	 List<Property> proplist = new  ArrayList<Property>();
	 String inpfield;
	 List<Integer> myList = new ArrayList<Integer>();
	 DAOLocation ld = new DAOLocation();
	 Location loki = new Location();
	 if((request.getParameter("inp")) == null || (formap.findPropertybyCity(request.getParameter("inp")).size() < 5) )
	 {
		 
		 myList.add(0, 2);
		 myList.add(1, 69);
		 myList.add(2, 104);
		 myList.add(3, 145);
		 myList.add(4, 194);
		 
	 }
	 else
	 {
	 	proplist = formap.findPropertybyCity(request.getParameter("inp"));
	 	for( int i = 0 ; i < 10; i++)
	 	{
		 Property singleprop = proplist.get(i);
		 myList.add(i, singleprop.getLocationid());
		 //System.out.println(ld.findLocationbyLocationId(i).getLocname());
	 }
	 }
	 %>

 // Define your locations: HTML content for the info window, latitude, longitude
 $("#apthead").show();
	 var locations = [ 
   [ '<%= ld.findLocationbyLocationId(myList.get(0)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(0)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(0)).getLongitude() %>],
   [ '<%= ld.findLocationbyLocationId(myList.get(1)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(1)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(1)).getLongitude() %>],
   [ '<%= ld.findLocationbyLocationId(myList.get(2)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(2)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(2)).getLongitude() %>],
   [ '<%= ld.findLocationbyLocationId(myList.get(3)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(3)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(3)).getLongitude() %>],
   [ '<%= ld.findLocationbyLocationId(myList.get(4)).getLocname() %>' , <%= ld.findLocationbyLocationId(myList.get(4)).getLatitude() %>, <%= ld.findLocationbyLocationId(myList.get(4)).getLongitude() %>],
   ];  
 

//-------------------------------------------------------------------------------------------------
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
    
    // Add the markers and info windows to the map
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
      // Limited icons so reiterate
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
    
//---------------------------------------------------------------------------------------------    
    // AJAX FUNCTION CALLS
    
    function test2( id){
    	jQuery.ajax({
    		type:get,
    		url: b
    	});
    }
  </script> 
	
  <!--
 <div id="tablediv">
<table cellspacing="0" id="countrytable">
    <tr>
        <th scope="col">Code</th>
        <th scope="col">Name</th>
        <th scope="col">Continent</th>
        <th scope="col">Region</th>
        <th scope="col">Population</th>
        <th scope="col">Capital</th>         
    </tr> </table> </div> -->
  	  </div>
   	  <br>
 	  <br>
  
</div>	
</div>
</body>
 <div id="footer">
			<ul class="footer_menu">
				<li><a href="#" class="nav_footer" style="weight:bold"> Home </a></li>
				<li><a href="SellProperty.jsp" class="nav_footer" style="weight:bold"> Post Property Ad </a></li>
				<li><a href="AllProperty.jsp" class="nav_footer" style="weight:bold"> Our Properties </a></li>
				<li><a href="AllLocation.jsp" class="nav_footer" style="weight:bold"> Our Location </a></li>
				<li><a href="#" class="nav_footer" style="weight:bold"> Contact </a></li>
			</ul>
</div>
</html>