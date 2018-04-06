package com.cn24.deal.vo;

import com.cn24.member.vo.MemberVO;

public class DeliveryVO {
	
	private String deliveryCode;
	private String deliveryAddress;
	private String deliveryPostNumber;
	private String deliveryDate;
	private String deliveryProductName;
	private int deliveryCount;
	
	private OrderVO orderVO;
	private ProductVO productVO;
	private MemberVO memberVO;
	
	public String getDeliveryCode() {
		return deliveryCode;
	}
	
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	
	public String getDeliveryPostNumber() {
		return deliveryPostNumber;
	}
	
	public void setDeliveryPostNumber(String deliveryPostNumber) {
		this.deliveryPostNumber = deliveryPostNumber;
	}
	
	public String getDeliveryDate() {
		return deliveryDate;
	}
	
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	
	public String getDeliveryProductName() {
		return deliveryProductName;
	}
	
	public void setDeliveryProductName(String deliveryProductName) {
		this.deliveryProductName = deliveryProductName;
	}
	
	public int getDeliveryCount() {
		return deliveryCount;
	}
	
	public void setDeliveryCount(int deliveryCount) {
		this.deliveryCount = deliveryCount;
	}
	
	public OrderVO getOrderVO() {
		return orderVO;
	}
	
	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}
	
	public ProductVO getProductVO() {
		return productVO;
	}
	
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}
