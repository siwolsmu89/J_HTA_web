package com.sample.vo;

import java.util.Date;

public class Book {
	
	private int no;
	private String title;
	private String writer;
	private int price;
	private double discountRate;
	private Date pubDate;
	private int stock;
	private boolean isSoldOut;
	
	public Book() {}
	
	public Book(int no, String title, String writer, int price, int stock) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.price = price;
		this.stock = stock;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(double discountRate) {
		this.discountRate = discountRate;
	}

	public Date getPubDate() {
		return pubDate;
	}

	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public boolean isSoldOut() {
		return isSoldOut;
	}

	public void setSoldOut(boolean isSoldOut) {
		this.isSoldOut = isSoldOut;
	}
	
}
