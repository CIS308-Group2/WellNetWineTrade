package wellnet.dao;


public class UserAccount {
	
	private int userId = 0;
	private String username = "";
	private String pswd = "";
	private String pswdSalt = "";
	private int accountId = 0;
	
	public static String[] ColumnNames = {
		"USER_ID",
		"USERNAME",
		"ENCRYPTED_PASSWORD",
		"PASSWORD_SALT",
		"ACCOUNT_ID"
	};
	

	public UserAccount(){
		
	}
		
	public UserAccount(int userId, String username, String pswd, String pswdSalt, int accountId) {

		this.userId = userId;
		this.username = username;
		this.pswd = pswd;
		this.pswdSalt = pswdSalt;
		this.accountId = accountId;
		
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getPswdSalt() {
		return pswdSalt;
	}
	public void setPswdSalt(String pswdSalt) {
		this.pswdSalt = pswdSalt;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	
}
