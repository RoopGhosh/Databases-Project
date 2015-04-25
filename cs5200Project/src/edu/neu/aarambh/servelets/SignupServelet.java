package edu.neu.aarambh.servelets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.neu.aarambh.DAO.DAOUser;

/**
 * Servlet implementation class SignupServelet
 */
@WebServlet("/SignupServelet")
public class SignupServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	    
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Date parsed;
			parsed = format.parse(request.getParameter("dob"));
		    java.util.Date utilDate = parsed;
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			Integer x = Integer.parseInt(request.getParameter("phone"));
		     DAOUser user = new DAOUser();
		     user.insertNewUser(request.getParameter("usrname"),
		    		 request.getParameter("passwd"),
		    		 request.getParameter("fname"),
		    		 request.getParameter("lname"),
		    		 sqlDate,
		    		 x,
		    		 request.getParameter("email"));
		     		} 
		
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
