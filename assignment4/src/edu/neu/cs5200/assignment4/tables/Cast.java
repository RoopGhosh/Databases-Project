package edu.neu.cs5200.assignment4.tables;

public class Cast {

	public String charecterString;
	public String cast2movie;
	public String cast2actor;
	
	public Cast() {
		super();
	}

	public Cast(String charecterString, String cast2movie, String cast2actor) {
		super();
		this.charecterString = charecterString;
		this.cast2movie = cast2movie;
		this.cast2actor = cast2actor;
	}

	public String getCharecterString() {
		return charecterString;
	}

	public void setCharecterString(String charecterString) {
		this.charecterString = charecterString;
	}

	public String getCast2movie() {
		return cast2movie;
	}

	public void setCast2movie(String cast2movie) {
		this.cast2movie = cast2movie;
	}

	public String getCast2actor() {
		return cast2actor;
	}

	public void setCast2actor(String cast2actor) {
		this.cast2actor = cast2actor;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
