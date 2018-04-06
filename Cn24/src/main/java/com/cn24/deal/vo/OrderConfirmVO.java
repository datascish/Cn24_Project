package com.cn24.deal.vo;

import com.cn24.member.vo.MemberVO;

public class OrderConfirmVO {
	
	private int OrderCode;
	private String orderDate;
	private int totalOrderCount;
	private int totalPrice;
	
	private OrderVO orderVO;
	private MemberVO memberVO;

	public int getOrderCode() {
		return OrderCode;
	}

	public void setOrderCode(int orderCode) {
		OrderCode = orderCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getTotalOrderCount() {
		return totalOrderCount;
	}

	public void setTotalOrderCount(int totalOrderCount) {
		this.totalOrderCount = totalOrderCount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}
