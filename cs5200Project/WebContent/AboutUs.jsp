<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Contact Us</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<link href="resource\js\jquery-1.11.2.min.js" rel="js"/>

<!-- CSS FOR CONTACT US -->

<!-- CSS FILE LINK AND JS FILE LINK FOR THE SLIDER -->
    <link href="resource\css\js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="resource\js\js-image-slider.js" type="text/javascript"></script>
 <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    
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
							<li><a href=#>About Us </a></li>
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

			
<!--  IMAGE SLIDER IN ARAMBH -->
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

	
<!--  Displaying list of Customers -->
	<div class="container">
	<h1>Contact Us:</h1>
    <h2>Our mailing address:</h2><br><h3> <a href = "mailto:roop@husky.neu.edu"/> roop@husky.neu.edu<br>
    133 Peterbourgh, Boston,<br>MA - 02215<br>
    In case of queries: support@aarambh.com<br></h3>
    </div>
<br>
<br>

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