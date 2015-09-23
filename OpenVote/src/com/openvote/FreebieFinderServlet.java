package com.openvote;
 
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class OpenVoteServlet extends HttpServlet {
	
	static {
		//ObjectifyService.register(CLASSNAME.class); //Register a class to connect it with the datastore
	}
	
    @Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
    	
    	UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		String userEmail = user.getNickname();
        String userID;
        if (userEmail.indexOf('@') == -1){
        	userID = (user.getNickname().trim() + "@gmail.com").toLowerCase();
        }
        else{
        	userID = (user.getNickname().trim()).toLowerCase();
        }
        //ofy().save().entity(new CLASSNAME.Builder()...); Used to save things in the datastore
        resp.sendRedirect("/index.jsp");
    }
}
