package com.openvote;


import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.*;

public class GoodbyeServlet extends HttpServlet {
	

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	UserService userService=UserServiceFactory.getUserService();
  	    User user=userService.getCurrentUser();
  	    
  	    resp.sendRedirect(userService.createLogoutURL("/goodbye.jsp"));
    }

}
