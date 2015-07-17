package wellnet.dao;

public class AccountType {
	
	private int accountTypeId = 0;
	private String accountType = "";
	
	public static String[] ColumnNames = {
		"ACCOUNT_TYPE_ID",
		"ACCOUNT_TYPE"
	};
	
	public AccountType(){
		
	}
	
	public AccountType(int id, String type){
		this.accountTypeId = id;
		this.accountType = type;
	}
	
	public int getAccountTypeId() {
		return accountTypeId;
	}
	public void setAccountTypeId(int accountTypeId) {
		this.accountTypeId = accountTypeId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	
	
	
}
