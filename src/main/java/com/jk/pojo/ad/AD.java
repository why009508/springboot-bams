package com.jk.pojo.ad;

public class AD {
    private Integer adid;

    private String adname;

    private String adtext;

    private String adimg;

    private Integer adstatus;

    public Integer getAdid() {
        return adid;
    }

    public void setAdid(Integer adid) {
        this.adid = adid;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname == null ? null : adname.trim();
    }

    public String getAdtext() {
        return adtext;
    }

    public void setAdtext(String adtext) {
        this.adtext = adtext == null ? null : adtext.trim();
    }

    public String getAdimg() {
        return adimg;
    }

    public void setAdimg(String adimg) {
        this.adimg = adimg == null ? null : adimg.trim();
    }

    public Integer getAdstatus() {
        return adstatus;
    }

    public void setAdstatus(Integer adstatus) {
        this.adstatus = adstatus;
    }
}