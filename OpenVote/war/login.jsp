<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>
 
  <body>
 	<div class="container">
 	<div class="page-header">
  		<h2> OpenVote </h2>
  	</div>
 	
 	
    <form action="/login" method="post">
    	<div class="panel panel-default">
    		<div class="panel-body">
      			<div align="center">Login:<br>
      			<input type="text" name="username"></textarea></div>     
      			<div align="center">Password:<br>
      			<input type="text" name="username"></textarea></div>
     			<div align="center"><input type="submit" value="Log In"/></div>
     		</div>
    	</div>
    </form>
    
    </div>

  </body>
</html>
	