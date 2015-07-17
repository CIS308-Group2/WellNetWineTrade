package wellnet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import oracle.jdbc.driver.OracleDriver;
import wellnet.dao.Wine;
import wellnet.dao.WineTranslation;
import wellnet.dao.WineryBio;
import wellnet.dao.WineryBioTranslation;

//use this class to establish a connection to the database
public class DBContext {

	private Properties properties = new Properties();
	private String driver = "";
	private static String urlConnectionString = "";
	private static String username = "";
	private static String password = "";
	//private Connection conn;
	/*
	 * I have had trouble with class level connections in the past, i.e. they must be set 
	 * to null at the end of each method or SQL exceptions may occur on their next use. This is
	 * certainly only a concern if we are using a single instance of this class to execute multiple statements.
	 * -Alex
	 */

	// Constructor
	public DBContext() throws IOException, SQLException, ClassNotFoundException {
		
			// Uses the jbdc driver to create a new connection to the database
			DriverManager.registerDriver(new OracleDriver());
			
			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("../config.properties"));
			urlConnectionString = properties.getProperty("jdbc.connectionURL");
			username = properties.getProperty("jdbc.username");
			password = properties.getProperty("jdbc.password");
			driver = properties.getProperty("jdbc.driver");
			
			Class.forName(driver);
		
	}
	
	/**************Place methods that make database calls below.****************/
	
	/**
	 * Returning a list is likely not necessary.
	 * @param accountId
	 * @param language
	 * @return List of all WineryBio associated with the accountId and the given language
	 * @throws SQLException
	 */
	public List<WineryBio> getWineryBio(int accountId, String language) throws SQLException{
		
		Connection connection = null;
		
		try{
			boolean isEnglish = (language.equalsIgnoreCase("english") || language.equalsIgnoreCase("default"));
			
			StringBuilder selectStatement = new StringBuilder();
			String tableName = isEnglish ? "WINERY_BIO" : "BIO_TRANSLATION"; 
			
			selectStatement.append(buildSqlSelectFromStatement(tableName));
			
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			PreparedStatement preparedStatement;
			
			if(isEnglish){
				selectStatement.append("WHERE ACCOUNT_ID = ? ");
				preparedStatement = connection.prepareStatement(selectStatement.toString());
				preparedStatement.setInt(1, accountId);
			}else{
				selectStatement.append("WHERE ACCOUNT_ID = ? AND LANGUAGE = ? ");
				preparedStatement = connection.prepareStatement(selectStatement.toString());
				preparedStatement.setInt(1, accountId);
				preparedStatement.setString(2, language);
			}
			
			ResultSet rs = preparedStatement.executeQuery();
			
			return fillBioList(rs, tableName);
				
		}finally{
			connection.close();
		}
	}
	
	public List<Wine> getWineryWineStock(int accountId, String language) throws SQLException{
		
		Connection connection = null;
		
		try{
			boolean isEnglish = (language.equalsIgnoreCase("english") || language.equalsIgnoreCase("default"));
			
			StringBuilder selectStatement = new StringBuilder();
			String tableName = isEnglish ? "WINE" : "WINE_TRANSLATION"; 
			
			selectStatement.append(buildSqlSelectFromStatement(tableName));
			
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			PreparedStatement preparedStatement;
			
			if(isEnglish){
				selectStatement.append("WHERE ACCOUNT_ID = ? ");
				preparedStatement = connection.prepareStatement(selectStatement.toString());
				preparedStatement.setInt(1, accountId);
			}else{
				selectStatement.append("WHERE ACCOUNT_ID = ? AND LANGUAGE = ? ");
				preparedStatement = connection.prepareStatement(selectStatement.toString());
				preparedStatement.setInt(1, accountId);
				preparedStatement.setString(2, language);
			}
			
			ResultSet rs = preparedStatement.executeQuery();
			
			return fillWineList(rs, tableName);
				
		}finally{
			connection.close();
		}
	}
	
	private List<WineryBio> fillBioList(ResultSet rs, String tableName) throws IllegalArgumentException, SQLException{
		
		List<WineryBio> wineryBio = new ArrayList<WineryBio>();
		
		if(tableName.equalsIgnoreCase("WINERY_BIO")){
			
			while(rs.next()){
				wineryBio.add(new WineryBio(rs.getString(WineryBio.ColumnNames[0])));
			}
			
		}else if(tableName.equalsIgnoreCase("BIO_TRANSLATION")){
			
			while(rs.next()){
				wineryBio.add(new WineryBioTranslation(rs.getString(WineryBio.ColumnNames[0]), WineryBioTranslation.ColumnNames[0]));
			}
			
		}else{
			throw new IllegalArgumentException("Table must be WINERY_BIO or BIO_TRANSLATION");
		}
		
		return wineryBio;
	}
	
	private List<Wine> fillWineList(ResultSet rs, String tableName) throws IllegalArgumentException, SQLException{

		List<Wine> wineStock = new ArrayList<Wine>();
		
		if(tableName.equalsIgnoreCase("WINE")){
			
			while(rs.next()){
				wineStock.add(new Wine(rs.getInt(Wine.ColumnNames[0]),rs.getInt(Wine.ColumnNames[1]),rs.getString(Wine.ColumnNames[2]),
									rs.getInt(Wine.ColumnNames[3]),rs.getString(Wine.ColumnNames[4]),rs.getInt(Wine.ColumnNames[5]),
									rs.getString(Wine.ColumnNames[6]),rs.getString(Wine.ColumnNames[7])));
			}
			
		}else if(tableName.equalsIgnoreCase("WINE_TRANSLATION")){
			
			while(rs.next()){
				wineStock.add(new WineTranslation(rs.getInt(Wine.ColumnNames[0]),rs.getInt(Wine.ColumnNames[1]),rs.getString(Wine.ColumnNames[2]),
						rs.getInt(Wine.ColumnNames[3]),rs.getString(Wine.ColumnNames[4]),rs.getInt(Wine.ColumnNames[5]),
						rs.getString(Wine.ColumnNames[6]),rs.getString(Wine.ColumnNames[7]), rs.getString(WineTranslation.ColumnNames[0])));
			}
			
		}else{
			throw new IllegalArgumentException("Table must be WINE or WINE_TRANSLATION");
		}
		
		return wineStock;
			
	}
	
	/**
	 * This method was just me toying with Oracle. We can delete and use the static
	 * column names in each class if it gives us any problems.
	 * @param tableName
	 * @return String of SELECT statement with all columns and FROM table
	 * @throws SQLException
	 */
	private String buildSqlSelectFromStatement(String tableName) throws SQLException{

		Connection connection = null;
		
		try{
			
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			
			String selectColumns = "SELECT COLUMN_NAME FROM USER_TAB_COLS WHERE TABLE_NAME = ? ";
			PreparedStatement preparedStatement = connection.prepareStatement(selectColumns);
			preparedStatement.setString(1, tableName);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			StringBuilder returnSql = new StringBuilder("SELECT ");
			
			while(rs.next()){
				returnSql.append(rs.getString("COLUMN_NAME")).append(" ");
			}
			
			returnSql.append("FROM ").append(tableName).append(" ");
			
	
			return returnSql.toString();

		}finally{
			connection.close();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}