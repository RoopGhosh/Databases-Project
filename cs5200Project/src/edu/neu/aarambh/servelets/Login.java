package edu.neu.aarambh.servelets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.neu.aarambh.DAO.DAOUser;
import edu.neu.aarambh.classes.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
			         
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{	    
 
		     User user = new User();
		     user.setUsername(request.getParameter("username"));
		     user.setPassword(request.getParameter("password"));
 
		     DAOUser dao = new DAOUser();
		     Boolean b= dao.findUser(user.getUsername(), user.getPassword());
			   		    
		     if(b == false)
		     {
		    	 response.sendRedirect("login.jsp"); //error page
		     }
		     else 
		     {
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",user.getUsername());
		          response.sendRedirect("LoginAarambh.jsp"); //logged-in page 
		     }
		}
		
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
 

	}

}
