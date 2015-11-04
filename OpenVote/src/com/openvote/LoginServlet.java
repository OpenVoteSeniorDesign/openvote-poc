package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	static {

        ObjectifyService.register(com.openvote.Vote.class);
        ObjectifyService.register(com.openvote.VoteBatchCounter.class);
        ObjectifyService.register(com.openvote.TimeOut.class);
    }

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	// These are null as user has not yet voted
    	req.getSession().setAttribute("previousVote", null);
    	req.getSession().setAttribute("currentVote", null);
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
