package com.proj.my.search.vo;

public class SearchVO {
	
	private int no;
	private String name;
	private String address;
	private String openingDate;
	private String status;
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SearchVO [no=" + no + ", name=" + name + ", address=" + address + ", openingDate=" + openingDate
				+ ", status=" + status + "]";
	}
	
	
	
	
}
