package com.website.src.tables;


import javax.persistence.*;

@Entity
public class Tower{

	@Id
	private Integer Id;
	private String name;
	private Integer height;
	private Integer sides;
	private Integer sidesId;
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
	public Integer getSidesId() {
		return sidesId;
	}
	public void setSidesId(Integer sidesId) {
		this.sidesId = sidesId;
	}
	public Tower(Integer id, String name, Integer height, Integer sides,
			Integer sidesId) {
		super();
		Id = id;
		this.name = name;
		this.height = height;
		this.sides = sides;
		this.sidesId = sidesId;
	}
	public Tower() {
		super();
	}	
}
