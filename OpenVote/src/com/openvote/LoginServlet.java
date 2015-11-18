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

import com.google.appengine.api.users.*;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	@Override
	public void init(ServletConfig servletConfig) throws ServletException{
		try{
		super.init(servletConfig);
		System.err.println("1");
		ObjectifyService.register(com.openvote.Vote.class);
		System.err.println("2");
		//ObjectifyService.register(com.openvote.VoteBatchCounter.class);
		System.err.println("3");
		ObjectifyService.register(com.openvote.TimeOut.class);
		System.err.println("5");

		// instantitate fake vote batch counter if not yet created.
		// TODO: delete all counters in datastore from developers console and see if this works
		//VoteBatchCounter counter = ofy().load().type(VoteBatchCounter.class).first().getValue();
//		if (counter == null) {
//			synchronized(LoginServlet.class){
//				if (counter == null){
//					ofy().save().entity(counter).now();
//				}
//			}
//		}
		} catch(NullPointerException npe){
			System.out.println("Caught the little fucker!");
			npe.printStackTrace();
			
		}

	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		try{    	
			UserService userService=UserServiceFactory.getUserService();
			User user=userService.getCurrentUser();

			//user logged in and is Admin
			if (user!= null && isAdminLoggedIn()) {

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


				//user logged in, is NOT admin
			} else if (user != null){
				resp.sendRedirect("/");

				//user not logged in
			} else {
				resp.sendRedirect(userService.createLoginURL("/login.jsp"));
			}
		} catch (NullPointerException npe){
			npe.printStackTrace();
		}

	}

	public static boolean isAdminLoggedIn(){
		try {
			UserService userService=UserServiceFactory.getUserService();
			return userService.isUserAdmin();
		}
		catch (IllegalStateException e) {
			return false;
		}
	}

}
