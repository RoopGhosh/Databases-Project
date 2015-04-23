package edu.neu.aarambh.classes;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Agreement {

	@Id
	private Integer aggid;
	private String description;
	private String username;
	private Integer propertyid;
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
	public Agreement(Integer aggid, String description, String username,
			Integer propertyid) {
		super();
		this.aggid = aggid;
		this.description = description;
		this.username = username;
		this.propertyid = propertyid;
	}
	public Agreement() {
		super();
	}
	
}
