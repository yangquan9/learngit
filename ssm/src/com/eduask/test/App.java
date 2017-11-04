package com.eduask.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.eduask.domain.User;
import com.eduask.service.IUserService;

public class App {
	@Test
	public void test() throws Exception {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		IUserService service=(IUserService) ac.getBean("userServiceImpl");
		System.out.println(service.findAll());
	}
	
}
