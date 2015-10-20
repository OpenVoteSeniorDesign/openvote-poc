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
		pageContext.setAttribute("realVote", request.getAttribute("realVote"));
		pageContext.setAttribute("numBatches", request.getAttribute("numFakeVoteBatches"));
		ArrayList<Vote> fakeVotes = (ArrayList<Vote>) request.getAttribute("fakeVotes");
	%>
 
 	<p> Your vote key is: ${fn:escapeXml(realVote.id)} </p>
	<br>
	<p> Here are some keys corresponding to other votes: </p>
	<% for (Vote fakeVote : fakeVotes) {
			int candidateIndex = fakeVote.getCandidate();
			pageContext.setAttribute("fakeVoteId", fakeVote.getId());
			pageContext.setAttribute("fakeVoteCandidate", Candidate.values()[candidateIndex]);
	%>
			<p> Candidate: ${fn:escapeXml(fakeVoteCandidate)} </p>
	    	<p> Id: ${fn:escapeXml(fakeVoteId)} </p>
	    	<br>
	
	<% }
	%>
	
	<p> Would you like to see more vote keys?  </p>
	<form action="/castfakevote" method="post">
      <div><input type="submit" value="Yes"/></div>
      <input type="hidden" name="numFakeVoteBatches" value="${fn:escapeXml(numBatches)}"/>
    </form>
    
   	<form action="/goodbye" method="post">
      <div><input type="submit" value="No"/></div>
    </form>
	
	
  </body>
</html>
