package com.simple.service;

import com.simple.dao.UserDao;
import com.simple.vo.User;

public class UserService {

	private UserDao userDao = new UserDao();
	
	public boolean addNewUser(User user) throws Exception {
		User savedUser = userDao.getUserById(user.getId());
		
		if (savedUser != null) {
			return false;
		} 
		
		userDao.insertUser(user);
		return true;
	}
	
	public User loginCheck(String id, String pwd) throws Exception {
		User savedUser = userDao.getUserById(id);
		
		if (savedUser == null) {
			return null;
		}
		
		if (!pwd.equals(savedUser.getPassword())) {
			return null;
		}
		
		return savedUser;
	}
}
