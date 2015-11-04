package com.openvote;


import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	@Override
	public void init(ServletConfig servletConfig) throws ServletException{
		super.init(servletConfig);
        ObjectifyService.register(com.openvote.Vote.class);
        ObjectifyService.register(com.openvote.VoteBatchCounter.class);
        ObjectifyService.register(com.openvote.TimeOut.class);
        
        // instantitate fake vote batch counter if not yet created.
        // TODO: delete all counters in datastore from developers console and see if this works
        VoteBatchCounter counter = ofy().load().type(VoteBatchCounter.class).first().getValue();
		if (counter == null) {
			synchronized(LoginServlet.class){
				if (counter == null){
					ofy().save().entity(counter).now();
				}
			}
		}

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
