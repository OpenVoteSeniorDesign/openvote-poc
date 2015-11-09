<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>
 
  <body>
 	<div class="page-header">
 		<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  		<h2 style="display: inline"> OpenVote </h2>
  	</div>
 	
 	<div class="container">
    <form action="/login" method="post">
    	<div class="panel panel-default">
    		<div class="panel-body">
      			<div align="center">Login:<br>
      			<input id="login" type="text" name="username"></textarea></div><br>     
      			<div align="center">Password:<br>
      			<input id="password" type="text" name="username"></textarea></div><br>
     			<div align="center"><input id="btn_login" class="btn btn-default" type="submit" value="Log In"/></div>
     		</div>
    	</div>
    </form>
    
    </div>

  </body>
</html>
	