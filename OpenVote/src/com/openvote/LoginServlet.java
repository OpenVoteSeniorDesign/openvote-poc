package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;


import com.google.appengine.api.users.*;
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

		UserService userService=UserServiceFactory.getUserService();
		User user=userService.getCurrentUser();
		
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
	
 
		} else 
   		 if (user != null){
   		resp.sendRedirect(userService.createLogoutURL("/login.jsp"));
   	
   	 } else {

   	    resp.sendRedirect(userService.createLoginURL("/castvote.jsp"));
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
