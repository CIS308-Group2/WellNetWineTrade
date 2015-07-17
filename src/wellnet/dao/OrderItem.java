package wellnet.dao;

public class OrderItem {
	
	private int wineId = 0;
	private int quantity = 0;
	
	public OrderItem(){
		
	}
	
	public OrderItem(int id, int quantity){
		this.wineId = id;
		this.quantity = quantity;
	}
	
	public int getWineId() {
		return wineId;
	}
	public void setWineId(int wineId) {
		this.wineId = wineId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
