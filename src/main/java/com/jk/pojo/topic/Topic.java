package com.jk.pojo.topic;

import java.util.Date;

public class Topic {
	//话题表
    private Integer picid;

    private String pictitle;//标题

    private String piccontent;//对应图片

    private String starttime;//开始时间

    private String endtime;//结束时间

    private String statue;//专题状态：1代表正常，0代表未启用，2代表失效3代表未到开启时间，。

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getStatue() {
        return statue;
    }

    public void setStatue(String statue) {
        this.statue = statue;
    }

    public Integer getPicid() {
        return picid;
    }

    public void setPicid(Integer picid) {
        this.picid = picid;
    }

    public String getPictitle() {
        return pictitle;
    }

    public void setPictitle(String pictitle) {
        this.pictitle = pictitle == null ? null : pictitle.trim();
    }

    public String getPiccontent() {
        return piccontent;
    }

    public void setPiccontent(String piccontent) {
        this.piccontent = piccontent == null ? null : piccontent.trim();
    }

    @Override
    public String toString() {
        return "Topic{" +
                "picid=" + picid +
                ", pictitle='" + pictitle + '\'' +
                ", piccontent='" + piccontent + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", statue=" + statue +
                '}';
    }
}