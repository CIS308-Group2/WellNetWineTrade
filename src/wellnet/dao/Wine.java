package wellnet.dao;


public class Wine {
	
	private int wineId = 0;
	private int accountId = 0;
	private String name = "";
	private int year = 0;
	private String type = "";
	private int stock = 0;
	private String promoMaterials = "";
	private String pairingTastingNotes = "";
	
	public static String[] ColumnNames = {
		"WINE_ID",
		"NAME",
		"YEAR",
		"TYPE",
		"STOCK",
		"PROMO_MATERIAL",
		"PAIRING_TASTING_NOTES",
		"ACCOUNT_ID"
		
	};
	
	public Wine(){
		
	}

	public Wine(int wineId, String name, int year, String type, int stock, 
				String promoMaterials, String pairingTastingNotes, int accountId) {
		
		this.wineId = wineId;
		this.name = name;
		this.year = year;
		this.type = type;
		this.stock = stock;
		this.promoMaterials = promoMaterials;
		this.pairingTastingNotes = pairingTastingNotes;
		this.accountId = accountId;
	}
	
	public int getWineId() {
		return wineId;
	}
	public void setWineId(int wineId) {
		this.wineId = wineId;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPromoMaterials() {
		return promoMaterials;
	}
	public void setPromoMaterials(String promoMaterials) {
		this.promoMaterials = promoMaterials;
	}
	public String getPairingTastingNotes() {
		return pairingTastingNotes;
	}
	public void setPairingTastingNotes(String pairingTastingNotes) {
		this.pairingTastingNotes = pairingTastingNotes;
	}
	
}
