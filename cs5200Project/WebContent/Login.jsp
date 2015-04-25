<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "edu.neu.aarambh.DAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Renting - Made Easy</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="resource\css\style.css" />
<link rel="stylesheet" type="text/css" href="resource\css\admin.css" />
<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<script type='text/javascript' src="resource\js\jquery-1.11.2.min.js"></script>


<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>

<script>
jQuery(document).ready(function($){});

<%-- function clickHere()
{
 var userName = jQuery("#username").val();
 var password = $("password").val();
 
 if(userName == "" || password == "")
 { 
	alert("Please enter a valid Username or Password");
	window.open("login.jsp",_self);
 }
 else
 {
  <% DAOUser d = new DAOUser();
  	d.findUser(%> userName <% , %> password <%);
  %> 
 }
} --%>
</script>
</head>
<body>

<div id="main_container">
<div class="container">
  <div id="header">
    <div id="logo"> <img src="resource/img/logo.gif" width="147" height="78" alt="" border="0" /> </div>
    <div class="banner_adds"></div>
    <div class="menu">
      <ul>
        <li><a href="LoginAarambh.jsp" target="_self">Home</a></li>
        <li><a href="Signup.jsp" target="_self">SignUp </a></li>
      </ul>
    </div>
   </div>
  
  <div class="well">

      <form id="signup" class="form-horizontal" method="post" action="Login">
        <legend>Sign Up</legend>
        
        <div class="control-group">
        <label class="control-label">Username</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span>
        <input type="text" class="input-xlarge" id="username" name="username" placeholder="Username">
        </div></div></div>
        
             
        <div class="control-group">
        <label class="control-label">Password</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-lock"></i></span>
        <input type="password" id="password" class="input-xlarge" name="password" placeholder="Password">
        </div></div></div>

      
        <div class="control-group">
        <label class="control-label"></label>
        <div class="controls">
        <button type="submit" class="btn btn-success" onClick = "Login" >Login</button>
        </div></div>
        
</form>
</div></div>
<!-- end of main_content -->
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