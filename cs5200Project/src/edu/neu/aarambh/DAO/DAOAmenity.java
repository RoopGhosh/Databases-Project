package edu.neu.aarambh.DAO;

import java.util.List;

import javax.persistence.ColumnResult;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.SqlResultSetMapping;





import edu.neu.aarambh.classes.*;

public class DAOAmenity {
	
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
		public int insertNewAmentiy(String amenname, String amentype, String description)
		{
			Amenity amen = new Amenity();
			amen.setAmenityid(nextid());
			amen.setAmenname(amenname);
			amen.setAmentype(amentype);
			amen.setDescription(description);
			
			em.getTransaction().begin();
			em.persist(amen);
			em.getTransaction().commit();
			return amen.getAmenityid();
		}
		
	
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.amenityid) from Amenity u").getSingleResult());

		}
		
	// searching amenity table with type field
	public List<Amenity> findAmentityByType(String type)
	{
		Query query = em.createQuery("SELECT a  FROM Amenity a WHERE a.amentype LIKE :type" );
		query.setParameter("type", type);
		//query.executeUpdate();
		return query.getResultList();
	}
	
	//searching amenity table using PK amenityid
	public Amenity findAmenityById(int id)
	{
		return em.find(Amenity.class, id);
	}

	public List<Amenity> getAllAmenity()
	{
		Query query = em.createQuery("select x from Amenity x");
		return query.getResultList();
	}
	
	
	//main function
//	public static void main (String[] args)
//	{
//		DAOAmenity amen = new DAOAmenity();
//		List<Amenity> loa = amen.findAmentityByType("newTypeAmen");
//		for(Amenity many : loa) {
//			System.out.println(many.getDescription());
//			}
//		DAOAmenity am = new DAOAmenity();
//		System.out.println(am.findAmenityById(1).getAmentype());
//		amen.insertNewAmentiy("sdfsdf", "sdfsdfs", "sdfsdf");
//	}
}
