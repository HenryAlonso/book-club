package com.henryalonso.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.henryalonso.authentication.models.Book;
import com.henryalonso.authentication.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	//Create a new book
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	
	//Return all books
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}
	
	//Return one book
	public Book findById(Long id) {
		Optional<Book> bookOptional = bookRepository.findById(id);
		return bookOptional.orElseThrow(null);
	}

}
