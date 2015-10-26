package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.*;

import com.google.appengine.api.users.*;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	static {
        ObjectifyService.register(com.openvote.Vote.class);
    }

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
		

    	UserService userService=UserServiceFactory.getUserService();
    	  User user=userService.getCurrentUser();
    	  if (userService.isUserAdmin()) {
    	        resp.sendRedirect("/castvote.jsp");
    	  }
    	 else {
    	    resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
    	  }
    	  
    	  
    	  
    }
	

}
