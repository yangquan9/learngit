package com.eduask.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eduask.domain.User;
import com.eduask.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService service;
	@RequestMapping("/saveUI")
	public String saveUI(){
		return "/saveUI";
	}
	@RequestMapping("/save")
	public String save(@Validated User user,BindingResult bindingResult,Model model){
		if(bindingResult.hasErrors()){
			List<FieldError> list=bindingResult.getFieldErrors();
			for (FieldError fe : list) {
				model.addAttribute(fe.getField()+"Error",fe.getDefaultMessage());
			}
			return "saveUI";
		}else{
			service.save(user);
			return "redirect:/user/findAll.do";
		}
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		model.addAttribute("list",service.findAll());
		return "/shouUI";
	}
	@RequestMapping("/delete")
	public String delete(User user){
		service.delete(user.getId());
		return "redirect:/user/findAll.do";
	}
	@RequestMapping("/findOne")
	public String findOne(User user,Model model){
		model.addAttribute("user", service.findOne(user.getId()));
		return "updateUI";
	}
	@RequestMapping("/update")
	public String update(@Validated User user,BindingResult bindingResult,Model model){
		if(bindingResult.hasErrors()){
			List<FieldError> list=bindingResult.getFieldErrors();
			for (FieldError fe : list) {
				model.addAttribute(fe.getField()+"Error",fe.getDefaultMessage());
			}
			return "updateUI";
		}else{
			service.udpate(user);
			return "redirect:/user/findAll.do";
		}
	}
}
