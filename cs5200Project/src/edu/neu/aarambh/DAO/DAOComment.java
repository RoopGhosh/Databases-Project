package edu.neu.aarambh.DAO;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.Agreement;
import edu.neu.aarambh.classes.Comment;
import edu.neu.aarambh.classes.Property;

public class DAOComment {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	
	
	//inserting in the table
		public int insertNewComment(String username, int propertyid, int locationid, String commdesc, String commheader, Date commdte
				,int replyid)
		{
			Comment comment = new Comment();
			comment.setCommentid(nextid());
			comment.setUsername(username);
			comment.setPropertyid(propertyid);
			comment.setLocationid(locationid);
			comment.setCommdesc(commdesc);
			comment.setCommheader(commheader);
			comment.setCommdte(commdte);
			comment.setReplyid(replyid);
			
			em.getTransaction().begin();
			em.persist(comment);
			em.getTransaction().commit();
			return comment.getCommentid();
		}
	
		//get the last primary key id from the table 
		public int nextid()
		{
			return (1 + (Integer)em.createQuery("select max(u.commentid) from Comment u").getSingleResult());

		}
		
		public List<Comment> getAllComment()
		{
			Query query = em.createQuery("select x from Comment x");
			return query.getResultList();
		}
		
		
	//finding comments by username;
	public List<Comment> findCommentbyUsername(String username)
	{
		Query query = em.createQuery("select c from Comment c Where c.username LIKE :username");
		query.setParameter("username", username);
		return query.getResultList();
	}
	
	//finding comments by locationid;
	public List<Comment> findCommentbylocation(int locationid)
	{
		Query query = em.createQuery("select c from Comment c Where c.locationid LIKE :locationid");
		query.setParameter("locationid", locationid);
		return query.getResultList();
	}
	
	//finding comments by propertyid;
	public List<Comment> findCommentbyproperty(int propertyid)
	{
		Query query = em.createQuery("select c from Comment c Where c.propertyid LIKE :propertyid");
		query.setParameter("propertyid", propertyid);
		return query.getResultList();
	}
	
	//finding comments by PK commentid;
	public Comment findCommentbyCommentid(int id)
	{
		return em.find(Comment.class, id);
	}
	
	//finding children comment of a comment;
	public List<Comment> findCommentbyChild(int id)
	{
		Query query = em.createQuery("select c from Comment c Where c.replyid LIKE :id");
		query.setParameter("id", id);
		return query.getResultList();
	}
	
	//finding comment between a range of date
	public List<Comment> findCommentbyUsername(Date startDate, Date endDate)
	{
		Query query = em.createQuery("select c from Comment c Where c.commdte > :startDate AND c.commdte < :endDate");
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		return query.getResultList();
	}
	
	/*public static void main (String[] args){
		DAOComment comment = new DAOComment();
		java.util.Date utilDate = new java.util.Date();
		   java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		//int i = comment.insertNewComment("roop", 2, 10, "hello world", "header", sqlDate, 0);
		//System comment.findCommentbyChild(14);
		   System.out.println(comment.findCommentbyChild(14).get(0).getUsername());
	}*/
	
	
}
