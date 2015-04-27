package edu.neu.aarambh.classes;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class History {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer histid;
	private String username;
	private Date cdate;
	private Integer commid;
	private Integer queryid;
	private Integer propertyid;
	private String description;
	public Integer getHistid() {
		return histid;
	}
	public void setHistid(Integer histid) {
		this.histid = histid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public Integer getCommid() {
		return commid;
	}
	public void setCommid(Integer commid) {
		this.commid = commid;
	}
	public Integer getQueryid() {
		return queryid;
	}
	public void setQueryid(Integer queryid) {
		this.queryid = queryid;
	}
	public Integer getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(Integer propertyid) {
		this.propertyid = propertyid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public History(Integer histid, String username, Date cdate, Integer commid,
			Integer queryid, Integer propertyid, String description) {
		super();
		this.histid = histid;
		this.username = username;
		this.cdate = cdate;
		this.commid = commid;
		this.queryid = queryid;
		this.propertyid = propertyid;
		this.description = description;
	}
	public History() {
		super();
	}
	}
