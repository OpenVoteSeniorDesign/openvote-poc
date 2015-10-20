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
 	<p> Your vote key is: <c:out value="${voteKey}"/></p>
	<br>
	<p> Here are some keys corresponding to other candidates: </p>
	<c:forEach var="key" items="${fakeVoteKeys}">
	    <c:out value="${key}"/>
	    <br>
	</c:forEach>
  </body>
</html>
