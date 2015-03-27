package edu.neu.cs5200.assignment4.tables;

public class Movie {

	public String id;
	public String title;
	public String posterimage;
	public String releaseDate;
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPosterimage() {
		return posterimage;
	}
	public void setPosterimage(String posterimage) {
		this.posterimage = posterimage;
	}
	public Movie() {
		super();
	}
	public Movie(String id, String title, String posterimage, String releaseDate) {
		super();
		this.id = id;
		this.title = title;
		this.posterimage = posterimage;
		this.releaseDate = releaseDate;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

}
