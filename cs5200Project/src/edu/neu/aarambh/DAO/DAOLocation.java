package edu.neu.aarambh.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Interested;
import edu.neu.aarambh.classes.Location;

public class DAOLocation {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
			public int insertNewLocation(String locname, String description, Double latitude, Double longitude ,String city, String state, String zip)
			{
				Location location = new Location();
				location.setLocationid(nextid());
				location.setLocname(locname);
				location.setDescription(description);
				location.setLatitude(latitude);
				location.setLongitude(longitude);
				location.setCity(city);
				location.setState(state);
				location.setZip(zip);
				em.getTransaction().begin();
				em.persist(location);
				em.getTransaction().commit();
				return location.getLocationid();
				}
	
			//get the last primary key id from the table 
			public int nextid()
			{
				return (1 + (Integer)em.createQuery("select max(u.locationid) from Location u").getSingleResult());

			}
	
	
	// generic function to run all the query for the table which takes one string argument
	//locname
	//city
	//state
	public List<Location> findLocation(String field , String locname)
	{
		Query query = em.createQuery("select x from Location x where x.:field LIKE :locname");
		query.setParameter("field", field);
		query.setParameter("locname", locname);
		return query.getResultList();
	}
	
	//finding using latitude and longitude
	public List<Location> findLocationbyLatlong(Double latitude, Double longitude)
	{
		Query query = em.createQuery("select x from Location x where x.latitude LIKE :latitude and x.longitude LIKE :longitude");
		query.setParameter("latitude", latitude);
		query.setParameter("longitude", longitude);
		return query.getResultList();
	}
	
	//finding location using zip
	public List<Location> findLocationbyZip(int zip)
	{
		Query query = em.createQuery("select x from Location x where x.zip LIKE :zip");
		query.setParameter("zip", zip);
		return query.getResultList();
	}
	
	//finding location using locationid
	public Location findLocationbyLocationId(int id)
	{
		return em.find(Location.class, id);
	}
}
