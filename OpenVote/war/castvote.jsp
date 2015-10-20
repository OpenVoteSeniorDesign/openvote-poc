<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	