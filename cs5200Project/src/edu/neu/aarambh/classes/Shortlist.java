package edu.neu.aarambh.classes;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Entity;
@Entity
public class Shortlist {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer Shortlistid;
	private String username;
	private Integer propertyid;
	public Integer getShortlistid() {
		return Shortlistid;
	}
	public void setShortlistid(Integer shortlistid) {
		Shortlistid = shortlistid;
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
	public Shortlist(Integer shortlistid, String username, Integer propertyid) {
		super();
		Shortlistid = shortlistid;
		this.username = username;
		this.propertyid = propertyid;
	}
	public Shortlist() {
		super();
	}
	
}
