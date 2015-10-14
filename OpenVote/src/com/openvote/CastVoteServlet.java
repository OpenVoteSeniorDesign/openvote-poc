package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.http.*;
 

//COPIED FROM OPENVOTESERVLET.java
/*
 * key = key.getkey()
 * 
 * */
@SuppressWarnings("serial")
public class CastVoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		
	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	String candidate_str = req.getParameter("candidate");
    	Candidate c = new Candidate();
    	VoteKey vk = new VoteKey(UUID.randomUUID()); //TODO this needs to be checked for uniqueness
    	Vote vote = new Vote(vk, c);
    	
    	
		resp.setContentType("text/plain");
		resp.getWriter().println("You voted for " + candidate_str + ".");
		resp.getWriter().println("Your key is " + vote.getVoteKey().toString() + ".");
		
		
		//if(votmg){
		 //   -get info
		  //  -cast votes
		   // -save keys in session data
		   // -all data you save to check against
		   // -redirect to display.jsp
		//}
    }

}
