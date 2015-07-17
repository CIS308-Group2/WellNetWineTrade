package wellnet;

public class WineryBio{

	//This class has strings to store the answers temporarily
	private int accountId;
	private String bio;
	
	//A DataClass object is created to save the string to the database
	private DBContext data = new DBContext();
		
	public WineryBio(){
		
		//The default constructor sets the strings to null
		this.accountId = 0;
		this.bio = "";
	}

	
	//The basic getter and setters....
	public void setAccountId(int accountId){this.accountId = accountId;}
	public void setBio(String bio){this.bio = bio;}
	
	public int getAccountId(){return this.accountId;}
	public String getBio(){return this.bio;}
	
	
	public void addBio(){
	
		//This method calls on methods in the DataClass to save the strings
		//to the database
		data.addBio(this.accountId, this.bio);		
	}
}