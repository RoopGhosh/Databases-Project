package edu.neu.cs5200.assignment4.tables;

import java.sql.Date;

public class User {

	public String username;
	public String password;
	public String firstName;
	public String lastName;
	public String email;
	public Date dateofBirth;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User() {
		super();
	}

	public User(String username, String password, String firstName,
			String lastName, String email, Date dateofBirth) {
		super();
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dateofBirth = dateofBirth;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateofBirth() {
		return dateofBirth;
	}

	public void setDateofBirth(Date date) {
		this.dateofBirth = date;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
