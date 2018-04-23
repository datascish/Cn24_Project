package com.cn24.community.vo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cn24.member.vo.MemberVO;

public class CommunityVO {
	// 게시판 id, 제목, 내용, 작성자(닉네임+아이디), 작성일, 조회수, 추천수, 댓글
	// 댓글은 따로 VO 만들 예정
	private int id;
	private String title;
	private String body;
	private int userId;
	private String writeDate;
	
	private int viewCount;
	private int recommendCount;
	
	private MultipartFile file;
	private String fileName; // 첨부파일 이름
	
	private String requestIp; // log 기록 위해 필요함
	
	// 회원 정보 가져와야 함
	private MemberVO memberVO;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getFileName() {
		if (fileName == null) {
			fileName = "";
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	
	public String save() {
		
		if (file != null && !file.isEmpty()) {
			// file이 전송되고 그 파일이 비어있지 않다면
			fileName = file.getOriginalFilename();
			File newFile = new File("d:/uploadFiles/" + file.getOriginalFilename()); // upload하면 이 위치에 file을 써라
			try {
				file.transferTo(newFile);
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
