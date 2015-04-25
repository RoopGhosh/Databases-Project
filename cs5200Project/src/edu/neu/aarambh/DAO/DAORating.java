package edu.neu.aarambh.DAO;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Property;
import edu.neu.aarambh.classes.Rating;

public class DAORating {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	//inserting in the table
		public int insertNewRating(int propertyid, String username,double ratingpts, int mkpublic)
		{
			Rating rating = new Rating();
			rating.setRatingid(nextid());
			rating.setPropertyid(propertyid);
			rating.setUsername(username);
			rating.setRatingpts(ratingpts);
			rating.setMkpublic(mkpublic);
			em.getTransaction().begin();
			em.persist(rating);
			em.getTransaction().commit();
			return rating.getRatingid();
			}
		
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.ratingid) from Rating u").getSingleResult());

		}
	
	//find ratings thru username
	public List<Rating> findRatingsbyUsername(String username)
	{
		Query query = em.createQuery("SELECT a  FROM Rating a WHERE a.username LIKE :type" );
		query.setParameter("type", username);
		//query.executeUpdate();
		return query.getResultList();
	}
	
	//find ratings thru propertyid
	public List<Rating> findRatingsbyPropertyId(int propertyid)
	{
		Query query = em.createQuery("SELECT a  FROM Rating a WHERE a.propertyid LIKE :type" );
		query.setParameter("type", propertyid);
		//query.executeUpdate();
		return query.getResultList();
	}
	
	//return propertyids whose ratingpts is more than argument
	public List<Integer> findPropertyIdForGivenRating(int points)
	{
		Query query = em.createQuery("SELECT a  FROM Rating a WHERE a.ratingpts > :type" );
		query.setParameter("type", points);
		List<Rating> ratings = query.getResultList();
		ArrayList<Integer> array = new ArrayList<Integer>();
		for(Rating rate : ratings)
		{
			array.add(rate.getPropertyid());
		}
		return array;
	}
	
	//return ratings which are public
	public List<Rating> findMkPublicForGivenRating()
	{
		Query query = em.createQuery("SELECT a  FROM Rating a WHERE a.mkpublic LIKE 0");
		// where 0 is a public view and anything other than 0 is non public.
		return query.getResultList();
	}
	
	public static void main (String[] args){
		DAORating dao = new DAORating();
		dao.insertNewRating(1, "roop", 21, 0);
	}
	
}
