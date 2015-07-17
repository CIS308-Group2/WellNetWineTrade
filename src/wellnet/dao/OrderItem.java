package wellnet.dao;

public class OrderItem {
	
	private int orderItemId = 0;
	private int orderId = 0;
	private int wineId = 0;
	private int quantity = 0;
	
	public static String[] ColumnNames = {
		"ORDER_ITEM_ID",
		"ORDER_ID",
		"WINE_ID",
		"QUANTITY"
	};
	
	public OrderItem(){
		
	}
	
	public OrderItem(int orderItemId, int orderId, int wineId, int quantity){
		
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.wineId = wineId;
		this.quantity = quantity;
		
	}
	
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
