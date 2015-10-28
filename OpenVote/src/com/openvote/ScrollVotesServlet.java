package com.openvote;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

public class ScrollVotesServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	// increment counter used to index through array of fake votes on displayVoteKey.jsp
    	Integer voteIndex = new Integer(req.getParameter("voteIndex"));
    	voteIndex += 1;
    	req.setAttribute("voteIndex",voteIndex);
    	req.setAttribute("numFakeVoteBatches", req.getParameter("numFakeVoteBatches"));
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
