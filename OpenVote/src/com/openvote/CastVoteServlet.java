package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.http.*;

import org.datanucleus.store.query.CandidateIdsQueryResult;
import static com.googlecode.objectify.ObjectifyService.ofy;
 

//COPIED FROM OPENVOTESERVLET.java
/*
 * key = key.getkey()
 * 
 * */
@SuppressWarnings("serial")
public class CastVoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	String candidate_str = req.getParameter("candidate");
    	//is this how you instantiate an enum element?
    	Candidate vote = Candidate.valueOf(candidate_str);   	
    	ofy().save().entity(vote).now();
    	// need to load to get key to provide voter -> how to load without key?
    	
    	// cast vote for all fake candidates
    	// this needs to be moved later in the workflow; voter needs to specify how many batches of fake votes they'd like to send
    	for (Candidate c: Candidate.values()) {
    			ofy().save().entity(c).now();
    	}
    	
    	//VoteKey vk = new VoteKey(UUID.randomUUID()); //TODO this needs to be checked for uniqueness
    	//Vote vote = new Vote(vk, Candidate.valueOf(candidate_str));
    	

    	
		resp.setContentType("text/plain");
		resp.getWriter().println("You voted for " + candidate_str + ".");
		//resp.getWriter().println("Your key is " + vote.getVoteKey().toString() + ".");
		
		
		//if(votmg){
		 //   -get info
		  //  -cast votes
		   // -save keys in session data
		   // -all data you save to check against
		   // -redirect to display.jsp
		//}
    }

}
