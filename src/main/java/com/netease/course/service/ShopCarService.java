package com.netease.course.service;

import com.netease.course.dao.ContentMapper;
import com.netease.course.dao.ShopCarMapper;
import com.netease.course.meta.ShopCarView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.XmlWebApplicationContext;

import java.util.List;

/**
 * Created by kaizige on 2018/1/28.
 */
@Service
public class ShopCarService {
    @Autowired
    ShopCarMapper shopCarMapper;
    @Autowired
    ContentMapper contentMapper;
    public  List<ShopCarView> getCarViewList(){
        return shopCarMapper.getCarViewList();
    }

    public boolean add(int contentId){
        Integer count=shopCarMapper.findCountByContentId(contentId);
        if(count==null){
            System.out.println("hello");
            shopCarMapper.addShopCar(contentId);
        }else{
            System.out.println(count);
            count++;
            shopCarMapper.updateCount(contentId,count);
        }
//       int i= shopCarMapper.addShopCar(contentId);
//        return i>0;
        return true;
    }

}
