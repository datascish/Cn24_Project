package com.cn24.deal.vo;

public class ProductVO {
	
	private String productCode;
	private String productName;
	private String productWriterName;
	private String publisherName;
	private int productSellPrice;
	private int discountRate;
	private int productCount; // 재고량
	
	public String getProductCode() {
		return productCode;
	}
	
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductWriterName() {
		return productWriterName;
	}
	
	public void setProductWriterName(String productWriterName) {
		this.productWriterName = productWriterName;
	}
	
	public String getPublisherName() {
		return publisherName;
	}
	
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	
	public int getProductSellPrice() {
		return productSellPrice;
	}
	
	public void setProductSellPrice(int productSellPrice) {
		this.productSellPrice = productSellPrice;
	}
	
	public int getDiscountRate() {
		return discountRate;
	}
	
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	
	public int getProductCount() {
		return productCount;
	}
	
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
}
