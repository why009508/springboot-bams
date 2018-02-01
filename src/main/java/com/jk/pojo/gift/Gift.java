package com.jk.pojo.gift;

public class Gift {
    private Integer giftid;

    private String giftname;

    private Integer giftprice;

    private String giftimg;

    private String giftfailtime;

    private Integer giftstatus;

    public Integer getGiftid() {
        return giftid;
    }

    public void setGiftid(Integer giftid) {
        this.giftid = giftid;
    }

    public String getGiftname() {
        return giftname;
    }

    public void setGiftname(String giftname) {
        this.giftname = giftname == null ? null : giftname.trim();
    }

    public Integer getGiftprice() {
        return giftprice;
    }

    public void setGiftprice(Integer giftprice) {
        this.giftprice = giftprice;
    }

    public String getGiftfailtime() {
        return giftfailtime;
    }

    public void setGiftfailtime(String giftfailtime) {
        this.giftfailtime = giftfailtime == null ? null : giftfailtime.trim();
    }

    public Integer getGiftstatus() {
        return giftstatus;
    }

    public void setGiftstatus(Integer giftstatus) {
        this.giftstatus = giftstatus;
    }

    public String getGiftimg() {
        return giftimg;
    }

    public Gift setGiftimg(String giftimg) {
        this.giftimg = giftimg;
        return this;
    }
}