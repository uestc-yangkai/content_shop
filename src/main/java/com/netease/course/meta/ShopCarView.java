package com.netease.course.meta;

/**
 * Created by kaizige on 2018/1/31.
 */
public class ShopCarView extends ShopCar{
    private String title;
    private int currentPrice;
    public String getTitle() {
        return title;
    }

    public int getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(int currentPrice) {
        this.currentPrice = currentPrice;
    }
    public ShopCarView(){
    }
    public ShopCarView(int contentId, int count, String title,int currentPrice) {
        super(contentId,count);
        this.title = title;
        this.currentPrice=currentPrice;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public static void main(String[] args) {
    }
}
