package edu.neu.aarambh.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Agreement {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer aggid;
	private String description;
	private String username;
	private Integer propertyid;
	/*@ManyToOne
	@JoinColumn(name="agreement_fk")
	private User user;*/
	public Integer getAggid() {
		return aggid;
	}
	public void setAggid(Integer aggid) {
		this.aggid = aggid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(Integer propertyid) {
		this.propertyid = propertyid;
	}
	/*public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}*/
	public Agreement(Integer aggid, String description, String username,
			Integer propertyid, User user) {
		super();
		this.aggid = aggid;
		this.description = description;
		this.username = username;
		this.propertyid = propertyid;
		//this.user = user;
	}
	public Agreement() {
		super();
	}
	}
