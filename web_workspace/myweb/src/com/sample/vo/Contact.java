package com.sample.vo;

public class Contact {
	private String name;
	private String tel;
	private String email;
	private String company;
	
	public Contact() {}

	public Contact(String name, String tel, String email, String company) {
		super();
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.company = company;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
}
