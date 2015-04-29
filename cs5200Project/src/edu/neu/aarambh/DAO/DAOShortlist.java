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
			return (1 + (Integer)em.createQuery("SELECT max(u.shortlistid) from Shortlist u").getSingleResult());

		}
		
		public List<Shortlist> getAllShortlist()
		{
			Query query = em.createQuery("select x from Shortlist x");
			return query.getResultList();
		}
		
		
		//get propertyidlist by user
		public ArrayList<Integer> getPropertyfromShortlistByUser(String username)
		{
			ArrayList<Integer> mylist = new ArrayList<Integer>();
			Query query = em.createQuery("select u from Shortlist u where u.username LIKE :username");
			query.setParameter("username", username);
			List<Shortlist> stl = query.getResultList();
			for (int i = 0; i< stl.size(); i++)
			{
				mylist.add(stl.get(i).getPropertyid());
			}
			return mylist;
			
		}
		
		
		//getshorlist item by username and propertyid
		public List<Shortlist> findbyusernameandpropertyid(String username, int propertyid)
		{
			Query query = em.createQuery("SELECT a  FROM Shortlist a WHERE a.username LIKE :type AND a.propertyid LIKE :propertyid" );
			query.setParameter("type", username);
			query.setParameter("propertyid", propertyid);
			return query.getResultList();
		}
		
		//returns the Count of hits of the given propertyid
		public int countbyPropertyid(int propertyid)
		{
			Query query = em.createQuery("SELECT a FROM Shortlist a WHERE a.propertyid LIKE :type" );
			query.setParameter("type", propertyid);
			return query.getResultList().size();
		}
		
		//returns the count of the properties 
	
	//deleting property
	public void deleteMyProperty(String username, int id)
	{
		em.getTransaction().begin();
		DAOShortlist shortlist = new DAOShortlist();
	    Shortlist st = shortlist.findbyusernameandpropertyid(username, id).get(0);
		Shortlist a = em.merge(st);
	    em.remove(a);
		em.getTransaction().commit();
		System.out.println(st);
	}
	public static void main (String[] args)
	{
		DAOShortlist st = new DAOShortlist();
		int o = st.countbyPropertyid(123);
		System.out.println(o);
	}
}
