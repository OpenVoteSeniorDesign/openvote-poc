
<%@ page import="com.openvote.Vote" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.openvote.Candidate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>

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
				<div class="row">
					<div class="col-md-3">
						<form action="/results" method="post">
			    			<div><input class="btn pull-left" type="submit" value="Refresh"/></div>
						</form>
					</div>
					<div class="col-md-6"></div>
					<div class="col-md-3">
						<form action="/" method="post">
		    				<div><input class="btn pull-right" type="submit" value="Return to Login"/></div>
		    			</form>
		    		</div>
		    		
		    	</div>
			      <% //get all of the published votes
			      List<Vote> voteList = ObjectifyService.ofy()
			      						.load().type(Vote.class)
			      						.filter("published ==", true)
			      						.list();
			    if (voteList.isEmpty()) {
				%>
				<br><br><br><br>
				<h4 align="center">The Election  has no votes published yet. Check back in a few minutes!</h4>
			
				<%
			  	  } else {
				%>
				<div class="container">
				  <h2>Votes in the Election</h2>
				  <p>Below are all the published votes in the election, with candidates voted for and each vote ID associated with the vote.</p>            
				  <table class="table">
				    <thead>
				      <tr>
				        <th>Candidate Selection</th>
				        <th>Vote ID</th>
				      </tr>
				    </thead>
					<tbody>
				
				<%
			      // Look at all of our votes
			        for (Vote vote : voteList) {
			            
			            
			            Long id = vote.getId();
			            String candidate = Candidate.values()[vote.getCandidate()].name();
			            
			            
			            pageContext.setAttribute("vote_candidate", candidate);
			            pageContext.setAttribute("vote_id", id.toString());
				%>
				      <tr>
				        <td>${fn:escapeXml(vote_id)}</td>
				        <td>${fn:escapeXml(vote_candidate)}</td>
				      </tr>

				<%
			        }
			    }
				%>
				  	</tbody>
				  </table>
				</div> 
				
			</div>

	</body>
</html>