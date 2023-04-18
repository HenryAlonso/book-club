package com.henryalonso.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.henryalonso.authentication.models.Book;
import com.henryalonso.authentication.models.LoginUser;
import com.henryalonso.authentication.models.User;
import com.henryalonso.authentication.services.BookService;
import com.henryalonso.authentication.services.UserService;


@Controller
public class MainController {
 
 @Autowired
 private UserService userService;
 
 @Autowired
 private BookService bookService;
 
 @GetMapping("/")
 public String index(Model model) {
 
     model.addAttribute("newUser", new User());
     model.addAttribute("newLogin", new LoginUser());
     return "index.jsp";
 }
 
 @GetMapping("/books")
 public String home(Model model, HttpSession session) {
	 Long loggedIn = (Long) session.getAttribute("loggedIn");
	 if(loggedIn == null) {
		 return "redirect: /";
	 }
	 User user = userService.findById(loggedIn);
	 model.addAttribute("user", user);
	 model.addAttribute("books", bookService.allBooks());
	 return "profile.jsp";
 }
 
 @GetMapping("/book/new")
 public String addBook(@ModelAttribute("book")Book book, Model model, HttpSession session) {
	 Long loggedIn = (Long) session.getAttribute("loggedIn");
	 if(loggedIn == null) {
		 return "redirect: /";
	 }
	 User user = userService.findById(loggedIn);
	 model.addAttribute("user", user);
	 return "book.jsp";
 }
 
 @GetMapping("/books/{id}")
 public String viewBook(Model model, @PathVariable("id") Long id, HttpSession session) {
	 Long loggedIn = (Long) session.getAttribute("loggedIn");
	 if(loggedIn == null) {
		 return "redirect: /";
	 }
	 model.addAttribute("book", bookService.findById(id));
	 model.addAttribute("user", userService.findById((Long)session.getAttribute("loggedIn")));
	 return "viewBook.jsp";
	 
 }
 
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
	 
     userService.register(newUser, result);
	 
     if(result.hasErrors()) {
         model.addAttribute("newLogin", new LoginUser());
         return "index.jsp";
     }
     
     // Store their ID from the DB in session
     session.setAttribute("loggedIn", newUser.getId());
 
     return "redirect:/books";
 }
 
 @PostMapping("/login")
 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {
     

     User userInDb = userService.login(newLogin, result);
 
     if(result.hasErrors()) {
         model.addAttribute("newUser", new User());
         return "index.jsp";
     }
 
     // Store their ID from the DB in session
     session.setAttribute("loggedIn", userInDb.getId());
 
     return "redirect:/books";
 }
 
 @PostMapping("/books/new/process")
 public String processBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
	 if(result.hasErrors()) {
		 return "book.jsp";
	 }
	 bookService.createBook(book);
	 return "redirect:/books";
 }
 
 //Clear the Id in session
 @GetMapping("/logout")
 public String logout(HttpSession session) {
	 session.setAttribute("loggedIn", null);
	 return "redirect:/";
	 }
 
}
