package com.netease.course.web.controller;

import com.netease.course.util.ForwordException;
import com.netease.course.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by kaizige on 2018/1/30.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserMapper userMapper;
    @RequestMapping("/login")
    public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session,
                      @RequestParam("userName") String userName, @RequestParam("passWord") String passWord){
        try {
            if(userMapper.hasUser(userName,passWord)>0){//登陆成功
                session.setAttribute("userName",userName);
                request.getRequestDispatcher("/api/content/list").forward(request,response);

            }
            response.sendRedirect("/spring-web/login.html");
        } catch (Exception e) {
           throw new ForwordException("跳转出错");
        }
    }
    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session){
            session.setAttribute("userName",null);
        try{
            request.getRequestDispatcher("/api/content/list").forward(request,response);
        } catch (Exception e) {
            throw new ForwordException("跳转出错");
        }
    }
}
