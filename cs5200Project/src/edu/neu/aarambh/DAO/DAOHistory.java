package edu.neu.aarambh.DAO;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.History;
import edu.neu.aarambh.classes.User;

public class DAOHistory {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
		public int insertNewHistory (String username, Date cdate, int commid, int queryid ,int propertyid)
		{
			History history = new History();
			history.setHistid(nextid());
			history.setUsername(username);
			history.setCdate(cdate);
			history.setCommid(commid);
			history.setQueryid(queryid);
			history.setPropertyid(propertyid);
			em.getTransaction().begin();
			em.persist(history);
			em.getTransaction().commit();
			return history.getHistid();
			}
	
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.histid) from History u").getSingleResult());

		}
		
	//finding all the history of a username
	public List<History> getAllHistoryforUser(String username)
	{
		Query query = em.createQuery("select h from History h WHERE h.username LIKE :username");
		query.setParameter("username", username);
		return query.getResultList();
	}
	
	// there is huge scope of views in this table
}
