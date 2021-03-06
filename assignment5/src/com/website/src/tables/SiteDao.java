package com.website.src.tables;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.src.tables.*;

@Path("/site")
public class SiteDao 
{

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("assignment5");
	EntityManager em = factory.createEntityManager();
	
	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Site findSite(@PathParam("id") int siteId)
	{		 
		return em.find(Site.class, siteId);
	}
	
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> findAllSites()
	{
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	
	
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> updateSite(@PathParam("id") Integer id, Site site)
	{
//		Query query = em.createQuery("update site SET Site site WHERE Id = siteId");

		em.getTransaction().begin();
		Site thissite = em.find(Site.class, id);
		thissite = em.merge(site);
		em.getTransaction().commit();
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	
	@DELETE
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> deleteSite(@PathParam("id") Integer id, Site site) 
	{
		em.getTransaction().begin();
		Site thissite = em.find(Site.class, id);
		em.remove(thissite);
		em.getTransaction().commit();
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	
	public List<Site> removeSite(int siteId) 
	{
		em.getTransaction().begin();
		Site site = em.find(Site.class, siteId);
		em.remove(site);
		em.getTransaction().commit();
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	
	
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> createSite(Site site)
	{
		em.getTransaction().begin();
		em.persist(site);
		em.getTransaction().commit();
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	 
}
