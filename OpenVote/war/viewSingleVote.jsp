<%@ page import="com.openvote.Vote" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.openvote.Candidate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>

<html>

	<head>
   		<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 	</head>

 	<%
 		Long id = (Long) request.getAttribute("id");
 		Vote v = ObjectifyService.ofy()
 				.load.type(Vote.class)
 			    .filterKey("=", id);
 			     
	%>
 	
	<body>
    	<div class="container">
  			<h2>OpenVote</h2>
			<div class="container">
		 	 	You can view your vote here and there will be a back button.      
			</div>
		</div>
	</body>
</html>