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
		 	<%
	 			
		 		String id_str = request.getParameter("votekey");
		 		if(id_str == null || id_str.equals("")){
		 			System.out.println("request.getAttribute(\"votekey\") is null");
		 	%>
		 			<p><b> No vote matches id: null</p>
		 	<%
		 		}else{
			 		Long id_query = Long.parseLong(id_str);
		 			System.out.println(id_query.toString());
		 			Vote vote = ObjectifyService.ofy().load().type(Vote.class).filter("id", id_query).first().get();
	        		if( vote == null){
	        			
	        			pageContext.setAttribute("vote_id", id_query.toString());
	        			%>
	        			<p><b> No vote matches id: ${fn:escapeXml(vote_id)}</p>	
	        			<%
	        			return;
	        		}
		 			String candidate = Candidate.values()[vote.getCandidate()].name();	     
	        		pageContext.setAttribute("vote_candidate", candidate);
	        		pageContext.setAttribute("vote_id", id_query.toString());
	        %>
		        	<p><b>${fn:escapeXml(vote_id)}</b> voted for: </p>
		        	<blockquote>${fn:escapeXml(vote_candidate)}</blockquote>
		    
		    <%
		 		}
	 			

		      
		    
			%> 
			</div>
		</div>
	</body>
</html>