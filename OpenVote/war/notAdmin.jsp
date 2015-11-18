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
     <img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
      	<h2 style="display: inline"> OpenVote </h2>
	</div>  
	  
	  
	  <%
	 	 UserService userService=UserServiceFactory.getUserService();
	 	 User user = userService.getCurrentUser();
		 String URL = userService.createLogoutURL("/");
	 	 %>
	  
 	<div class="container">
 	<h2> OpenVote </h2>
	<h3>You are logged in to a non-Admin account. Please log out before continuing.</h3>
 	

    	<div class="panel panel-default">
    		<div class="panel-body">
     			<div align="center"><a href="<%=URL%>"><button type="button" class="btn btn-default">Logout</button></a></div>
     		</div>
    	</div>

    
    </div>

  </body>
</html>