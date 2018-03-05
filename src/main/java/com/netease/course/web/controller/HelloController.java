package com.netease.course.web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import com.netease.course.meta.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
public class HelloController {
	@RequestMapping("/test")
	@ResponseBody
	public User aaa(){
		User user=new User();
		user.setId(2);
		user.setUserName("yankgia");
		user.setPassWord("meiyu");
			return user;
	}


}
