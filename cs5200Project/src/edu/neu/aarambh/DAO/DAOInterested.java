package edu.neu.aarambh.DAO;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Interested;
import edu.neu.aarambh.classes.User;

public class DAOInterested {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
		public int insertNewInterested(String querytitle, String querydesc, String quecategory, int minprice ,int maxprice, String location)
		{
			Interested interested = new Interested();
			interested.setQueryid(nextid());
			interested.setQuerytitle(querytitle);
			interested.setLocation(location);
			interested.setMaxprice(maxprice);
			interested.setMinprice(minprice);
			interested.setQuecategory(quecategory);
			interested.setQuerydesc(querydesc);
			em.getTransaction().begin();
			em.persist(interested);
			em.getTransaction().commit();
			return interested.getQueryid();
			}
		
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.queryid) from Interested u").getSingleResult());

		}
	public List<Interested> findQuerybycategory(String category)
	{
		Query query = em.createQuery("select q from Interested q WHERE q.quecategory LIKE :category");
		query.setParameter("category", category);
		return query.getResultList();
	}
	
	
	// lot of scope while inserting items
	
}
