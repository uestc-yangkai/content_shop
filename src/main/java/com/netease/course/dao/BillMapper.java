package com.netease.course.dao;

import com.netease.course.meta.Bill;
import com.netease.course.meta.BillView;

import java.util.List;

/**
 * Created by kaizige on 2018/2/2.
 */
public interface BillMapper {
public int getBuyPrice(int contentId);
    public int add(Bill bill);
    public List<BillView> getBillView();
}
