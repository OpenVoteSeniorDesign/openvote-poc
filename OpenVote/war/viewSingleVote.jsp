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
		 	<%
	 			
		 		String id_str = request.getParameter("votekey");
		 		Long id_query = Long.parseLong(id_str);
		 		if(id_query == null){
		 			System.out.println("request.getAttribute(\"votekey\") is null");
		 		%>
		 			<p><b> No vote matches id: null</p>
		 		<%
		 		}else{
		 			System.out.println(id_query.toString());
		 			Vote vote = ObjectifyService.ofy().load().type(Vote.class).filter("id", id_query).first().get();
	        		String candidate = Candidate.values()[vote.getCandidate()].name();	     
	        		pageContext.setAttribute("vote_candidate", candidate);
	        		pageContext.setAttribute("vote_id", id_query.toString());
	        	%>
	        	
	        	<div class="container">
				  <h2>Single Vote in the Election</h2>
				  <p>Below is the vote you searched for, with the candidate selected and the corresponding vote ID.</p>            
				  <table class="table">
				    <thead>
				      <tr>
				        <th>Candidate Selection</th>
				        <th>Vote ID</th>
				      </tr>
				    </thead>
					<tbody>
					<tr>
				        <td>${fn:escapeXml(vote_id)}</td>
				        <td>${fn:escapeXml(vote_candidate)}</td>
				    </tr>
				    </tbody>
				  </table>
				</div> 
		    
		        <%
		 		}
	 		
			%> 
			</div>
		
	</body>
</html>