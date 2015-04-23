package edu.neu.aarambh.DAO;

import java.util.List;

import edu.neu.aarambh.classes.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;


@Path("/agreement")
public class DAOAggrement {


	EntityManagerFactory factory = Persistence.createEntityManagerFactory("assignment5");
	EntityManager em = factory.createEntityManager();
	
	//search using a username
	@GET
	@Path("/username/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Agreement> findAgreementByUser(@PathParam("id") String username)
	{		
		Query query = em.createNativeQuery("select * from aggrement where username = ?" );
		query.setParameter(1,username);
		return query.getResultList();
	}
	
	//search using a propertyid
	@GET
	@Path("/propertyid/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Agreement> findAgreementByUser(@PathParam("id") Integer id)
	{		 
		Query query = em.createNativeQuery("select * from aggrement where propertyid = ?" );
		query.setParameter(1,id);
		return query.getResultList();
	}
	
	//inserts a new entry in the table
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	public void createNewAggrement(Agreement arg)
	{
		em.getTransaction().begin();
		em.persist(arg);
		em.getTransaction().commit();
	}
}
