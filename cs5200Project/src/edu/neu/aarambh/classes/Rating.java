package edu.neu.aarambh.classes;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Rating {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer ratingid;
	private String username;
	private Integer propertyid;
	private Double ratingpts;
	private Integer mkpublic;
	public Integer getRatingid() {
		return ratingid;
	}
	public void setRatingid(Integer ratingid) {
		this.ratingid = ratingid;
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
	public Double getRatingpts() {
		return ratingpts;
	}
	public void setRatingpts(Double ratingpts) {
		this.ratingpts = ratingpts;
	}
	public Integer getMkpublic() {
		return mkpublic;
	}
	public void setMkpublic(Integer mkpublic) {
		this.mkpublic = mkpublic;
	}
	public Rating(Integer ratingid, String username, Integer propertyid,
			Double ratingpts, Integer mkpublic) {
		super();
		this.ratingid = ratingid;
		this.username = username;
		this.propertyid = propertyid;
		this.ratingpts = ratingpts;
		this.mkpublic = mkpublic;
	}
	public Rating() {
		super();
	}
	
}
