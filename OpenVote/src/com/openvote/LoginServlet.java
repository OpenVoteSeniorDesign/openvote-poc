package com.openvote;


import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {  
	static {
        ObjectifyService.register(com.openvote.Vote.class);
    }

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                    throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
          
        String name=request.getParameter("name");  
        String password=request.getParameter("password");  
          
        if(password.equals("password") && name.equals("admin")){  
        HttpSession session=request.getSession();  
        session.setAttribute("name",name);
        response.sendRedirect("/castvote.jsp");
 
        }  
        else{  
            out.print("Wrong username or password.<br><br>");  
            request.getRequestDispatcher("login.jsp").include(request, response);  
        }  
        out.close();  
    }  
}  