package wellnet.dao;

public class WineryBioTranslation extends WineryBio{
	
	private int transId = 0;
	private String language = "";
	
	public static String[] ColumnNames = {
		"BIO_TRANS_ID",
		"ACCOUNT_ID",
		"LANGUAGE",		
		"BIO"
	};
	
	public WineryBioTranslation(){
		super();
	}
	
	public WineryBioTranslation(int transId, int accountId, String language, String bio){
		super(accountId, bio);
		this.transId = transId;
		this.language = language;
	}
	
	public int getTransId() {
		return transId;
	}
	public void setTransId(int transId) {
		this.transId = transId;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
}
