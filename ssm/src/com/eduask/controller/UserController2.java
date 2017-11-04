package com.eduask.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.codehaus.jackson.map.ser.std.DateSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eduask.domain.Page;
import com.eduask.domain.User;
import com.eduask.service.IUserService;

@Controller
@RequestMapping("/user2")
public class UserController2 {
	@Autowired
	private IUserService service;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List findAll() {
		List<User> list = service.findAll();
		return list;
	}
	@RequestMapping("/save")
	public void save(User user){
		service.save(user);
	}
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id){
		service.delete(id);
	}
	@RequestMapping("/update")
	public void update(User user){
		service.udpate(user);
	}
	@RequestMapping("/findPage")
	public void findPage(int page,int rows,HttpServletResponse response) throws Exception{
		Page p=service.findByPage(page, rows);
		List<User> list=p.getList();
		JsonConfig jc=new JsonConfig();
		String jsondata=JSONArray.fromObject(list).toString();
		System.out.println(jsondata);
		String json="{\"total\":\""+p.getRowCount()+"\",\"rows\":"+jsondata+"}";
		response.getWriter().write(json);
	}
}
