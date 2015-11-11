<%@ page import="com.openvote.Vote" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.openvote.Candidate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.lang.Exception.*" %>
<%@ page import="java.util.*" %>


<html>

	<head>
   		<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css" />
 	</head>


	<body>
 		<div class="page-header" style="margin-bottom: 0px">
 			<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  			<h2 style="display: inline"> OpenVote </h2>
  		</div>
  		<nav class="navbar navbar-default">
    		<div>
      			<ul class="nav navbar-nav">
        			<li><a href="/viewAllVotes.jsp">Live Results</a></li>
        			<li><a href="#">Election Overview</a></li>
      			</ul>
      			<form class="navbar-form navbar-right" role="search">
        				<div class="form-group">
    						<input type="text" class="form-control" name="votekey" placeholder="Search Your Vote">
    					</div>
    					<form method="post">
		    				<a onclick="window.location.href='viewSingleVote.jsp?votekey=${fn:escapeXml(votekey)}'" class="btn btn-default">Search</a>
		    			</form>
  				</form>
    		</div>
		</nav>
  		
  		
			<div class="container">
		 	<%
		 		Long id_query;
		 		String id_str = request.getParameter("votekey");
		 		if(id_str == null || id_str.equals("")){
		 			System.out.println("request.getAttribute(\"votekey\") is null");
		 	%>
		 			<p><b> No vote matches id: null</p>
		 	<%
		 		}else{
		 			try{
		 				id_query = Long.parseLong(id_str);
		 			}catch(NumberFormatException nfe){
		 				pageContext.setAttribute("vote_id", id_str);
		 				%>
	        			<p><b> No vote matches id: ${fn:escapeXml(vote_id)}</p>	
	        			<%
	        			return;
		 			}
			 		
		 			System.out.println(id_query.toString());
		 			Vote vote = ObjectifyService.ofy().load().type(Vote.class).filter("id", id_query).first().get();
	        		if( vote == null){
	        			
	        			pageContext.setAttribute("vote_id", id_query.toString());
	        			
	        		}
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
				
				<div>
		  		<form action="/results" method="post">
				<div><input class="btn btn-default" type="submit" value="Return to Live Results"/></div>
				</form>
		  		</div>
		    <%
		 		}
	 		
			%> 
			</div>
		
	</body>
</html>