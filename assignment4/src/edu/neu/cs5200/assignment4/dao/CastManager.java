package edu.neu.cs5200.assignment4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.neu.cs5200.assignment4.tables.Cast;

public class CastManager {
	Connection conn;
	public CastManager()
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
	
	public void createCast(Cast cast)
	{
		String sql = "insert into cast values (?,?,?,?)";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, cast.getCharecterString());
			statement.setString(2, cast.getCast2movie());
			statement.setString(3, cast.getCast2actor());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<Cast> readAllCast()
	{
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select * from cast";
		
			
			ResultSet results;
			try {
				PreparedStatement statement = conn.prepareStatement(sql);
				results = statement.executeQuery();
				while (results.next())
				{
					Cast cast = new Cast();
					cast.setCharecterString(results.getString("charecterString"));
					cast.setCast2actor(results.getString("cast2movie"));
					cast.setCast2movie(results.getString("cast2actor"));
					casts.add(cast);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return casts;
	}
	
	public List<Cast> readAllCastForActor(String actorId)
	{
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select cast from cast where cast2actor = actorId";
		PreparedStatement statement;
	try {
		statement = conn.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		while (results.next())
		{
			Cast cast = new Cast();
			cast.setCharecterString((results.getString("charecterstring")));
			casts.add(cast);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return casts;
	}
	
	public List<Cast> readAllCastForMovie(String movieId)
	{
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select cast from cast where cast2movie = movieId";
		PreparedStatement statement;
	try {
		statement = conn.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		while (results.next())
		{
			Cast cast = new Cast();
			cast.setCharecterString((results.getString("charecterstring")));
			casts.add(cast);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return casts;
	}
	
	public Cast readCastForId(String castId)
	{
		Cast cast = new Cast();
		String sql = "select * from cast where charecterstring = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			if(results.next())
			{
				cast.setCharecterString(castId);
				cast.setCast2movie(results.getString("cast2movie"));
				cast.setCast2actor(results.getString("cast2actor"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cast;
	}
	
	public void updateCast(String castId, Cast newCast)
	{
		Cast cast = new Cast();
		String sql = "update cast set cast = ? where cast = ?";
		try{
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1,castId);
			statement.setString(2, cast.getCast2movie());
			statement.setString(3, cast.getCast2actor());
			statement.executeUpdate();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteCast(String castId)
	{
		String sql = "delete from cast where id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, castId);
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
