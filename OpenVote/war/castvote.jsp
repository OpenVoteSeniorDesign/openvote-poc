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
 	<div class="page-header">
 		<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  		<h2 style="display: inline"> OpenVote </h2>
  	</div>

	<div class="container">
    <form action="/castvote" method="post">
      <div class="panel panel-default">
        <div class="panel-heading">Cast Your Vote!</div>
        <div class="panel-body">
<%        	
			for(Candidate candidate : Candidate.values()){
			      pageContext.setAttribute("candidate", candidate.name());
%>
            <div class="form-inline" align=left><input id="btn_${fn:escapeXml(candidate)}" type="radio" name="candidate" value="${fn:escapeXml(candidate)}" checked> ${fn:escapeXml(candidate)}</div>
            <br>
<%        }
%>
      		<div class="form-group" align=left><button id="btn_submit" type="submit" class="btn btn-default">Cast Vote</button></div>
      		
    		</div>
		  </div>
    	</form>
	</div>
	
  </body>
</html>
	