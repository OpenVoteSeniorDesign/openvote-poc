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

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

	}
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
		//verify login by getting login and password from req
		//if correct, redirect to castvote.jsp
		//else, redirect to error message / login screen?
        resp.sendRedirect("/castvote.jsp");
    }
	

}
