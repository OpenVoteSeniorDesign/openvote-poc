package com.openvote;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CastFakeVoteServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	Integer numFakeVoteBatches = new Integer(req.getParameter("numFakeVoteBatches"));

    	// cast vote for all fake candidates
    	ArrayList<Vote> votes = new ArrayList<Vote>();
		for (Candidate c: Candidate.values()) {
			Vote fakeVote = new Vote(c.ordinal());
    		ofy().save().entity(fakeVote).now();
    		votes.add(fakeVote);
    	}
		
		// update number of fake vote batches saved in Datastore
		VoteBatchCounter counter = ofy().load().type(VoteBatchCounter.class).first().getValue();
		numFakeVoteBatches = counter.increment();
		ofy().save().entity(counter).now();

		req.getSession().setAttribute("votes", votes);
		req.setAttribute("numFakeVoteBatches", numFakeVoteBatches);
		req.setAttribute("voteIndex", 0);
		
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
