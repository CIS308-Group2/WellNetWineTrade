package wellnet.dao;

import java.util.*;

public class ImportOrder {
	
	private int orderId = 0;
	private int accountId = 0;
	private Date orderDate;
	private Date orderCompletedDate;
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();
	
	public static String[] ColumnNames = {
		"ORDER_ID",
		"ACCOUNT_ID",
		"ORDER_DATE",
		"ORDER_COMPLETED_DATE"
	};
	

	public ImportOrder(){
		
	}
	
	public ImportOrder(int id, int accountId, Date orderDate, List<OrderItem> items){
		this.orderId = id;
		this.accountId = accountId;
		this.orderItems = items;
		this.orderDate = orderDate;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public Date getOrderDate(){
		return orderDate;
	}
	public void setOrderDate(Date orderDate){
		this.orderDate = orderDate;
	}
	public Date getOrderCompletedDate(){
		return orderCompletedDate;
	}
	public void setOrderCompleteDate(Date orderCompleteDate){
		this.orderCompletedDate = orderCompleteDate;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
}
