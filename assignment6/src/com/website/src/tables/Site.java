package com.website.src.tables;



import java.util.List;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

@Entity

@NamedQueries(value = { @NamedQuery(
		name = "findAllSites",
		query = "select site from Site site") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Site{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@XmlAttribute
	private String name;
	@XmlAttribute
	private String latitude;
	@XmlAttribute
	private String longitude;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public Site(Integer id, String name, String latitude, String longitude) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public Site() {
		super();
	}
}
