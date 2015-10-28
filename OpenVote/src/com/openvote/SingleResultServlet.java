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
