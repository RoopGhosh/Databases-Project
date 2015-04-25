package edu.neu.aarambh.classes;

import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SqlResultSetMapping;

@Entity
public class Amenity {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer amenityid;
	private String amenname;
	private String amentype;
	private String description;
	
	
	public Integer getAmenityid() {
		return amenityid;
	}
	public void setAmenityid(Integer amenityid) {
		this.amenityid = amenityid;
	}
	public String getAmenname() {
		return amenname;
	}
	public void setAmenname(String amenname) {
		this.amenname = amenname;
	}
	public String getAmentype() {
		return amentype;
	}
	public void setAmentype(String amentype) {
		this.amentype = amentype;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Amenity(Integer amenityid, String amenname, String amentype,
			String description) {
		super();
		this.amenityid = amenityid;
		this.amenname = amenname;
		this.amentype = amentype;
		this.description = description;
	}
	public Amenity() {
		super();
	}
	
	
}
