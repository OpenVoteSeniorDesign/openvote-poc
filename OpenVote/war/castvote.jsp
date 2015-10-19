<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.openvote.Candidate" %> 

<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>
 
  <body>
  
  	<div class="container">
 		<h2> OpenVote </h2>
    	<form role="form" action="/castvote" method="post">
<%    	//for(Candidate cName : Candidate.values()){
%>
		  <div class="panel panel-default">
		    <div class="panel-heading">Cast Your Vote!</div>
		    <div class="panel-body">
	      		<div class="form-inline" align=left><input type="radio" class="radio" name="candidate" value="BUSH" checked> George Bush</div>
	      		<br>
	      		<div class="form-inline" align=left><input type="radio" class="radio" name="candidate" value="TRUMP" checked> Donald Trump</div>
	      		<br>
	      		<div class="form-inline" align=left><input type="radio" class="radio" name="candidate" value="CLINTON" checked> Bill Clinton</div>
	      		<br>
<%   	 //}
%>
      			<div class="form-group" align=left><button type="submit" class="btn btn-default">Cast Vote</button></div>
    		</div>
		  </div>
    	</form>
	</div>
	
  </body>
</html>
	