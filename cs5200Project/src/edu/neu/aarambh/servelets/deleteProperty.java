package edu.neu.aarambh.servelets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import edu.neu.aarambh.DAO.DAOShortlist;

public class deleteProperty extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
        				HttpSession s = request.getSession();
                String category = request.getParameter("category");
                int propertyid = Integer.parseInt(category);
                System.out.println(category);
                DAOShortlist shortlist = new DAOShortlist();
                shortlist.deleteMyProperty(s.getAttribute("currentSessionUser").toString(),propertyid);
        }
}