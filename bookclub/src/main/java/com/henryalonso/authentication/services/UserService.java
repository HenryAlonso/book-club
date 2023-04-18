package com.henryalonso.authentication.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.henryalonso.authentication.models.LoginUser;
import com.henryalonso.authentication.models.User;
import com.henryalonso.authentication.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email","Matches", "Please use a different email!");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
		    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if(result.hasErrors()) {			
			return null;
		} 
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
			return userRepository.save(newUser);
		}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "User in found in database");
			return null;
		}
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
		    result.rejectValue("password", "Matches", "Invalid Password Entered");
		}
		if(result.hasErrors()) {
			return null;			
		}
		return user;

	}
	
    public User findById(Long id) {
    	Optional<User> potentialUser = userRepository.findById(id);
    	if(potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	return null;
    }
    
    public User findByEmail(String email) {
    	Optional<User> results = userRepository.findByEmail(email);
    	return results.orElse(null);
    }
    
    public User getUserById(Long id) {
    	Optional<User> userOptional = userRepository.findById(id);
    	return userOptional.orElse(null);
    }
    

}
