package com.openvote;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeVoteServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	// current vote is now previous vote, since voter is about to change their vote
    	Vote currentVote = (Vote) req.getSession().getAttribute("currentVote");
		req.getSession().setAttribute("previousVote", currentVote);
		
		// save number of fake vote batches (create new counter if this is first vote ever cast)
		// NOTE: does not work. really erratic behavior. don't know why.
		VoteBatchCounter counter = ofy().load().type(VoteBatchCounter.class).first().getValue();
		if (counter == null) {
			synchronized(ChangeVoteServlet.class){
				if (counter == null){
					counter = new VoteBatchCounter(1);
				}
			}
		}
		else {
			counter.increment();
		}
		ofy().save().entity(counter).now();
		
		// sending this to castvote jsp to be displayed for testing purpose
		req.setAttribute("numBatches", counter.getNumBatches());
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/castvote.jsp");
		try
		{
			dispatcher.forward(req, resp);
		} catch (ServletException e)
		{
			e.printStackTrace();
		}
		
    }

}
