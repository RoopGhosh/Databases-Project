package edu.neu.aarambh.classes;



import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Comment {

	@Id
	private Integer commentid;
	private String username;
	private Integer propertyid;
	private Integer locationid;
	private String commheader;
	private String commdesc;
	private Date commdte;
	public Integer getCommentid() {
		return commentid;
	}
	public void setCommentid(Integer commentid) {
		this.commentid = commentid;
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
	public Integer getLocationid() {
		return locationid;
	}
	public void setLocationid(Integer locationid) {
		this.locationid = locationid;
	}
	public String getCommheader() {
		return commheader;
	}
	public void setCommheader(String commheader) {
		this.commheader = commheader;
	}
	public String getCommdesc() {
		return commdesc;
	}
	public void setCommdesc(String commdesc) {
		this.commdesc = commdesc;
	}
	
	public Comment(Integer commentid, String username, Integer propertyid,
			Integer locationid, String commheader, String commdesc, Date commdte) {
		super();
		this.commentid = commentid;
		this.username = username;
		this.propertyid = propertyid;
		this.locationid = locationid;
		this.commheader = commheader;
		this.commdesc = commdesc;
		this.commdte = commdte;
	}
	public Comment() {
		super();
	}
	public Date getCommdte() {
		return commdte;
	}
	public void setCommdte(Date commdte) {
		this.commdte = commdte;
	}
	
}
