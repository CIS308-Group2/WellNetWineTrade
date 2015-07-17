package wellnet.dao;

public class WineryBio {
	
	private int accountId = 0;
	private String bio = "";

	public static String[] ColumnNames = {
		"ACCOUNT_ID",
		"BIO"
	};
	
	public WineryBio(){
		
	}
	
	public WineryBio(int accountId, String bio){
		this.accountId = accountId;
		this.bio = bio;
	}
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	
}
