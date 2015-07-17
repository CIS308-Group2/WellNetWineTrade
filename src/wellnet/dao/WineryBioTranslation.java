package wellnet.dao;

public class WineryBioTranslation extends WineryBio{
	
	private String language = "";
	
	public static String[] ColumnNames = {
		"LANGUAGE"
	};
	
	public WineryBioTranslation(){
		super();
	}
	
	public WineryBioTranslation(String bio, String language){
		super(bio);
		this.language = language;
	}
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
}
