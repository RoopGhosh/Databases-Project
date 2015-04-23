package edu.neu.aarambh.DAO;
import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.aarambh.classes.*;

public class DAOUser {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("cs5200Project");
	EntityManager em = factory.createEntityManager();
	

	public void insertNewUser(String username, String password, String firstname, String lastname, Date date, Integer phno, String email)
	{
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setDob(date);
		user.setPhno(phno);
		user.setEmail(email);
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		}
	
/*public static void main(String[] args) {
		
		DAOUser user = new DAOUser();
		Date date = new Date(12031990);
	
		user.insertNewUser("roop", "123", "roop", "kumar", date , 900, "adasd@gmial.com");

	}*/
}

