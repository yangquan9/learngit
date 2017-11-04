package com.eduask.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduask.dao.UserMapper;
import com.eduask.domain.Page;
import com.eduask.domain.User;
import com.eduask.domain.UserExample;
import com.eduask.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper mapper;
	public void save(User user) {
		mapper.insert(user);
	}
	public void delete(int id) {
		mapper.deleteByPrimaryKey(id);
	}
	public void udpate(User user) {
		mapper.updateByPrimaryKey(user);
	}
	public List<User> findAll() {
		return mapper.selectByExample(new UserExample());
	}
	public User findOne(int id) {
		return mapper.selectByPrimaryKey(id);
	}
	public Page findByPage(int page, int rows) {
		int rowCount=mapper.countByExample(null);
		Page p=new Page(page,rows,rowCount);
		Map map=new HashMap();
		map.put("startLine", p.getStartLine());
		map.put("size", p.getSize());
		p.setList(mapper.findByPage(map));
		return p;
	}
}
