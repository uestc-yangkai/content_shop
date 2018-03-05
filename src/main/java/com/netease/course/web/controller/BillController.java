package com.netease.course.web.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.netease.course.dao.ShopCarMapper;
import com.netease.course.meta.Bill;
import com.netease.course.meta.BillView;
import com.netease.course.meta.ShopCar;
import com.netease.course.service.BillService;
import com.netease.course.service.ShopCarService;
import com.netease.course.util.PropertiesRead;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kaizige on 2018/2/2.
 */
@Controller
@RequestMapping("/bill")
public class BillController {
    @Autowired
    BillService billService;
    @RequestMapping("/add")
    public String add(Model model){
        billService.add();
        String msgkey="buy.success";
        model.addAttribute("msg", PropertiesRead.getProperty(msgkey));
        return "ensurecar";
    }
    @RequestMapping("/list")
    public String check(Model model){
        List<BillView> billViewList=billService.getBillView();
        double sumPrice=0;
        for(BillView billView:billViewList){
            sumPrice+=(billView.getBuyPrice()*billView.getCount());
        }
        System.out.println(billViewList);
        model.addAttribute("billViewList",billViewList);
        model.addAttribute("sumPrice",sumPrice);
        return "bill";
    }
}
