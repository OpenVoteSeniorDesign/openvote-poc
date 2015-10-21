package com.openvote;

import java.io.IOException;
import java.io.PrintWriter;
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
    	
    	//if logged in:
    	HttpSession session=req.getSession(false);  
        if(session!=null){  
    	
    	String candidate_str = req.getParameter("candidate");
    	
    	// cast real vote
    	ArrayList<Vote> votes = new ArrayList<Vote>();
    	Vote vote = new Vote(Candidate.valueOf(candidate_str).ordinal());
    	ofy().save().entity(vote).now(); 	
    	votes.add(vote);
    	//TODO: verify that the autogenerated id is unique
    	
    	//TODO: make private
    	// cast vote for all fake candidates
		for (Candidate c: Candidate.values()) {
			Vote fakeVote = new Vote(c.ordinal());
    		ofy().save().entity(fakeVote).now();
    		votes.add(fakeVote);
    	}
    	
    	// pass real and fake vote information to display keys page
		req.setAttribute("votes", votes);
		req.setAttribute("numFakeVoteBatches", 1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/displayVoteKeys.jsp");
		try
		{
			dispatcher.forward(req, resp);
		} catch (ServletException e)
		{
			e.printStackTrace();
		}
		
        } else {
        	//if not logged in
        	PrintWriter out=resp.getWriter(); 
        	out.print("You do not have permission to see this page. Login:");  
            try {
				req.getRequestDispatcher("login.jsp").include(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
        }
		
    }

}
