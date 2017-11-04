package com.eduask.service;

import java.util.List;

import com.eduask.domain.Page;
import com.eduask.domain.User;

public interface IUserService {
	public void save(User user);
	public void delete(int id);
	public void udpate(User user);
	public List<User> findAll();
	public User findOne(int id);
	public Page findByPage(int page,int rows);
}
