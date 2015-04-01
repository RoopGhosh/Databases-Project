package edu.neu.cs5200.assignment4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.neu.cs5200.assignment4.tables.Actor;

public class ActorManager {
	Connection conn;
	public ActorManager()
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
	
	//create actor
	public void createActor(Actor actor)
	{
		String sql = "insert into Actor values (?,?,?,?)";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, actor.getId());
			statement.setString(2, actor.getFirstName());
			statement.setString(3, actor.getLastName());
			statement.setString(4, actor.getDate());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Actor> readAllActors()
	{
		List<Actor> actors = new ArrayList<Actor>();
		String sql = "select * from actor";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Actor actor = new Actor();
				actor.setId(results.getString("id"));
				actor.setFirstName(results.getString("firstName"));
				actor.setLastName(results.getString("id"));
				actor.setDate(results.getString("dateOfBirth"));
				actors.add(actor);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return actors;
	}
	public Actor readActor(int id)
	{
		Actor actor = new Actor();
		String sql = "select * from actor where id = id";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			if(results.next())
			{
				actor.setId(results.getString("id"));
				actor.setFirstName(results.getString("firstName"));
				actor.setLastName(results.getString("id"));
				actor.setDate(results.getString("dateOfBirth"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return actor;
	}
	
	
	public void updateActor(String actorId, Actor actor)
	{
		String sql = "update actor set firstName =?"
				+ ", lastName = ?, dateOfBirth =? where id = actorId";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, actor.getFirstName());
			statement.setString(2, actor.getLastName());
			statement.setString(3, actorId);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteActor(String actorId)
	{
		String sql = "delete from actor where id=?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, actorId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
