package edu.neu.cs5200.assignment4.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.neu.cs5200.assignment4.tables.Movie;

public class MovieManager {
	Connection conn;
	public MovieManager()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn =
				       DriverManager.getConnection
				       ("jdbc:mysql://localhost:3306/test","root","123456");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void createMovie(Movie movie)
	{
		String sql = "insert into Movie values (?,?,?,?)";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, movie.getId());
			statement.setString(2, movie.getTitle());
			statement.setString(3, movie.getPosterimage());
			statement.setString(4, movie.getReleaseDate());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<Movie> readAllMovies()
	{
		List<Movie> movies = new ArrayList<Movie>();
		String sql = "select * from movie";
		
			
			ResultSet results;
			try {
				PreparedStatement statement = conn.prepareStatement(sql);
				results = statement.executeQuery();
				while (results.next())
				{
					Movie movie = new Movie();
					movie.setId(results.getString("id"));
					movie.setTitle(results.getString("title"));
					movie.setPosterimage(results.getString("posterImage"));
					movie.setReleaseDate(results.getString("releaseDate"));
					movies.add(movie);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return movies;
	}
	
	public Movie readMovie(String movieId)
	{
		Movie movie = new Movie();
		String sql = "select * from movie where id = movieId";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			if(results.next())
			{
				movie.setId(movieId);
				movie.setTitle(results.getString("title"));
				movie.setPosterimage(results.getString("posterImage"));
				movie.setReleaseDate(results.getString("releaseDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return movie;
	}
	
	public void updateMovie(String movieId, Movie movie)
	{
		String sql = "update movie set title =?"
				+ ", posterImage = ?, releaseDate = ?, where id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, movie.getId());
			statement.setString(2, movie.getTitle());
			statement.setString(3, movie.getPosterimage());
			statement.setString(4, movie.getReleaseDate());
			statement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteMovie(String movieId)
	{
		String sql = "delete from movie where id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, movieId);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		public static void main(String[] args) {
			// TODO Auto-generated method stub

		}

	}

