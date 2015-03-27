package edu.neu.cs5200.assignment4.tables;

public class Comment {

	public String comment;
	public String date;
	public String comment2user;
	public String comment2movie;
	public Comment() {
		super();
	}
	public Comment(String comment, String date, String comment2user,
			String comment2movie) {
		super();
		this.comment = comment;
		this.date = date;
		this.comment2user = comment2user;
		this.comment2movie = comment2movie;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getComment2user() {
		return comment2user;
	}
	public void setComment2user(String comment2user) {
		this.comment2user = comment2user;
	}
	public String getComment2movie() {
		return comment2movie;
	}
	public void setComment2movie(String comment2movie) {
		this.comment2movie = comment2movie;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
