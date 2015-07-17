package wellnet.dao;


public class UserAccount {
	
	private int userId = 0;
	private String username = "";
	private int accountId = 0;
	private String companyName = "";
	private String address = "";
	private String phone = "";
	private String email = "";
	private boolean approved = false;
	private AccountType accountType = new AccountType();
	
	public UserAccount(){
		
	}
		
	public UserAccount(int userId, String username, int accountId, String companyName,
			String address, String phone, String email, char approved, AccountType accountType) {

		this.userId = userId;
		this.username = username;
		this.accountId = accountId;
		this.companyName = companyName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.accountType = accountType;
		
		if(approved == 'Y' || approved == 'y'){
			this.approved = true;			
		}
		
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
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isApproved() {
		return approved;
	}
	public void setApproved(boolean approved) {
		this.approved = approved;
	}
	public AccountType getAccountType() {
		return accountType;
	}
	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	 
	
	
	
}
