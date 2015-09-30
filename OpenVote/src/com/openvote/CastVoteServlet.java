package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

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
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		
		//if(votmg){
		 //   -get info
		  //  -cast votes
		   // -save keys in session data
		   // -all data you save to check against
		   // -redirect to display.jsp
		//}
		
	}

}
