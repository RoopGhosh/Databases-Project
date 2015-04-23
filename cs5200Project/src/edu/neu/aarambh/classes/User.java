package edu.neu.aarambh.classes;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class User {

	@Id
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private Date dob;
	private Integer phnumber;
	private String email;
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
	
	public Integer getphnumber() {
		return phnumber;
	}
	public void setPhno(Integer phnumber) {
		this.phnumber = phnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(String username, String password, String firstname,
			String lastname, Date dob, Integer phno, String email) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.phnumber = phno;
		this.email = email;
	}
	public User() {
		super();
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
}
