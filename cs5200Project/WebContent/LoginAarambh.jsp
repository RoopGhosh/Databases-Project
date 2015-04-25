<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

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

<script>
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

    </script>


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
							<li></li>
							<li><a href="#Contact">Contact</a></li>
						</ul>
					</div>
				</div>

			
<!--  IMAGE SLIDER IN ARAMBH -->
				<div class="hero-unit">
			    <h2> Will Contain Slider</h2>
			    <a href="#" class="btn btn-small btn-info">Slider Starts Here</a>
			    </div>

<!-- CREATING SEARCH TAB IN ARAMBH -->
	<div class="row"> 
	
	<div class="span4">
		
		<div class="box_title">
		<div class="active"><h3>Find your Apartment</h3></div>
		</div>
		
		<div class="form">	
        
			<div class="form_row">
			<label class="left"><b>Address:</b> </label> <input type="text"
			class="form_input" id="address" name="address" placeholder="address"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>City: </b></label> <input type="text"
			class="form_input" id="city" name="city" placeholder="city"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>State:</b> </label> <input type="text"
			class="form_input" id="state" name="state" placeholder="state"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>Country:</b> </label> <input type="text"
			class="form_input" id="country" name="country" placeholder="country"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>ZipCode:</b> </label> <input type="text"
			class="form_input" id="zip" name="zip" placeholder="zip"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>Price: </b></label> <input type="text"
			class="form_input"  id="minprice" name="minprice" placeholder="minimum price"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>To: </b></label> <input type="text"
			class="form_input" id="maxprice" name="maxprice" placeholder="max price"/>
			</div>
			
			<div class="form_row">
			<label class="left"><b>Rooms: </b></label> <input type="text"
			class="form_input" id="room" name="room" placeholder="no of rooms"/>
			</div>
			
				
			<div class="form_row">
			<label class="left_long"><b>Looking for:</b> </label>
			</div>
			<div class="form_row">
			<input type="radio" name="reason" id="reason"/> Sell
			</div>
			<div class="form_row">
			<input type="radio" name="reason" id="reason"/> Buy
			</div>
			<div class="form_row">
			<input type="radio" name="reason" id="reason"/> Rent
			</div>
			<div style="float: right; padding: 10px 25px 0 0;">
			<button type="submit" class="btn btn-info" id="submit">Search</button>
			</div>
		</div>
  		</div>
 
<!-- CREATING MAPS IN AARAMBH -->
		
  		<div class="span8" id="mapld">
  		<H4>map comes here</H4>
    	</div>
	</div>	
	
	<br>
	<br>
	
 	
  <div id="footer">
			<ul class="footer_menu">
				<li><a href="" class="nav_footer"> Home </a></li>
				<li><a href="" class="nav_footer"> Selling Homes </a></li>
				<li><a href="" class="nav_footer"> Buying Homes </a></li>
				<li><a href="" class="nav_footer"> Renting Homes</a></li>
				<li><a href="" class="nav_footer"> RSS </a></li>
				<li><a href="" class="nav_footer"> Contact </a></li>
			</ul>
		</div>
  </div>	
</div>
</body>
</html>