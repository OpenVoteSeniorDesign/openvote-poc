<%
		//TODO: use database instead of hardcoding the username/password
		//right now, username/password are passed as parameters in the URL - not secure
		
            String username = request.getParameter("username");
            String password = request.getParameter("password");
           out.println("Checked Login:<br>");
            if (username == null || password == null) {
 
                out.print("Invalid parameters");
				 out.println("<br><a href=\"login.jsp\">Go back</a>");
            }
 
            // Here you put the check on the username and password
            if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("password")) {
                out.println(" <a href=\"castvote.jsp\">Cast Vote</a>");
                session.setAttribute("username", username);
            }
           else 
               {
                out.println("Invalid username and password");
				out.println("<br><a href=\"login.jsp\">Go back</a>");
           }
%>

<c:redirect url="/home.html"/>