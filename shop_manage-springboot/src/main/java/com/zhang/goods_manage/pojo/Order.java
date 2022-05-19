package com.zhang.goods_manage.pojo;

public class Order {
    @Override
    public String toString() {
        return "Order{" +
                "gId=" + gId +
                ", id=" + id +
                ", goodsId=" + goodsId +
                ", orderId='" + orderId + '\'' +
                ", createTime='" + createTime + '\'' +
                ", goodsName='" + goodsName + '\'' +
                '}';
    }

    private int gId;

    public int getgId() {
        return gId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    private int id;
    private int goodsId;
    private String orderId;
    private String createTime;
    private String goodsName;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
