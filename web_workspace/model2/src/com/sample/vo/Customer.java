package com.sample.vo;

public class Customer {

	private String name;
	private String tel;
	private Car myCar;
	
	public Customer() {}

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

	public Car getMyCar() {
		return myCar;
	}

	public void setMyCar(Car myCar) {
		this.myCar = myCar;
	}
	
}
