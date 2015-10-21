<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  
  <body>
	  <form action="LoginServlet" method="post">  
	  Username:   <input type="text" name="name"><br>  
	  Password:   <input type="password" name="password"><br>  
	  <input type="submit" value="login">  
	  </form>  

   </body>
 </html>
