package com.simple.dto;

import java.util.List;

import com.simple.vo.Book;
import com.simple.vo.Review;

public class BookDetailDto {

	private Book book;
	private List<Review> reviews;
	// private List<Event> events;
	// private List<Book> likeBooks;
	
	public BookDetailDto() {
		
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	
}
