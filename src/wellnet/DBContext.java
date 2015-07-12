package wellnet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;


import oracle.jdbc.driver.OracleDriver;

//use this class to establish a connection to the database
public class DBContext {
	private Statement statement;
	private static String urlConnectionString = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String username = "student1";
	private static String password = "pass";
	private Connection conn;

	// Constructor
	public DBContext() {
		try {
			// Uses the jbdc driver to create a new connection to the database
			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(urlConnectionString, username,
					password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**************Place methods that make database calls below.****************/
	
	
}