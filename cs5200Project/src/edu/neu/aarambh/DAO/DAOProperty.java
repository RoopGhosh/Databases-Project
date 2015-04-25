package edu.neu.aarambh.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Location;
import edu.neu.aarambh.classes.Property;

public class DAOProperty {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
	public int insertNewProperty(String propertyname, int locationid,String propertytype, int amenityid, String address,String city, String state, int zip, int price, String url, String guiid)
	{
		Property prop = new Property();
		prop.setPropertyid(nextid());
		prop.setPropertyname(propertyname);
		prop.setLocationid(locationid);
		prop.setPropertytype(propertytype);
		prop.setAmenityid(amenityid);
		prop.setAddress(address);
		prop.setCity(city);
		prop.setState(state);
		prop.setZip(zip);
		prop.setPrice(price);
		prop.setUrl(url);
		prop.setGuiid(guiid);
		em.getTransaction().begin();
		em.persist(prop);
		em.getTransaction().commit();
		return prop.getPropertyid();
		}
	
	//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.propertyid) from Property u").getSingleResult());

		}
	
	
	//finding using the propertyID
	public Property findPropertybyLocationId(int id)
	{
		return em.find(Property.class, id);
	}
	
	
	//finding Property using guiid
	public List<Property> findPropertythruGuiid(String guiid)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.guiid LIKE :guiid" );
		query.setParameter("guiid", guiid);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
	public Boolean checkRedundantProperty(String guiid)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.guiid LIKE :guiid" );
		query.setParameter("guiid", guiid);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		Property prop = (Property) query.getSingleResult();
		System.out.println(prop.getAddress());
		return true;
		
//		if(prop.())
//		{
//			return true;
//		}
//		else
//		{
//			System.console();
//			return false;
//		}
//		
		
	}
	
	//finding property thru 
	//propertytype
	public List<Property> findPropertybyPropertyType(String arg)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.propertytype LIKE :type" );
		query.setParameter("type", arg);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
	//finding property thru amenity id
	public List<Property> findPropertybyAmenityId(int id)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.amenityid LIKE :type" );
		query.setParameter("type", id);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	//finding property thru propertyname
	public List<Property> findPropertybyAddress(String arg)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.address LIKE :type" );
		query.setParameter("type", arg);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	//finding property thru city
	public List<Property> findPropertybyCity(String arg)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.city LIKE :type" );
		query.setParameter("type", arg);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
	//find property thru state
	public List<Property> findPropertybyState(String arg)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.state LIKE :type" );
		query.setParameter("type", arg);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	//finding api thru zip
	public List<Property> findPropertybyZip(int id)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.zip LIKE :type" );
		query.setParameter("type", id);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
	//finding api thru prices
	public List<Property> findPropertybyPrice(int maxprice, int minprice)
	{
		Query query = em.createQuery("SELECT a  FROM Property a WHERE a.price > :minprice AND a.price < :maxprice" );
		query.setParameter("minprice", minprice);
		query.setParameter("maxprice", maxprice);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
//	public static void main (String[] args)
//	{
//		DAOProperty prop = new DAOProperty();
//		List<Property> properties = prop.findPropertybyZip(2215);
//		for (Property p : properties)
//		{
//			System.out.println(p.getPropertyname());
//		}
//	}
}
