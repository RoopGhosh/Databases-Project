package edu.neu.aarambh.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Prop_amen_map {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer propertyid;
	private Integer amenityid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(int propertyid) {
		this.propertyid = propertyid;
	}
	public int getAmenityid() {
		return amenityid;
	}
	public void setAmenityid(int amenityid) {
		this.amenityid = amenityid;
	}
	public Prop_amen_map(int id, int propertyid, int amenityid) {
		super();
		this.id = id;
		this.propertyid = propertyid;
		this.amenityid = amenityid;
	}
	public Prop_amen_map() {
		super();
	}
}
