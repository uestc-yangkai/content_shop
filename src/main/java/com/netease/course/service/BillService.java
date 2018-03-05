package com.netease.course.service;

import com.netease.course.dao.BillMapper;
import com.netease.course.dao.ContentMapper;
import com.netease.course.dao.ShopCarMapper;
import com.netease.course.meta.Bill;
import com.netease.course.meta.BillView;
import com.netease.course.meta.ShopCar;
import com.netease.course.meta.ShopCarView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by kaizige on 2018/2/2.
 */
@Service
public class BillService {
    @Autowired
    private BillMapper billMapper;
    @Autowired
    private ShopCarMapper shopCarMapper;
    @Autowired
    private ContentMapper contentMapper;
    public int getBuyPrice(int contentId){
        return  billMapper.getBuyPrice(contentId);
    }
    @Transactional
    public void add(){
       List<ShopCarView> list=shopCarMapper.getCarViewList();
        for(ShopCarView carView:list){
            Bill bill=new Bill();
            bill.setContentId(carView.getContent_id());
            bill.setBuyPrice(carView.getCurrentPrice());
            bill.setCount(carView.getCount());
            billMapper.add(bill);
            contentMapper.updateMark(carView.getContent_id());
        }
    }

    public List<BillView> getBillView() {
        return billMapper.getBillView();
    }
}
