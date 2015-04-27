package edu.neu.aarambh.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Prop_amen_map;
import edu.neu.aarambh.classes.Property;

public class DAOProp_amen_map {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	public int insertNewProp_amen_map(int propertyid, int amenityid)
	{
		Prop_amen_map mapper = new Prop_amen_map();
		mapper.setId(nextid());
		mapper.setPropertyid(propertyid);
		mapper.setAmenityid(amenityid);
		em.getTransaction().begin();
		em.persist(mapper);
		em.getTransaction().commit();
		return mapper.getId();
	}
	
	//finding list of Prop_amen_map thru propertyid
	public List<Prop_amen_map> findProp_amen_mapbyPropertyid(int propertyid)
	{
		Query query = em.createQuery("SELECT a FROM Prop_amen_map a WHERE a.propertyid LIKE :type" );
		query.setParameter("type", propertyid);
		//query.setParameter("field", field);
		//query.setParameter("arg", arg);
		return query.getResultList();
	}
	
	public List<Prop_amen_map> getAllProp_amen_map()
	{
		Query query = em.createQuery("select x from Prop_amen_map x");
		return query.getResultList();
	}
	
	//get the last primary key id from the table 
	public int nextid()
	{
		return (1 + (Integer)em.createQuery("select max(u.id) from Prop_amen_map u").getSingleResult());

	}
	
//	public static void main (String[] args){
//		DAOProp_amen_map mapp = new DAOProp_amen_map();
//		int id = mapp.insertNewProp_amen_map(1, 1);
//		System.out.println(id);
//	}
	
	
	
}
