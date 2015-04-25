<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.aarambh.servelets.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aarambh - Login</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>

<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>

 </head>
<body>
 <div class="container">
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
        <input type="Password" id="password" class="input-xlarge" name="password" placeholder="Password">
        </div></div></div>

      
        <div class="control-group">
        <label class="control-label"></label>
        <div class="controls">
        <button type="submit" class="btn btn-success" >Login</button>
        </div></div>
        
</form>
</div></div>
</body>
</html>