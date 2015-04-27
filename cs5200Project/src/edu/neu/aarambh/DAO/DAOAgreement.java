package edu.neu.aarambh.DAO;

import java.sql.Date;
import java.util.List;

import edu.neu.aarambh.classes.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class DAOAgreement {


	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	

	//inserting in the table
	public void insertNewAgreement(String description, String username, int propertyid)
	{
		Agreement agreement = new Agreement();
		agreement.setAggid(nextid());
		agreement.setDescription(description);
		agreement.setUsername(username);
		agreement.setPropertyid(propertyid);
		
		em.getTransaction().begin();
		em.persist(agreement);
		em.getTransaction().commit();
	}
	
	
	public int nextid()
	{
		return (1 + (Integer)em.createQuery("select max(u.aggid) from Agreement u").getSingleResult());

	}
	
	public List<Agreement> getAllAgreement()
	{
		Query query = em.createQuery("select x from Agreement x");
		return query.getResultList();
	}
	
	
	//search using a username
	public List<Agreement> findAgreementByUser(String username)
	{		
		Query query = em.createQuery("select a from Agreement a WHERE a.username LIKE :username");
		query.setParameter("username",username);
		return query.getResultList();
	}
	
	
	// search aggrement by propertyId
	public List<Agreement> findAgreementByproperty(Integer id)
	{		 
		Query query = em.createQuery("select a from Agreement a WHERE a.propertyid LIKE :id");
		query.setParameter("id",id);
		return query.getResultList();
	}
	
	//inserts a new entry in the table
	public void createNewAggrement(Integer id, String description, String username, Integer propertyid)
	{
		Agreement agreement = new Agreement();
		agreement.setAggid(id);
		agreement.setDescription(description);
		User user = new User();
		user = em.find(User.class, username);
		agreement.setUsername(user.getUsername());
		agreement.setPropertyid(propertyid);
		
		em.getTransaction().begin();
		em.persist(agreement);
		em.getTransaction().commit();
	}
	/*public static void main (String[] args)
	{
		DAOAgreement agree = new DAOAgreement();
		//agree.createNewAggrement(1,"hello there", "roop", 1);
		List<Agreement> ag = agree.findAgreementByUser("roop");
	}*/
}
