package com.netease.course.web.controller;

import com.netease.course.dao.ShopCarMapper;
import com.netease.course.meta.ShopCar;
import com.netease.course.meta.ShopCarView;
import com.netease.course.service.ShopCarService;
import com.netease.course.util.PropertiesRead;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AliasFor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kaizige on 2018/1/30.
 */
@Controller
@RequestMapping("/shopcar")
public class ShopcarController {
    @Autowired
    ShopCarService shopCarService;
    @RequestMapping("/add")
public String add(Model model, @RequestParam("contentId") Integer contentId){
       boolean flag= shopCarService.add(contentId);
        String  msgkey=flag?"car.success":"car.failure";
        String msg= PropertiesRead.getProperty(msgkey);
        model.addAttribute("msg",msg);
    return "ensurecar";
}
    @RequestMapping("/list")
    public String list(Model model){
        List<ShopCarView> carViewList=shopCarService.getCarViewList();
        model.addAttribute("carViewList",carViewList);
        return "carlist";
    }
}
