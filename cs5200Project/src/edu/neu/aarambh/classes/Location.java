package edu.neu.aarambh.classes;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Location {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer locationid;
	private String locname;
	private String description;
	private float latitude;
	private float longitude;
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
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude2) {
		this.latitude = latitude2;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
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
			float latitude, float longitude, String city, String state,
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
