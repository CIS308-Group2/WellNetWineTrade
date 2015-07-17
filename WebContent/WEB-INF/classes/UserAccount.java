package wellnet;


public class UserAccount {
	
	private int userId = 0;
	private String username = "";
	private String encryptedPassword = "";
	private String passwordSalt = "";
	private int accountId = 0;
	private DBContext data = new DBContext();
	
	public UserAccount(){
		
	}
	
	public UserAccount(int userId, String username, String encryptedPassword,
	String passwordSalt, int accountId) {

		this.userId = userId;
		this.username = username;
		this.encryptedPassword = encryptedPassword;
		this.passwordSalt = passwordSalt;
		this.accountId = accountId;
		
	}
	


	public int getUserId() {return userId;}
	public void setUserId(int userId) {this.userId = userId;}

	public String getUsername() {return username;}
	public void setUsername(String username) {this.username = username;}

	public String getEncryptedPassword() {return encryptedPassword;}
	public void setEncryptedPassword(String encryptedPassword) {this.encryptedPassword = encryptedPassword;}

	public String getPasswordSalt() {return passwordSalt;}
	public void setPasswordSalt(String passwordSalt) {this.passwordSalt = passwordSalt;}

	public int getAccountId() {return accountId;}
	public void setAccountId(int accountId) {this.accountId = accountId;}

	public void addUserAccount(){
		data.addUserAccount(this.userId, this.username, this.encryptedPassword,
		this.passwordSalt, this.accountId);		
	}
}
