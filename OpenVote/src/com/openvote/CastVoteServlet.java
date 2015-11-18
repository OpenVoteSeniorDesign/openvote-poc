package com.openvote;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.googlecode.objectify.ObjectifyService.ofy;
 
@SuppressWarnings("serial")
public class CastVoteServlet extends HttpServlet {

	//public static VoteBatchCounter counter = ofy().load().type(VoteBatchCounter.class).first().getValue();
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {   	
    	
		
    	Vote previousVote = (Vote) req.getSession().getAttribute("previousVote");
    	
    	// If user is changing their vote, cast an offset vote for every other candidate in the enum
    	if (previousVote != null) {
    		for (Candidate c: Candidate.values()) {
    			if (c.ordinal() != previousVote.getCandidate()) {
    				Vote fakeVote = new Vote(c.ordinal());
    	    		ofy().save().entity(fakeVote).now();
    			}
    		}
    		
    		// Increment number of fake vote batches
    		//counter.increment();
    		//ofy().save().entity(counter).now();

    	}
    	
    	// Cast new (or first) vote for updated choice
    	String candidate_str = req.getParameter("candidate");
    	Vote myVote = new Vote(Candidate.valueOf(candidate_str).ordinal());
    	ofy().save().entity(myVote).now();

    	// Update (or set) currentVote to be updated choice
    	req.getSession().setAttribute("currentVote", myVote);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/displayVoteKeys.jsp");
		
		try {
			dispatcher.forward(req, resp);        
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
    }
    
    

}
