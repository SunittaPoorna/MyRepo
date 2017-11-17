package com.poorna.newapp.resourse;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.poorna.newapp.domain.User;
import com.poorna.newapp.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	@GetMapping(value = "/createuser")
	public ModelAndView createUserView() {
		ModelAndView modelAndView = new ModelAndView("createuser");
		modelAndView.addObject("user", new User());
		modelAndView.addObject("allProfiles", getProfiles());
		return modelAndView;
	}

	@PostMapping("/createuser")
	public ModelAndView createUser( User user) {
		ModelAndView modelAndView = new ModelAndView();		
		userService.addUser(user);
		modelAndView.addObject("allUsers", userService.getAllUsers());
		modelAndView.setViewName("userinfo");
		return modelAndView;
	}

	private List<String> getProfiles() {
		List<String> list = new ArrayList<>();
		list.add("Associate");
		list.add("AVP");
		list.add("VP");
		list.add("Director");
		return list;
	}

}
