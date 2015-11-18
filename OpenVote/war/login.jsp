<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ page import="com.google.appengine.api.users.*" %>
 <%@ page import="java.util.*" %>
 
<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>
 
  <body>
	  

	  
	  
   	<div class="page-header">
   		<a href="/">
   		<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
    	</a>
    		<h2 style="display: inline"> OpenVote </h2>


    	</div>
 	
	
  	  <%
   	 	 UserService userService=UserServiceFactory.getUserService();
   	 	 User user = userService.getCurrentUser();
		 String URL = userService.createLogoutURL("/");
		 Boolean isAdminLoggedIn = false;

		 
		 
		 try {
		   	    isAdminLoggedIn = userService.isUserAdmin();
		   	  }
		   	 catch (IllegalStateException e) {
				 
		   	  }
		 
		 
  		 //user logged in and is Admin
  		 if (user!= null && isAdminLoggedIn) { 	  %>
			 
			<div class="container" align="center">
				
			<h3>You are ready to vote.</h3>
		       
			   <form action="/login" method="post">
		       	<div class="panel panel-default">
		       		<div class="panel-body">
		        			<div align="center"><input id="btn_continue_admin" class="btn btn-default" type="submit" value="Continue"/></div>
		        	</div>
		       	</div>
		       </form>
    
		    </div>

  		<% //user logged in, is NOT admin 
		 } else if (user != null){ %>
	    	
			<div class="container" align="center">
			
			<h3>You are signed into a non-admin account. Please log out.</h3>
			
			<div class="panel panel-default">
	    		<div class="panel-body">
	     			<div align="center"><a href="<%=URL%>"><button id="btn_logout" type="button" class="btn btn-default">Logout</button></a></div>
	     		</div>
	    	</div>
						
			</div>
						
  		<%//user not logged in 
		 } else { %>
  		 	

			   	<div class="container" align="center">
				
				<h3>Please allow the admin to log in.</h3>
			      
				  <form action="/login" method="post">
			      	<div class="panel panel-default">
			      		<div class="panel-body">
			      			<br>
			       			<div align="center"><input id="btn_continue_not_admin" class="btn btn-default" type="submit" value="Continue"/></div>
			       			<br>
			       			<div align="center"><a href="/viewAllVotes.jsp">or click here to view election results</a></div>
			       			<br>
			       		</div>
			      	</div>
			      </form>
    
			    </div>
  		 <% } %>
	  


  </body>
</html>