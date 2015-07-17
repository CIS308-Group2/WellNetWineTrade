package wellnet.dao;

import java.util.*;

public class ImportOrder {
	
	private int orderId = 0;
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();
	
	public ImportOrder(){
		
	}
	
	public ImportOrder(int id, List<OrderItem> items){
		this.orderId = id;
		this.orderItems = items;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
}
