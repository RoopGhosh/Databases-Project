package edu.neu.aarambh.classes;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Interested {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer queryid;
	private String querytitle;
	private String querydesc;
	private String quecategory;
	private Integer minprice;
	private Integer maxprice;
	private String location;
	public Integer getQueryid() {
		return queryid;
	}
	public void setQueryid(Integer queryid) {
		this.queryid = queryid;
	}
	public String getQuerytitle() {
		return querytitle;
	}
	public void setQuerytitle(String querytitle) {
		this.querytitle = querytitle;
	}
	public String getQuerydesc() {
		return querydesc;
	}
	public void setQuerydesc(String querydesc) {
		this.querydesc = querydesc;
	}
	public String getQuecategory() {
		return quecategory;
	}
	public void setQuecategory(String quecategory) {
		this.quecategory = quecategory;
	}
	public Integer getMinprice() {
		return minprice;
	}
	public void setMinprice(Integer minprice) {
		this.minprice = minprice;
	}
	public Integer getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(Integer maxprice) {
		this.maxprice = maxprice;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Interested(Integer queryid, String querytitle, String querydesc,
			String quecategory, Integer minprice, Integer maxprice,
			String location) {
		super();
		this.queryid = queryid;
		this.querytitle = querytitle;
		this.querydesc = querydesc;
		this.quecategory = quecategory;
		this.minprice = minprice;
		this.maxprice = maxprice;
		this.location = location;
	}
	public Interested() {
		super();
	}
	
}
