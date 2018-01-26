package com.jk.pojo.user;

public class Anchor {
    private int anid;		//主键
    private String anname;		//主播名称
    private String annum;		//身份证号
    private String anusername; 	//主播账号
    private String anpass;

    public String getAnpass() {
        return anpass;
    }

    public void setAnpass(String anpass) {
        this.anpass = anpass;
    }

    public int getAnid() {
        return anid;
    }

    public void setAnid(int anid) {
        this.anid = anid;
    }

    public String getAnname() {
        return anname;
    }

    public void setAnname(String anname) {
        this.anname = anname;
    }

    public String getAnnum() {
        return annum;
    }

    public void setAnnum(String annum) {
        this.annum = annum;
    }

    public String getAnusername() {
        return anusername;
    }

    public void setAnusername(String anusername) {
        this.anusername = anusername;
    }
}