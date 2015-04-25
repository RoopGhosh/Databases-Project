<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.aarambh.DAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp for Aarambh</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>

<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
		
</head>
<body>

<script type="text/javascript">
$(document).ready(function()
{
	$("#signup").validate(
	 {
	rules:{ fname:"required",
			lname:"required",
			email:{
					required:true,
					email: true
				  },
			passwd:{
					 required:true,
					 minlength: 8
					 },

			conpasswd:{
					 	required:true,
					 	equalTo: "#passwd"
					  },
			gender:"required"},
			errorClass: "help-inline"});});
</script>	

 <div class="container">
<div class="well">

      <form id="signup" class="form-horizontal" method="get" action="SignupServelet">
        <legend>Sign Up</legend>
        
        <div class="control-group">
        <label class="control-label">Username</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span>
        <input type="text" class="input-xlarge" id="usrname" name="usrname" placeholder="Username">
        </div></div></div>
        
             
        <div class="control-group">
        <label class="control-label">Password</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-lock"></i></span>
        <input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password">
        </div></div></div>

        <div class="control-group">
        <label class="control-label">Confirm Password</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-lock"></i></span>
        <input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password">
        </div></div></div>
        
        <div class="control-group">
        <label class="control-label">First Name</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span>
        <input type="text" class="input-xlarge" id="fname" name="fname" placeholder="First Name">
        </div></div></div>

        <div class="control-group ">
        <label class="control-label">Last Name</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span>
        <input type="text" class="input-xlarge" id="lname" name="lname" placeholder="Last Name">
        </div></div></div>
        
        <div class="control-group ">
        <label class="control-label">Date Of Birth</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span>
        <input type="date" class="input-xlarge" id="dob" name="dob" placeholder="Date Of Birth">
        </div></div></div>

        <div class="control-group">
        <label class="control-label">Email</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-envelope"></i></span>
        <input type="text" class="input-xlarge" id="email" name="email" placeholder="Email">
        </div></div></div>
        
        <div class="control-group">
        <label class="control-label">Phone</label>
        <div class="controls">
        <div class="input-prepend">
        <span class="add-on"><i class="icon-lock"></i></span>
        <input type="number" id="phone" class="input-xlarge" name="phone" placeholder="Mobile / Landline">
        </div></div></div>
        

 
        <div class="control-group">
        <label class="control-label"></label>
        <div class="controls">
        <button type="submit" onclick= insertclass="btn btn-success" >Create Account</button>
        </div></div>
        
</form>
</div></div>
</body>
</html>