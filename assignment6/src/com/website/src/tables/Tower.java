package com.website.src.tables;


import java.util.List;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Tower{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private Integer Id;
	@XmlAttribute
	private String name;
	@XmlAttribute
	private Integer height;
	@XmlAttribute
	private Integer sides;
	//private Integer siteId;
	@ManyToOne
	@JoinColumn(name="siteId")
	@XmlTransient
	private Site site;
	@OneToMany(mappedBy="tower", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="equipment")
	private List<Equipment> equipments;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Integer getSides() {
		return sides;
	}
	public void setSides(Integer sides) {
		this.sides = sides;
	}
	public Site getSite() {
		return site;
	}
	public void setSite(Site site) {
		this.site = site;
	}
	public Tower(Integer id, String name, Integer height, Integer sides,
			Site site) {
		super();
		Id = id;
		this.name = name;
		this.height = height;
		this.sides = sides;
		this.site = site;
	}
	public Tower() {
		super();
	}
	}
