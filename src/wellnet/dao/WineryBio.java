package wellnet.dao;

public class WineryBio {
	
	private String bio = "";

	public static String[] ColumnNames = {
		"BIO"
	};
	
	public WineryBio(){
		
	}
	
	public WineryBio(String bio){
		this.bio = bio;
	}
	
	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}
	
}
