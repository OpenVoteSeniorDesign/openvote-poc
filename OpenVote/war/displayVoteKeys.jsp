<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.openvote.Candidate" %> 
<%@ page import="com.openvote.Vote" %> 

<html>
 <head>
  <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 </head>

	<%
		Vote myVote = (Vote) request.getSession().getAttribute("currentVote");
	%>

  <body>
 	<div class="page-header">
 		<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  		<h2 style="display: inline"> OpenVote </h2>
  	</div>
  	
	<div class="container">
  		<div class="panel panel-default">
  		
			<%
					pageContext.setAttribute("voteId", myVote.getId());
					pageContext.setAttribute("voteCandidate", Candidate.values()[myVote.getCandidate()]);
			%>
			<div class="panel-heading"><h4>Here is your vote:</h4></div>
				<div class="panel-body">
					<div class="row"> 
						<div class="col-md-2"><b>Candidate:</b></div> 
						<div class="col-md-2">${fn:escapeXml(voteCandidate)}</div>
						<div class="col-md-8"></div>
					</div>
			    	<div class="row"> 
			    		<div class="col-md-2"><b>Id:</b></div> 
			    		<div class="col-md-2">${fn:escapeXml(voteId)}</div>
			    		<div class="col-md-8"></div>
			    	</div>
			    	<div>
			    		<img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=http://openvote-poc.appspot.com/viewsinglevote.jsp?votekey=${fn:escapeXml(voteId)}"/>
			    	</div>
			    	<br>
				    <p> Would you like to change your vote? </p>
					<div class="col-md-1">
						<form action="/changevote" method="post">
				      		<div><input class="btn btn-default" type="submit" value="Yes"/></div>
				    	</form>
			    	</div>
				    <div class="col-md-1">
					   		<form action="/goodbye" method="post">
					      		<div><input class="btn btn-default" type="submit" value="No"/></div>
					    	</form>
					</div>
					<div class="col-md-10"></div>
				</div>
		</div>
	</div>
  </body>
</html>
