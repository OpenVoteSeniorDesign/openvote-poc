package com.openvote;


import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoodbyeServlet extends HttpServlet {
	

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	// any clean-up required here?
    	
    	resp.sendRedirect("/goodbye.jsp");
    }

}
