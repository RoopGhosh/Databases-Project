package edu.neu.aarambh.classes;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Location {

	@Id
	private Integer locationid;
	private String locname;
	private String description;
	private Double latitude;
	private Double longitude;
	private String city;
	private String state;
	private Integer zip;
	public Integer getLocationid() {
		return locationid;
	}
	public void setLocationid(Integer locationid) {
		this.locationid = locationid;
	}
	public String getLocname() {
		return locname;
	}
	public void setLocname(String locname) {
		this.locname = locname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
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
	public Location(Integer locationid, String locname, String description,
			Double latitude, Double longitude, String city, String state,
			Integer zip) {
		super();
		this.locationid = locationid;
		this.locname = locname;
		this.description = description;
		this.latitude = latitude;
		this.longitude = longitude;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}
	public Location() {
		super();
	}
}
