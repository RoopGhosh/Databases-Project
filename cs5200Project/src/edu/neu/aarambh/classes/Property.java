package edu.neu.aarambh.classes;

import javax.persistence.Id;
import javax.persistence.Entity;
@Entity
public class Property {

	@Id
	private Integer propertyid;
	private String propertyname;
	private Integer locationid;
	private String propertytype;
	private Integer amenityid;
	private String address;
	private String city;
	private String state;
	private Integer zip;
	private Integer price;
	public Integer getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(Integer propertyid) {
		this.propertyid = propertyid;
	}
	public String getPropertyname() {
		return propertyname;
	}
	public void setPropertyname(String propertyname) {
		this.propertyname = propertyname;
	}
	public Integer getLocationid() {
		return locationid;
	}
	public void setLocationid(Integer locationid) {
		this.locationid = locationid;
	}
	public String getPropertytype() {
		return propertytype;
	}
	public void setPropertytype(String propertytype) {
		this.propertytype = propertytype;
	}
	public Integer getAmenityid() {
		return amenityid;
	}
	public void setAmenityid(Integer amenityid) {
		this.amenityid = amenityid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getZip() {
		return zip;
	}
	public void setZip(Integer zip) {
		this.zip = zip;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Property(Integer propertyid, String propertyname,
			Integer locationid, String propertytype, Integer amenityid,
			String address, String city, String state, Integer zip,
			Integer price) {
		super();
		this.propertyid = propertyid;
		this.propertyname = propertyname;
		this.locationid = locationid;
		this.propertytype = propertytype;
		this.amenityid = amenityid;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.price = price;
	}
	public Property() {
		super();
	}
}