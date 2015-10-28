package com.openvote;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.googlecode.objectify.ObjectifyService.ofy;
 

@SuppressWarnings("serial")
public class CastVoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {   	
    	ArrayList<Vote> offsetVotes = new ArrayList<Vote>();
    	Vote previousVote = (Vote) req.getSession().getAttribute("previousVote");
    	
    	// If user is changing their vote, cast an offset vote for every other candidate in the enum
    	if (previousVote != null) {
    		for (Candidate c: Candidate.values()) {
    			if (c.ordinal() != previousVote.getCandidate()) {
    				Vote fakeVote = new Vote(c.ordinal());
    				offsetVotes.add(fakeVote);
    	    		ofy().save().entity(fakeVote).now();
    			}
    		}
    		offsetVotes.add(previousVote);
    	}
    	
    	// Cast new (or first) vote for updated choice
    	String candidate_str = req.getParameter("candidate");
    	Vote myVote = new Vote(Candidate.valueOf(candidate_str).ordinal());
    	ofy().save().entity(myVote).now();
    	
    	// Update (or set) currentVote to be updated choice
    	req.getSession().setAttribute("currentVote", myVote);
    	req.setAttribute("offsetVotes", offsetVotes);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/displayVoteKeys.jsp");
		try
		{
			dispatcher.forward(req, resp);
		} catch (ServletException e)
		{
			e.printStackTrace();
		}
		
    }
    
    

}
