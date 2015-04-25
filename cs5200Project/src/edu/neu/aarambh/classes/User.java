package edu.neu.aarambh.classes;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.eclipse.persistence.jpa.config.Cascade;
@Entity
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private Date dob;
	private Integer phnumber;
	private String email;
	//@OneToMany(targetEntity = Agreement.class, mappedBy = "user", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	//private List<Agreement> agreements;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Integer getPhnumber() {
		return phnumber;
	}
	public void setPhnumber(Integer phnumber) {
		this.phnumber = phnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/*public List<Agreement> getAgreements() {
		return agreements;
	}
	public void setAgreements(List<Agreement> agreements) {
		this.agreements = agreements;
	}*/
	public User(String username, String password, String firstname,
			String lastname, Date dob, Integer phnumber, String email,
			List<Agreement> agreements) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.phnumber = phnumber;
		this.email = email;
		//this.agreements = agreements;
	}
	public User() {
		super();
	}
		
}
