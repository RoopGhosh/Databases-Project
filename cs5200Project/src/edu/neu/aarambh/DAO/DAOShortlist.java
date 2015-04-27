package edu.neu.aarambh.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Property;
import edu.neu.aarambh.classes.Rating;
import edu.neu.aarambh.classes.Shortlist;

public class DAOShortlist {


	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
		public int insertNewShortlist(String username, int propertyid)
		{
			Shortlist shortlist = new Shortlist();
			shortlist.setShortlistid(nextid());
			shortlist.setUsername(username);
			shortlist.setPropertyid(propertyid);
			em.getTransaction().begin();
			em.persist(shortlist);
			em.getTransaction().commit();
			return shortlist.getShortlistid();
			}
		
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.shorlistid) from Shortlist u").getSingleResult());

		}
		
		public List<Shortlist> getAllShortlist()
		{
			Query query = em.createQuery("select x from Shortlist x");
			return query.getResultList();
		}
		
	//returns the list of propertyid shortlisted by the user
	public ArrayList<Integer> getPropertyIdfromShortlistByUser(String username)
	{
		Query query = em.createQuery("SELECT a  FROM Shortlist a WHERE a.username LIKE :type" );
		query.setParameter("type", username);
		//query.executeUpdate();
		List<Rating> ratings = query.getResultList();
		ArrayList<Integer> array = new ArrayList<Integer>();
		for(Rating rate : ratings)
		{
			array.add(rate.getPropertyid());
		}
		return array; 
	}
}
