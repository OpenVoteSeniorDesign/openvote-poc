<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.openvote.Candidate" %> 
<%@ page import="com.openvote.Vote" %> 



<html>
 <head>
   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
 </head>
 

  <body>
   <%
		pageContext.setAttribute("numBatches", request.getAttribute("numFakeVoteBatches"));
		ArrayList<Vote> votes = (ArrayList<Vote>) request.getAttribute("votes");
	%>
 
	<p> Here are your vote keys: </p>
	<% for (Vote vote : votes) {
			int candidateIndex = vote.getCandidate();
			pageContext.setAttribute("voteId", vote.getId());
			pageContext.setAttribute("voteCandidate", Candidate.values()[candidateIndex]);
	%>
			<p> Candidate: ${fn:escapeXml(voteCandidate)} </p>
	    	<p> Id: ${fn:escapeXml(voteId)} </p>
	    	<br>
	
	<% }
	%>
	
	<p> Would you like to see more vote keys?  </p>
	<p> testing: ${fn:escapeXml(numFakeVoteBatches)} </p>
	<form action="/castfakevote" method="post">
      <div><input type="submit" value="Yes"/></div>
      <input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
    </form>
    
   	<form action="/goodbye" method="post">
      <div><input type="submit" value="No"/></div>
    </form>
	
	
  </body>
</html>
