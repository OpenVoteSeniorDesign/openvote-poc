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
		ArrayList<Vote> offsetVotes = (ArrayList<Vote>) request.getAttribute("offsetVotes");
	%>

  <body>
  	<div class="container">
  		<h2>OpenVote</h2>
  		<div class="container">
  		
			<%
					pageContext.setAttribute("voteId", myVote.getId());
					pageContext.setAttribute("voteCandidate", Candidate.values()[myVote.getCandidate()]);
			%>
					<p> Here is your vote: </p>
					<p> Candidate: ${fn:escapeXml(voteCandidate)} </p>
			    	<p> Id: ${fn:escapeXml(voteId)} </p>
			    	<br>
			<%
				// Display offset (fake) votes (testing purposes)
					//if (offsetVotes.size() != 0) {
			
					//<p> [ testing offset vote generation: here are the offset votes: </p>
			
						//pageContext.setAttribute("numBatches", request.getAttribute("numBatches"));
						//for (Vote v : offsetVotes) {
						//	pageContext.setAttribute("voteId", v.getId());
						//	pageContext.setAttribute("voteCandidate", Candidate.values()[v.getCandidate()]);
						
			
						//<p> Candidate: ${fn:escapeXml(voteCandidate)} </p>
				    	//<p> Id: ${fn:escapeXml(voteId)} </p>
						//<br>
				    	
						//}
					//}
			
				//<p> [ testing num fake vote batches counter: ${fn:escapeXml(numBatches)} ] </p>	   
			%> 	
		    <p> Would you like to change your vote? </p>

			<form action="/changevote" method="post">
		      <div><input type="submit" value="Yes"/></div>
		    </form>
	    
		   	<form action="/goodbye" method="post">
		      <div><input type="submit" value="No"/></div>
		    </form>
		    
		</div>
	</div>
  </body>
</html>
