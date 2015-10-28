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
		ArrayList<Vote> votes = (ArrayList<Vote>) session.getAttribute("votes");
		int voteIndex = (Integer) request.getAttribute("voteIndex");
		pageContext.setAttribute("numBatches", request.getAttribute("numFakeVoteBatches"));
	%>

  <body>
  	<div class="container">
  		<h2>OpenVote</h2>
  		<div class="panel panel-default">
			<% 
					Vote vote = votes.get(voteIndex);
					int candidateIndex = vote.getCandidate();
					pageContext.setAttribute("voteId", vote.getId());
					pageContext.setAttribute("voteCandidate", Candidate.values()[candidateIndex]);
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
			    	
			    	<br>
			    	<div> Would you like to see another vote? </div>
			    	<br>
			<% 
			if (voteIndex < votes.size() - 1) {	
			%>
					<div class="row">
						<div class="col-md-1">
							<form action="/scrollvotes" method="post">
				      		<div><input class="btn btn-default" type="submit" value="Yes"/></div>
				      		<input type="hidden" name="voteIndex" value="${fn:escapeXml(voteIndex)}"/>
				      		<input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
				    		</form>
				    	</div>
		    <% 
		    }
		    else {
		    %>
					<% //<p> [ num fake vote batches: ${fn:escapeXml(numBatches)} ]</p> %>
						<div class="col-md-1">
							<form action="/castfakevote" method="post">
				      		<div><input class="btn btn-default" type="submit" value="Yes"/></div>
				      		<input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
				    		</form>
				    	</div>
		    
		    <% }
			%>
	    				<div class="col-md-1">
		   					<form action="/goodbye" method="post">
		      				<div><input class="btn btn-default" type="submit" value="No"/></div>
		    				</form>
		    			</div>
		    			<div class="col-md-10"></div>
		    		</div>
		    	</div>
		</div>
	</div>
  </body>
</html>
