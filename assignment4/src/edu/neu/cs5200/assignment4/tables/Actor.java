package edu.neu.cs5200.assignment4.tables;

//import java.util.List;

public class Actor {
	private String id;
	private String firstName;
	private String lastName;
	private String date;
	//private String firstName;
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public Actor() {
		super();
	}

	public Actor(String id, String firstName, String lastName, String date) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
