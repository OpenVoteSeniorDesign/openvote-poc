package com.openvote;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class SingleResultServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        //get election from glcoud
    	//List<Vote> voteList = ObjectifyService.ofy().load().type(Vote.class).filter("published ==", true).list();

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
           //shows on screen
    	//System.out.println("Hello! Results Servlet has been invotked! \n");
    	//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewAllVotes.jsp");
		//try
		//{
		//	dispatcher.forward(req, resp);
		//} catch (ServletException e)
		//{
		//	e.printStackTrace();
		//}
	}

}
