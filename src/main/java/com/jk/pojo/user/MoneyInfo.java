package com.jk.pojo.user;


import org.springframework.core.serializer.Serializer;

public class MoneyInfo{
    private int monid;		//主键
    private String monintegrator;	//积分
    private String monbalance;	  //余额
    private String monstatus;	//状态
    private int userid;
    private String funame;
    private String usname;
    //网站用户表id

    public String getFuname() {
        return funame;
    }

    public void setFuname(String funame) {
        this.funame = funame;
    }

    public String getUsname() {
        return usname;
    }

    public void setUsname(String usname) {
        this.usname = usname;
    }

    public int getMonid() {
        return monid;
    }

    public void setMonid(int monid) {
        this.monid = monid;
    }

    public String getMonintegrator() {
        return monintegrator;
    }

    public void setMonintegrator(String monintegrator) {
        this.monintegrator = monintegrator;
    }

    public String getMonbalance() {
        return monbalance;
    }

    public void setMonbalance(String monbalance) {
        this.monbalance = monbalance;
    }

    public String getMonstatus() {
        return monstatus;
    }

    public void setMonstatus(String monstatus) {
        this.monstatus = monstatus;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
}
