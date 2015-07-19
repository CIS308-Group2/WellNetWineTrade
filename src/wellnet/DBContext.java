package wellnet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import wellnet.dao.BusinessAccount;
import wellnet.dao.UserAccount;
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
	private static String createSql = "";
	private static String initSql = "";
	private static String dropSql = "";

	// Constructor
	public DBContext() throws IOException, ClassNotFoundException {
		
			// Uses the jbdc driver to create a new connection to the database			
				properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("../config.properties"));
				urlConnectionString = properties.getProperty("jdbc.connectionURL");
				username = properties.getProperty("jdbc.username");
				password = properties.getProperty("jdbc.password");
				driver = properties.getProperty("jdbc.driver");
				
				Class.forName(driver);
				
				createSql = properties.getProperty("sql.create");
				initSql = properties.getProperty("sql.init");
				dropSql = properties.getProperty("sql.drop");
			
			
	}
	
	public Boolean initDB() throws URISyntaxException, SQLException, IOException{
		
		Boolean result = false;
		if(this.executeSqlFile(createSql)){
			result = this.executeSqlFile(initSql);
		}
		return result;
		
	}
	
	public boolean dropDB() throws SQLException{
		return executeSqlFile(dropSql);
	}
	
	public Boolean executeSqlFile(String filePath) throws SQLException {
		Connection connection = null;
		String line = null;
		Boolean result = false;
		StringBuffer stringBuffer = new StringBuffer();
		try{
			
			InputStreamReader fileReader = new InputStreamReader(this.getClass().getResourceAsStream(filePath));
			
			BufferedReader reader = new BufferedReader(fileReader);
			
			while((line = reader.readLine()) != null){
				stringBuffer.append(line);
			}
			String[] sqlStatements = stringBuffer.toString().split(";");
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			
			for(String sql : sqlStatements){
				
				PreparedStatement statement = connection.prepareStatement(sql);
				statement.executeUpdate();
											
			}
						
			reader.close();
			fileReader.close();
			result = true;
		} catch (IOException | SQLException e) {
			result = false;
			e.printStackTrace();
		}
		finally{
				connection.close();
			}
		return result;
	}
	
	/**
	 * In case we need to use the account ID for something.
	 * @return the next int in the SEQ_ACCOUNT_TYPE sequence
	 * @throws SQLException
	 */
	public int getNextAccountId() throws SQLException {
		
		Connection connection = null;
		int accountId = 0;
		
		try{
			
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			
			String mySQL = "SELECT SEQ_ACCOUNT_TYPE.NEXTVAL FROM DUAL ";
			PreparedStatement preparedStatement = connection.prepareStatement(mySQL);
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()){
				accountId = rs.getInt(1);
			}
			
			return accountId;
		}finally{
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	// ***********This method needs to be parameterized************
	public void addUserAccount(UserAccount userAccount) throws SQLException{
		
		Connection connection = null;
		
		try{
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			
			String sql = "INSERT INTO USER_ACCOUNT VALUES(seq_user_account.nextval,'"+ userAccount.getUsername() +"','"+ 
															userAccount.getPswd() +"','"+ userAccount.getAccountId() +"')";
		
			// Creates a new statement and executes the SQL query
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);			
			statement.close();
		}finally{
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	//Retrieves info from form
	public UserAccount getUserAccountFromForm(HttpServletRequest request){
		UserAccount one = new UserAccount();
		one.setUsername(request.getParameter("username"));
		one.setPswd(request.getParameter("pswd"));
		one.setAccountId(Integer.parseInt(request.getParameter("chosenAccount")));
		return one;	
	}
	
	//This method adds a business account to the database
	public void addBusinessAccount(BusinessAccount businessAccount) throws SQLException{
		
		Connection connection = null;
		
		try{
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			
			String sql = "INSERT INTO BUSINESS_ACCOUNT VALUES(seq_business_account.nextval,'"+ businessAccount.getCompanyName() +
			"','"+ businessAccount.getAddress() +"','"+ businessAccount.getPhone() +"','"+ businessAccount.getEmail()+
			"','"+ businessAccount.getApproved() +"','"+ businessAccount.getAccountTypeId() +"')";
		
			// Creates a new statement and executes the SQL query
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);			
			statement.close();
		}finally{
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	//Retrieves info from form
	public BusinessAccount getBusinessAccountFromForm(HttpServletRequest request){
		BusinessAccount one = new BusinessAccount();
		one.setCompanyName(request.getParameter("companyName")); 
		one.setAddress(request.getParameter("address"));
		one.setPhone(request.getParameter("phone"));
		one.setEmail(request.getParameter("email"));
		one.setApproved(request.getParameter("approved").charAt(0));
		one.setAccountTypeId(Integer.parseInt(request.getParameter("accountTypeId")));
		return one;
	}
	
	// ***********This method needs to be parameterized************
	public void addWine(Wine wine) throws SQLException{
				//Creates insert statement
				String sql = "INSERT INTO WINE VALUES(seq_wine.nextval,'"+ wine.getName() +"','"+ wine.getYear() +"','"+ 
														wine.getType() +"','"+ wine.getStock()+"','"+ wine.getPromoMaterials() +"','"+ 
														wine.getPairingTastingNotes() +"','"+ wine.getAccountId() +"')";
				
				Connection connection = null;
				
				try {
					connection = DriverManager.getConnection(urlConnectionString, username, password);
					// Creates a new statement and executes the SQL query
					Statement statement = connection.createStatement();
					statement.executeUpdate(sql);			
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
					//DisplayErrorMessage("There was an error executing the query on the database");
				}finally{
					if(!connection.isClosed()){
						connection.close();
					}
				}
			}
	//This method works with th einsertWine.jsp page to retrieve user input		
	public Wine getWineFromForm(HttpServletRequest request){
		Wine one = new Wine();
		one.setName(request.getParameter("name"));
		one.setYear(Integer.parseInt(request.getParameter("year")));
		one.setType(request.getParameter("type"));
		one.setStock(Integer.parseInt(request.getParameter("stock")));
		one.setPromoMaterials(request.getParameter("promoMaterial"));
		one.setPairingTastingNotes(request.getParameter("pairingTastingNotes"));
		one.setAccountId(Integer.parseInt(request.getParameter("chosenAccount")));
		return one;
	}
			
	// ***********This method needs to be parameterized************
	public void addBio(WineryBio wineryBio) throws SQLException{
		String sql = "INSERT INTO WINERY_BIO VALUES('"+ wineryBio.getAccountId() +"','"+ wineryBio.getBio() +"')";
		
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			// Creates a new statement and executes the SQL query
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);			
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			//DisplayErrorMessage("There was an error executing the query on the database");
		}finally{
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	//This method retrieves info entered in the insertBio.jsp form
	public WineryBio getWineryBioFromForm(HttpServletRequest request){
		WineryBio one = new WineryBio();
		one.setAccountId(Integer.parseInt(request.getParameter("chosenAccount"))); 
		one.setBio(request.getParameter("bio"));
		return one;
		
	}
	
	public ArrayList<Integer> getWineryAccountIds() throws SQLException {
		ArrayList<Integer> accountIds = new ArrayList<Integer>();
		String sql = "SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE ACCOUNT_TYPE_ID IN "
				+ "(SELECT ACCOUNT_TYPE_ID FROM ACCOUNT_TYPE WHERE ACCOUNT_TYPE = 'WINERY')";
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			// Creates a new statement and executes the SQL query
			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
				accountIds.add(result.getInt("ACCOUNT_ID"));
			}

			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(!connection.isClosed()){
				connection.close();
			}
		}

		return accountIds;
	}
	
	//This method creates a list of account IDs so it can be used on forms, like the insertBio.jsp
	public ArrayList<Integer> getAccountIds() throws SQLException {
		ArrayList<Integer> accountIds = new ArrayList<Integer>();
		String sql = "SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT";
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(urlConnectionString, username, password);
			// Creates a new statement and executes the SQL query
			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
				accountIds.add(result.getInt("ACCOUNT_ID"));
			}

			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(!connection.isClosed()){
				connection.close();
			}
		}

		return accountIds;
	}
	
	/**
	 * 
	 * @param accountId
	 * @param language
	 * @return List of all WineryBio associated with the accountId and the given language
	 * @throws SQLException
	 */
	public WineryBio getWineryBio(int accountId, String language) throws SQLException{
		
		Connection connection = null;
		
		try{
			boolean isEnglish = (language.equalsIgnoreCase("english") || language.equalsIgnoreCase("default"));
			
			StringBuilder selectStatement = new StringBuilder();
			String tableName = isEnglish ? "WINERY_BIO" : "BIO_TRANSLATION"; 
			
			selectStatement.append("SELECT * FROM ").append(tableName).append(" ");
			
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
			
			WineryBio wineBio = null;
			
			while(rs.next()){
				
				wineBio = fillBio(rs, tableName);
			}
			
			return wineBio;
				
		}finally{
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	public List<Wine> getWineryWineStock(int accountId, String language) throws SQLException{
		
		Connection connection = null;
		
		try{
			boolean isEnglish = (language.equalsIgnoreCase("english") || language.equalsIgnoreCase("default"));
			
			StringBuilder selectStatement = new StringBuilder();
			String tableName = isEnglish ? "WINE" : "WINE_TRANSLATION"; 
			
			selectStatement.append("SELECT * FROM ").append(tableName).append(" ");
			
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
			if(!connection.isClosed()){
				connection.close();
			}
		}
	}
	
	private WineryBio fillBio(ResultSet rs, String tableName) throws IllegalArgumentException, SQLException{
		
		WineryBio wineryBio = null;
		
		if(tableName.equalsIgnoreCase("WINERY_BIO")){
			
			wineryBio = new WineryBio(rs.getInt(WineryBio.ColumnNames[0]),rs.getString(WineryBio.ColumnNames[1]));
			
			
		}else if(tableName.equalsIgnoreCase("BIO_TRANSLATION")){
			
				wineryBio =new WineryBioTranslation(rs.getInt(WineryBioTranslation.ColumnNames[0]),rs.getInt(WineryBioTranslation.ColumnNames[1]),
														rs.getString(WineryBioTranslation.ColumnNames[2]), rs.getString(WineryBioTranslation.ColumnNames[3]));
			
		}else{
			throw new IllegalArgumentException("Table must be WINERY_BIO or BIO_TRANSLATION");
		}
		
		return wineryBio;
	}
	
	private List<Wine> fillWineList(ResultSet rs, String tableName) throws IllegalArgumentException, SQLException{

		List<Wine> wineStock = new ArrayList<Wine>();
		
		if(tableName.equalsIgnoreCase("WINE")){
			
			while(rs.next()){
				wineStock.add(new Wine(rs.getInt(Wine.ColumnNames[0]),rs.getString(Wine.ColumnNames[1]),rs.getInt(Wine.ColumnNames[2]),
									rs.getString(Wine.ColumnNames[3]),rs.getInt(Wine.ColumnNames[4]),rs.getString(Wine.ColumnNames[5]),
									rs.getString(Wine.ColumnNames[6]),rs.getInt(Wine.ColumnNames[7])));
			}
			
		}else if(tableName.equalsIgnoreCase("WINE_TRANSLATION")){
			
			while(rs.next()){
				wineStock.add(new WineTranslation(rs.getInt(WineTranslation.ColumnNames[0]),rs.getInt(WineTranslation.ColumnNames[1]),
													rs.getString(WineTranslation.ColumnNames[2]),rs.getString(WineTranslation.ColumnNames[3]),
													rs.getInt(WineTranslation.ColumnNames[4]),rs.getString(WineTranslation.ColumnNames[5]),
													rs.getInt(WineTranslation.ColumnNames[6]),rs.getString(WineTranslation.ColumnNames[7]),
													rs.getString(WineTranslation.ColumnNames[8]),rs.getInt(WineTranslation.ColumnNames[9])));
			}
			
		}else{
			throw new IllegalArgumentException("Table must be WINE or WINE_TRANSLATION");
		}
		
		return wineStock;
			
	}
		
	
}
