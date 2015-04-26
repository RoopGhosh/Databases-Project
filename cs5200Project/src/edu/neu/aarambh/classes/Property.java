package edu.neu.aarambh.classes;
import java.util.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Entity;
@Entity
public class Property {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer propertyid;
	private String propertyname;
	private Integer locationid;
	private String propertytype;
	private Integer amenityid;
	private String address;
	private String city;
	private String state;
	private String zip;
	private Integer price;
	private String url;
	private String guiid;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getGuiid() {
		return guiid;
	}
	public void setGuiid(String guiid) {
		this.guiid = guiid;
	}
	public Property(Integer propertyid, String propertyname,
			Integer locationid, String propertytype, Integer amenityid,
			String address, String city, String state, String zip,
			Integer price, String url, String guiid) {
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
		this.url = url;
		this.guiid = guiid;
	}
	public Property() {
		super();
	}
	


}
