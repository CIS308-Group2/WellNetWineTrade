package wellnet.dao;


public class BusinessAccount {
	
	private int accountId = 0;
	private String companyName = "";
	private String address = "";
	private String phone = "";
	private String email = "";
	private char approved = 'N';
	private int accountTypeId = 0;
	
	public static String[] ColumnNames = {
		"ACCOUNT_ID",
		"COMPANY_NAME",
		"ADDRESS",
		"PHONE",
		"EMAIL",
		"APPROVED",
		"ACCOUNT_TYPE_ID"
	};
	
	public BusinessAccount(){
		
	}
		
	public BusinessAccount(int accountId, String companyName, String address,
							String phone, String email, char approved, int accountTypeId) {

		this.accountId = accountId;
		this.companyName = companyName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.approved = approved;		
		this.accountTypeId = accountTypeId;
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
		return approved == 'Y' || approved == 'y';
	}
	public void setApproved(char approved) {
		this.approved = approved;
	}
	public int getAccountTypeId() {
		return accountTypeId;
	}
	public void setAccountTypeId(int accountTypeId) {
		this.accountTypeId = accountTypeId;
	}

}
