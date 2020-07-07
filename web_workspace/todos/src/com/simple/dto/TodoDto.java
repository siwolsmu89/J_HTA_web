package com.simple.dto;

import java.util.Date;

public class TodoDto {
	
	private int no;
	private String title;
	private String content;
	private Date day;
	private Date completedDay;
	private String status;
	private String statusClass;
	private boolean canModify;
	private String userId;
	private String userName;
	private Date createdDate;
	
	public TodoDto() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public Date getCompletedDay() {
		return completedDay;
	}

	public void setCompletedDay(Date completedDay) {
		this.completedDay = completedDay;
	}

	public String getStatus() {
		return status;
	}

	public String getStatusClass() {
		String value = "";
		if ("처리예정".equals(status)) {
			value = "badge-primary";
		} else if ("처리중".equals(status)) {
			value = "badge-info";
		} else if ("보류".equals(status)) {
			value = "badge-secondary";
		} else if ("삭제".equals(status)) {
			value = "badge-danger";
		} else if ("처리완료".equals(status)) {
			value = "badge-success";
		}
		return value;
	}
	
	public boolean isCanModify() {
		return canModify;
	}

	public void setCanModify(boolean canModify) {
		this.canModify = canModify;
	}

	public void setStatus(String status) {
		this.status = status;
		this.statusClass = getStatusClass();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
}
