<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<title>Aarambh - Login</title>

<link href="boot\css\bootstrap.css" rel="stylesheet"/>
<link href="boot\css\bootstrap.min.css" rel="stylesheet"/>
<link href="boot\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="boot\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="boot\css\style.css" rel="stylesheet"/>
<link href="boot\js\bootstrap.js" rel="js"/>
<link href="boot\js\bootstrap.min.js" rel="js"/>
<link href="boot\js\jquery-1.11.2.min.js" rel="js"/>

<!-- CSS FILE LINK AND JS FILE LINK FOR THE SLIDER -->
    <link href="boot\js\js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="boot\js\js-image-slider.js" type="text/javascript"></script>
    
 <!-- -->
 
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

<!-- SCRIPT FOR MAPS RENDERING  -->
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
    
<!-- SCRIPT FOR THE LOAD SELECTION BASED ON SELECT -->
<script>

     $(document).ready(function() {
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

     </script>
</head>
<body>
<!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>-->


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
		<br>
		
			<div class="div1" style="width: 100%; height: 450px">
				<div id="slider">
				<a href="" target="_blank">
				<img src="boot/Images/img1.jpg" alt="" /></a>
				<a class="lazyImage" href="boot/Images/img2.jpg" title="">t</a>
				<b data-src="boot/Images/img3.jpg">Slider</b></a>
				<a class="lazyImage" href="boot/Images/img4.jpg" title="">Slide</a>
				<a class="lazyImage" href="boot/Images/img5.jpg" title=""></a>
				</div>
			</div>
<br>

<!-- CREATING SEARCH TAB IN ARAMBH -->
	<div class="row"> 
	
	<div class="span4">
		
		<div class="box_title">
		<div class="active"><h3>Find your Apartment</h3></div>
		</div>
		
		<div class="form">	
        
        	<div class="form_row">
			<span class="add-on"><i class="icon-search"></i></span>        
        	<select class="form-control" id="select">
        	<option>Select</option>
        	<option>City</option>
        	<option>State</option>
        	<option>Zip</option>
        	<option>Price</option>
        	<option>Amenity</option>
        	</select>
        	</div>
        	
			<div class="form_row" id="sfl">
			<span class="add-on"><i class="icon-home"></i></span>
			<label class="left"><b>Key</b> </label> <input type="text"
			class="form_input" id="inp" name="inp" placeholder="Enter Value"/>
			</div>
						
			<div class="form_row" id="min">
			<span class="add-on"><i class="icon-user"></i></span>
			<label class="left"><b>Min</b></label> <input type="text"
			class="form_input"  id="minprice" name="minprice" placeholder="minimum price"/>
			</div>
			
			<div class="form_row" id="max">
			<span class="add-on"><i class="icon-user"></i></span>
			<label class="left"><b>Max</b></label> <input type="text"
			class="form_input" id="maxprice" name="maxprice" placeholder="max price"/>
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
	
<!--  CREATING LIST OF APARTMENTS SEARCHED -->
	<div>
	
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