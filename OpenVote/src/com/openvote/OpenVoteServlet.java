package com.openvote;
<<<<<<< HEAD
=======

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
>>>>>>> 65ab5c107e3d4bdbbe592d7a593c5f32f82c3643

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class OpenVoteServlet extends HttpServlet {
<<<<<<< HEAD
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
=======

    static{
        // ObjectifyService.register(CLASSNAME.class); //Register a class to connect it with the
        // datastore
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String userEmail = user.getNickname();
        String userID;
        if(userEmail.indexOf('@') == -1){
            userID = (user.getNickname().trim() + "@gmail.com").toLowerCase();
        }else{
            userID = (user.getNickname().trim()).toLowerCase();
        }
        // ofy().save().entity(new CLASSNAME.Builder()...); Used to save things in the datastore
        resp.sendRedirect("/index.jsp");
    }
>>>>>>> 65ab5c107e3d4bdbbe592d7a593c5f32f82c3643
}
