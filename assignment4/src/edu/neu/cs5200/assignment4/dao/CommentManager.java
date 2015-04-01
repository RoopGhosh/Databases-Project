package edu.neu.cs5200.assignment4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.neu.cs5200.assignment4.tables.Comment;

public class CommentManager {
	Connection conn;
	public CommentManager()
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
	
	public void createComment(Comment comment)
	{
		String sql = "insert into comment values (?,?,?,?)";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, comment.getComment());
			statement.setString(2, comment.getDate());
			statement.setString(3, comment.getComment2user());
			statement.setString(4, comment.getComment2movie());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<Comment> readAllComments()
	{
		List<Comment> comments = new ArrayList<Comment>();
		String sql = "select * from comment";
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Comment comment = new Comment();
				comment.setComment(results.getString("comment"));
				comment.setComment(results.getString("releasedate"));
				comment.setComment(results.getString("comment2movie"));
				comment.setComment(results.getString("comment2actor"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}
	public List<Comment> readAllCommentsForUsername(String username)
	{
			List<Comment> comments = new ArrayList<Comment>();
			String sql = "select * from comment where comment2user = username";
			PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Comment comment = new Comment();
				comment.setComment(results.getString("comment"));
				comment.setComment(results.getString("releasedate"));
				comment.setComment(results.getString("comment2movie"));
				comment.setComment(results.getString("comment2actor"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return comments;
	}
	
	public List<Comment> readAllCommentsForMovie(String movieId)
	{
		List<Comment> comments = new ArrayList<Comment>();
		String sql = "select * from comment where comment2movie = movieId";
		PreparedStatement statement;
	try {
		statement = conn.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		while (results.next())
		{
			Comment comment = new Comment();
			comment.setComment(results.getString("comment"));
			comment.setComment(results.getString("releasedate"));
			comment.setComment(results.getString("comment2movie"));
			comment.setComment(results.getString("comment2actor"));
			comments.add(comment);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return comments;
	}
	
	public Comment readCommentForId(String commentId)
	{
		Comment comment = new Comment();
		String sql = "select * from comment where comment = commentId";
		PreparedStatement statement;
	try {
		statement = conn.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		if(results.next())
			{
			comment.setComment(results.getString("comment"));
			comment.setComment(results.getString("releasedate"));
			comment.setComment(results.getString("comment2movie"));
			comment.setComment(results.getString("comment2actor"));
			}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return comment;
	}
	
	public void updateComment(String commentId, String newComment)
	{
		Comment comment = new Comment();
		String sql = "update comment set comment = ? where comment = commentID";
		try{
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1,newComment);
			statement.setString(2, comment.getDate());
			statement.setString(3, comment.getComment2user());
			statement.setString(4, comment.getComment2movie());
			statement.executeUpdate();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteComment(String commentId)
	{
		String sql = "delete from comment where id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, commentId);
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
