
<%@ page import="com.openvote.Vote" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>


<html>

	<head>
   		<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 	</head>

	<body>
	

    	<div class="container">
  			<h2>OpenVote</h2>
			<div class="container">
				<form action="/viewAllVotes.jsp" method="post">
			    	<div><input type="submit" value="Refresh"/></div>
				</form>
			      <% //get all of the published votes
			      List<Vote> voteList = ObjectifyService.ofy()
			      						.load().type(Vote.class)
			      						.filter("published ==", true)
			      						.list();
			    if (voteList.isEmpty()) {
				%>
				<p>The Election  has no votes published yet.</p>
				<%
			  	  } else {
				%>
				<p>Votes in the Election.</p>
				
				<%
			      // Look at all of our votes
			        for (Vote vote : voteList) {
			            pageContext.setAttribute("vote candidate", vote.candidate);
			            Integer c = vote.getCandidate();
			            Long id = vote.getId();
			            String candidate = "";
			            if(c == 0){ //TODO this isn't clean coding...
			            	candidate = "Nemo";
			            }else{
			            	candidate = "Dory";
			            }
			            
			            pageContext.setAttribute("vote_candidate", candidate);
			            pageContext.setAttribute("vote_id", id.toString());
				%>
					<p><b>${fn:escapeXml(vote_id)}</b> voted for: </p>
					<blockquote>${fn:escapeXml(vote_candidate)}</blockquote>
					
				<%
			        }
			    }
				%>
				
				//TODO This form needs to be updated with a refresh button

				     
			</div>
		</div>
	</body>
</html>