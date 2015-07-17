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
	
	public void addWine(String name, int year, String type,
	int stock, String promoMaterial, String pairingTastingNotes, int accountId){
		//Creates insert statement
		String sql = "INSERT INTO WINE VALUES(seq_wine.nextval,'"+ name +"','"+ year +"','"+ type +"','"+ stock +"','"+ promoMaterial +"','"+ pairingTastingNotes +"','"+ accountId +"')";

		try {
			// Creates a new statement and executes the SQL query
			this.statement = conn.createStatement();
			this.statement.executeUpdate(sql);			
			this.statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			//DisplayErrorMessage("There was an error executing the query on the database");
		}
	}
	
	public void addBio(int accountId, String bio){
		String sql = "INSERT INTO WINERY_BIO VALUES('"+ accountId +"','"+ bio +"')";
		
		try {
			// Creates a new statement and executes the SQL query
			this.statement = conn.createStatement();
			this.statement.executeUpdate(sql);			
			this.statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			//DisplayErrorMessage("There was an error executing the query on the database");
		}
	}
	
	public void addUserAccount(int userId, String username, String encryptedPassword, String passwordSalt, int accountId){
		String sql = "INSERT INTO USER_ACCOUNT VALUES('"+ userId +"','"+ username +"','"+ encryptedPassword +"','"+ passwordSalt +"','"+ accountId +"')";
		
		try {
			// Creates a new statement and executes the SQL query
			this.statement = conn.createStatement();
			this.statement.executeUpdate(sql);			
			this.statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			//DisplayErrorMessage("There was an error executing the query on the database");
		}
	}
	
	
	/**************Place methods that make database calls below.****************/
	
	
}