package edu.neu.cs5200.assignment4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import edu.neu.cs5200.assignment4.tables.User;

public class UserManager {
	Connection conn;
	public UserManager()
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
	
	public void createUser(User user)
	{
		String sql = "insert into user values (?,?,?,?,?,?)";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setString(5, user.getEmail());
			statement.setDate(6, user.getDateofBirth());
			statement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<User> readAllUsers()
	{
		List<User> users = new ArrayList<User>();
		String sql = "select * from user";
		
			
			ResultSet results;
			try {
				PreparedStatement statement = conn.prepareStatement(sql);
				results = statement.executeQuery();
				while (results.next())
				{
					User user = new User();
					user.setUsername(results.getString("username"));
					user.setUsername(results.getString("password"));
					user.setFirstName(results.getString("firstName"));
					user.setLastName(results.getString("lastName"));
					user.setEmail(results.getString("email"));
					user.setDateofBirth(results.getDate("dateofBirth"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return users;
	}
	
	
	public User readUser(String username)
	{
		User user = new User();
		String sql = "select * from user where userName = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			if(results.next())
			{
				user.setUsername(username);
				user.setUsername(results.getString("password"));
				user.setFirstName(results.getString("firstName"));
				user.setLastName(results.getString("lastName"));
				user.setEmail(results.getString("email"));
				user.setDateofBirth(results.getDate("dateofBirth"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public void updateUser(String username, User user)
	{
		String sql = "update user set password =?"
				+ ", firstname = ?, lastname =? , email = ?."
				+ "dateofBirth = ? , where id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(6, username);
			statement.setString(1, user.getPassword());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getLastName());
			statement.setString(4, user.getEmail());
			statement.setDate(5, user.getDateofBirth());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String username)
	{
		String sql = "delete from user where username=?";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
