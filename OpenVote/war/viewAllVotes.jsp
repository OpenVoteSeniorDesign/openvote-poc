
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
	

    	<div class="container">
  			<h2>OpenVote</h2>
			<div class="container">
				<form action="/results" method="post">
			    	<div><input type="submit" value="Refresh"/></div>
				</form>
				<form action="/" method="post">
		    		<div><input type="submit" value="Return to Login"/></div>
		    	</form>
			      <% //get all of the published votes
			      List<Vote> voteList = ObjectifyService.ofy()
			      						.load().type(Vote.class)
			      						.filter("published ==", true)
			      						.list();
			    if (voteList.isEmpty()) {
				%>
				<p>The Election  has no votes published yet. Check back in a few minutes!</p>
				<%
			  	  } else {
				%>
				<p>Votes in the Election:</p>
				
				<%
			      // Look at all of our votes
			        for (Vote vote : voteList) {
			            
			            
			            Long id = vote.getId();
			            String candidate = Candidate.values()[vote.getCandidate()].name();
			            
			            
			            pageContext.setAttribute("vote_candidate", candidate);
			            pageContext.setAttribute("vote_id", id.toString());
				%>
					<p><b>${fn:escapeXml(vote_id)}</b> voted for: </p>
					<blockquote>${fn:escapeXml(vote_candidate)}</blockquote>
					
				<%
			        }
			    }
				%>
				   
			</div>
		</div>
	</body>
</html>