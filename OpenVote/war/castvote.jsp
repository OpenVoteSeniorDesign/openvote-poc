<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.openvote.Candidate" %> 

<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>
 
  <body>
  <div class="container">
  <h2> OpenVote </h2>

    <form action="/castvote" method="post">
      <div class="panel panel-default">
        <div class="panel-heading">Cast Your Vote!</div>
        <div class="panel-body">
<%        	pageContext.setAttribute("numBatches", request.getAttribute("numBatches"));
			for(Candidate candidate : Candidate.values()){
			      pageContext.setAttribute("candidate", candidate.name());
%>
            <div class="form-inline" align=left><input type="radio" name="candidate" value="${fn:escapeXml(candidate)}" checked>${fn:escapeXml(candidate)}</div>
            <br>
<%        }
%>
      		<div class="form-group" align=left><button type="submit" class="btn btn-default">Cast Vote</button></div>
      		<p> [ num batches: ${fn:escapeXml(numBatches)} ] </p>
    		</div>
		  </div>
    	</form>
	</div>
	
  </body>
</html>
	