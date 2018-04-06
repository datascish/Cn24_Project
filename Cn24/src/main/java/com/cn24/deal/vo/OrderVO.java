package com.cn24.deal.vo;

import com.cn24.member.vo.MemberVO;

public class OrderVO {
	
	private long orderItemNumber;
	private String orderProductName;
	private int orderItemCount;
	private int orderPrice;
	
	private MemberVO memberVO;
	private ProductVO productVO;
	
	public long getOrderItemNumber() {
		return orderItemNumber;
	}
	
	public void setOrderItemNumber(long orderItemNumber) {
		this.orderItemNumber = orderItemNumber;
	}
	
	public String getOrderProductName() {
		return orderProductName;
	}
	
	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}
	
	public int getOrderItemCount() {
		return orderItemCount;
	}
	
	public void setOrderItemCount(int orderItemCount) {
		this.orderItemCount = orderItemCount;
	}
	
	public int getOrderPrice() {
		return orderPrice;
	}
	
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public ProductVO getProductVO() {
		return productVO;
	}
	
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
}
