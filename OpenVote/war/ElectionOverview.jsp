
<%@ page import="com.openvote.Vote" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.openvote.Candidate" %>
<%@ page import="com.openvote.CandidateTally" %>
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
 		<div class="page-header" style="margin-bottom: 0px">
 			<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  			<h2 style="display: inline"> OpenVote </h2>
  		</div>
  		<nav class="navbar navbar-default">
    		<div>
      			<ul class="nav navbar-nav">
        			<li><a href="/viewAllVotes.jsp">Live Results</a></li>
        			<li class="active"><a href="/ElectionOverview.jsp">Election Overview</a></li>
      			</ul>
      			<form action="/viewSingleVote.jsp?votekey=${fn:escapeXml(votekey)}" class="navbar-form navbar-right" role="search">
        				<div class="form-group">
    						<input type="search" class="form-control" name="votekey" id="voteSearch" placeholder="Search Your Vote">
    					</div>
    					<div class="form-group">
    						<button type="submit" class="btn btn-default">Search</button>
  						</div>
  				</form>
    		</div>
		</nav>
		
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<form action="/overview" method="post">
			    			<div><input id="btn_refresh" class="btn pull-left" type="submit" value="Refresh"/></div>
						</form>
					</div>
					<div class="col-md-6"></div>
					<div class="col-md-3">
						<form action="/" method="post">
		    				<div><input id="btn_return_login" class="btn pull-right" type="submit" value="Return to Login"/></div>
		    			</form>
		    		</div>
		    	</div>
		    
			      <% //get all of the published votes
			      List<Vote> voteList = ObjectifyService.ofy()
			      						.load().type(Vote.class)
			      						.filter("published ==", true)
			      						.list();
			      
			      ArrayList<CandidateTally> tallies = new ArrayList<CandidateTally>();
				  for (Candidate c : Candidate.values()) {
						CandidateTally temp = new CandidateTally(c);
						tallies.add(temp);
				  }
				  // Look at all of our votes
			        for (Vote vote : voteList) {
			            
				            Long id = vote.getId();
				            String candidate = Candidate.values()[vote.getCandidate()].name();
				            for(CandidateTally ct : tallies){
				            	if(candidate.equals(ct.name))
				            	{
				            		ct.tally += 1;
				            	}
				            }
			        }
			    //}
				%>
				
				<div class="container">
				  <h2>Candidate Tallies</h2>
				  <p>Below are the current number of votes per candidate, given the published results.</p>            
				  <table class="table">
				    <thead>
				      <tr>
				        <th>Candidate</th>
				        <th>Number of Votes</th>
				      </tr>
				    </thead>
					<tbody>
	  					<% 
	  					Integer max = 0;
	    				for(CandidateTally candidateTally : tallies){
	    					//TODO: make div class variable depending on # of candidates
				            pageContext.setAttribute("candidate_name", candidateTally.getName());
				            pageContext.setAttribute("candidate_tally", candidateTally.getTally());
				            /* if(candidateTally.tally > max){
				            	max = candidateTally.tally;
				            } */
				            	
		    			%>
    					<tr>
	    						<td>${fn:escapeXml(candidate_name)}</td>
	      						<td>${fn:escapeXml(candidate_tally)}</td>
    					</tr>
	  					<%
	    				}
	      				%>	
					</tbody>
				  </table>
				</div> 
			</div>	
			
	</body>
</html>