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
   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
 </head>
 
  <body>
 	<p> Cast your vote! </p>

    <form action="/castvote" method="post">
<%    for(Candidate candidate : Candidate.values()){
%>
      <div><input type="radio" name="candidate" value="<%=candidate%>" checked><%=candidate%></div>
      <br>
<%    }
%>

      <div><input type="submit" value="Cast Vote"/></div>
    </form>

  </body>
</html>
	