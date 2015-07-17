package wellnet.dao;


public class WineTranslation extends Wine{
	
	private String language = "";
	
	public static String[] ColumnNames = {
		"LANGUAGE"
	};
	
	public WineTranslation(){
		super();
	}	
	
	public WineTranslation(int wineId, int accountId, String name, int year, String type, 
			int stock, String promoMaterials, String pairingTastingNotes, String language) {
		
		super(wineId, accountId, name, year, type, stock, promoMaterials, pairingTastingNotes);
		
		this.language = language;
		
	}

	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
}
