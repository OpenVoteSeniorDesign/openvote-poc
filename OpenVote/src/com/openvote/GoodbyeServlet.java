package com.openvote;


import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  
public class GoodbyeServlet extends HttpServlet {
	

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	//end session
    	HttpSession session=req.getSession();  
        session.invalidate(); 
    	
        resp.sendRedirect("/goodbye.jsp");
    }

}
