package com.jk.pojo.essay;

import java.util.Date;

public class Essay {
	//征文表
    private Integer esid;

    private String estitle;//标题

    private Integer esuid;//网站用户表(查昵称)

    private String escontent;//内容

    private Date estime;//提交时间

    private Integer pid;//话题表id

    private String esimg;//图片封面

    private Integer statue;//状态字段 statue. 1=已审核，0 = 未审核

    private Integer promote; //1没有推广 2已经推广
    //业务字段
    private String fullname;//作者昵称
    private String pictitle;//话题表标题



    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPictitle() {
        return pictitle;
    }

    public void setPictitle(String pictitle) {
        this.pictitle = pictitle;
    }

    public Integer getEsid() {
        return esid;
    }

    public void setEsid(Integer esid) {
        this.esid = esid;
    }

    public String getEstitle() {
        return estitle;
    }

    public void setEstitle(String estitle) {
        this.estitle = estitle == null ? null : estitle.trim();
    }

    public Integer getEsuid() {
        return esuid;
    }

    public void setEsuid(Integer esuid) {
        this.esuid = esuid;
    }

    public String getEscontent() {
        return escontent;
    }

    public void setEscontent(String escontent) {
        this.escontent = escontent == null ? null : escontent.trim();
    }

    public Date getEstime() {
        return estime;
    }

    public void setEstime(Date estime) {
        this.estime = estime;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getEsimg() {
        return esimg;
    }

    public void setEsimg(String esimg) {
        this.esimg = esimg == null ? null : esimg.trim();
    }

    public Integer getStatue() {
        return statue;
    }

    public void setStatue(Integer statue) {
        this.statue = statue;
    }

    public Integer getPromote() {
        return promote;
    }

    public Essay setPromote(Integer promote) {
        this.promote = promote;
        return this;
    }

    @Override
    public String toString() {
        return "Essay{" +
                "esid=" + esid +
                ", estitle='" + estitle + '\'' +
                ", esuid=" + esuid +
                ", escontent='" + escontent + '\'' +
                ", estime=" + estime +
                ", pid=" + pid +
                ", esimg='" + esimg + '\'' +
                ", statue=" + statue +
                ", fullname='" + fullname + '\'' +
                ", pictitle='" + pictitle + '\'' +
                '}';
    }
}

