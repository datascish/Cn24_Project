package com.cn24.product.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.cn24.member.vo.MemberVO;

public class ProductVO {
	private int id;
	private String productName;
	private String productDesc;
	private int productPrice;
	private int userId;
	private String productRegistDate;
	
	private MultipartFile productFile;
	private String productUrl;
	private String requestIp;
	private String userType;
	
	private MemberVO memberVO;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductDesc() {
		return productDesc;
	}
	
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getProductRegistDate() {
		return productRegistDate;
	}
	
	public void setProductRegistDate(String productRegistDate) {
		this.productRegistDate = productRegistDate;
	}
	
	public MultipartFile getProductFile() {
		return productFile;
	}
	
	public void setProductFile(MultipartFile productFile) {
		this.productFile = productFile;
	}
	
	public String getProductUrl() {
		return productUrl;
	}
	
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	public String getRequestIp() {
		return requestIp;
	}

	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String save() {

		if (productFile != null && !productFile.isEmpty()) {
			// file이 전송되고 그 파일이 비어있지 않다면
			productUrl = productFile.getOriginalFilename();
			File newFile = new File("d:/uploadFiles/" + productFile.getOriginalFilename()); // upload하면 이 위치에 file을 써라
			try {
				productFile.transferTo(newFile);
				return newFile.getAbsolutePath(); // 전송시킨 파일의 절대경로를 반환
			} catch (IllegalStateException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		return null;
	}
	
}
