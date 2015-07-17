package wellnet.dao;


public class WineTranslation extends Wine{
	
	private int transId = 0;
	private String language = "";
	
	public static String[] ColumnNames = {
		"WINE_TRANS_ID",
		"WINE_ID",
		"LANGUAGE",
		"NAME",
		"YEAR",
		"TYPE",
		"STOCK",
		"PROMO_MATERIAL",
		"PAIRING_TASTING_NOTES",
		"ACCOUNT_ID"
	};
	
	public WineTranslation(){
		super();
	}	
	
	public WineTranslation(int transId, int wineId, String language, String name, int year, String type, 
							int stock, String promoMaterials, String pairingTastingNotes, int accountId) {
		
		super(wineId, name, year, type, stock, promoMaterials, pairingTastingNotes, accountId);
		
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
