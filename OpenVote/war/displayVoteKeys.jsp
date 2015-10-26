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

  <body>
  	<div class="container">
  		<h2>OpenVote</h2>
  		<div class="container">
		    <%
		  		ArrayList<Vote> votes = (ArrayList<Vote>) session.getAttribute("votes");
				pageContext.setAttribute("numBatches", request.getAttribute("numFakeVoteBatches"));
				int voteIndex = (Integer) request.getAttribute("voteIndex");
			%>
		 
			
			<% 
					Vote vote = votes.get(voteIndex);
					int candidateIndex = vote.getCandidate();
					pageContext.setAttribute("voteId", vote.getId());
					pageContext.setAttribute("voteCandidate", Candidate.values()[candidateIndex]);

			%>
					<p> Here is your vote: </p>
					<p> Candidate: ${fn:escapeXml(voteCandidate)} </p>
			    	<p> Id: ${fn:escapeXml(voteId)} </p>
			    	<br>
			    	<p> Would you like to see another vote? </p>
			<% 
			if (voteIndex < votes.size() - 1) {	
			%>

					<form action="/scrollvotes" method="post">
				      <div><input type="submit" value="Yes"/></div>
				      <input type="hidden" name="voteIndex" value="${fn:escapeXml(voteIndex)}"/>
				      <input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
				    </form>
		    <% 
		    }
		    else {
		    %>
					<p> [ num fake vote batches: ${fn:escapeXml(numBatches)} ]</p>
					<form action="/castfakevote" method="post">
				      <div><input type="submit" value="Yes"/></div>
				      <input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
				    </form>
		    
		    <% }
			%>
	    
		   	<form action="/goodbye" method="post">
		      <div><input type="submit" value="No"/></div>
		    </form>
		</div>
	</div>
  </body>
</html>
