<%@page import= "java.util.*"%>
<%@page import= "edu.neu.aarambh.DAO.*" %>
<%@page import= "edu.neu.aarambh.classes.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comments Thread Page</title>

<link href="resource\css\bootstrap.css" rel="stylesheet"/>
<link href="resource\css\bootstrap.min.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.css" rel="stylesheet"/>
<link href="resource\css\bootstrap-responsive.min.css" rel="stylesheet"/>
<link href="resource\css\style.css" rel="stylesheet"/>
<link href="resource\js\bootstrap.js" rel="js"/>
<link href="resource\js\bootstrap.min.js" rel="js"/>
<link href="resource\js\jquery-1.11.2.min.js" rel="js"/>
<link href="resource\css\star.css" rel="stylesheet"/>


<script>
function display()
{
var val1= document.getElementById('rating1').checked;
var val2= document.getElementById('rating2').checked;
var val3= document.getElementById('rating3').checked;
var val4= document.getElementById('rating4').checked;
var val5= document.getElementById('rating5').checked;
alert(val1);
alert(val2);
alert(val3);
alert(val4);
alert(val5);
}

</script>
</head>

<body>
<div class="container">
<!-- PLACE HEADER HERE -->
<br>

<div style="align:center">
<% if(request.getParameter("commentid") != null)
{
	session.setAttribute("commentId", request.getParameter("commentid"));
}%>
<h1> COMMENT THREAD FOR COMMENT ID : <%=session.getAttribute("commentId").toString()%></h1></div>

<br>

<% 	
		DAOComment dao = new DAOComment();
		int comm= Integer.parseInt(session.getAttribute("commentId").toString());
		String st = request.getParameter("action");
		if ("create".equals(st))
		{
		//var propertyId=request.getParameter('propertyid');
    	
    	java.util.Date utilDate = new java.util.Date();
 	  	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
 	  	
    	if (request.getParameter("head") != null || request.getParameter("desc") != null)
    	{	
    		dao.insertNewComment(session.getAttribute("currentSessionUser").toString(), Integer.parseInt(session.getAttribute("propertyid").toString()), 3, request.getParameter("desc"),request.getParameter("head"), sqlDate, comm);
    	}
		}%>

<table class="table table-hover" id="tab">
        <thead>
        <tr>
            <th>Thread Number</th>
            <th>Thread Header</th>
            <th>Created By</th>
            <th>Description</th>
            <th>Created On</th>
       </tr>
       </thead>
       <%
       
       
       	List<Comment> com = dao.findCommentbyChild(comm);
        	if(com == null)
        	{
        	System.out.println("inside if");%>
        <h2> No Content Found</h2>
        	<%}
        	else
        	{
        		System.out.println("inside else");
        	for (Comment c: com)
        		{%>
        <tbody>
        <tr> 
        <td>
        <%=c.getCommentid()%>
        </td><td>
      	<%=c.getCommheader()%>
        </td><td>
	    <%=c.getUsername()%>
        </td><td>
		<%=c.getCommdesc() %>
        </td><td>
	    <%=c.getCommdte()%>
        </td> </tr> <%} }%>   
     </tbody>
   </table>
   
   
    
<br>
<br>
		
<div class="form-group" id="form1">

	<form action="CommentThread.jsp">
	
	<div class="container">
		
		 <fieldset disabled>
	   		<div class="row" style="display:inline-block">
         	<label for="disabledTextInput"  class="col-sm-2 control-label" style="width:100px;"><b> Username &nbsp;</b> </label>
    	     <div class="col-sm-10">
        	 <input type="text" id="disabledTextInput" name="username" class="form-control" value=<%=session.getAttribute("currentSessionUser")%>>
         	</div>
      		</div>
	 	</fieldset>
	<br>
	<div class="row" style="display:table-caption" id="sfl">
	<label class="left" style="width:100px;text-align:left"><b>Thread Title &nbsp;</b> </label>
	<input type="text" style= "background-color:white; width:500px; height:70px" class="form_input" id="header" name="head" placeholder="Enter Title"/>
	</div>
	<br>
	<br>
  	<div class="row">
    	<label for="name"><b>Please provide comments &nbsp;</b></label>
    	<textarea class="form-control" style="margin-left:0px" name = "desc" rows="10"></textarea>
  	</div>
	<br>
	<div id="rating" >
	 <p><h2> Rating &nbsp;</h2>
      	<span class="starRating">
        	
        	<input id="rating5" type="radio" name="rating" value="5">
        	<label for="rating5">5</label>
        
        	<input id="rating4" type="radio" name="rating" value="4">
        	<label for="rating4">4</label>
        
        	<input id="rating3" type="radio" name="rating" value="3">
        	<label for="rating3">3</label>
        
        	<input id="rating2" type="radio" name="rating" value="2">
        	<label for="rating2">2</label>
        
        	<input id="rating1" type="radio" name="rating" value="1">
        	<label for="rating1">1</label>

      	</span>
    </p>
    </div>
	
		<div style="float: left; padding: 10px 25px 0 0;">
		<button type="submit" class="btn btn-info" id="submit" name="action" value="create">Add Comment</button>
		</div>
	
	</div>
	</form>

	</div>
</div>
</body>
</html>	