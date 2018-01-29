package com.jk.pojo.wenz;

import java.util.Date;

public class EssayDemo {
    private Integer esid;

    private String estitle;

    private Integer esuid;

    private String escontent;

    private Date estime;

    private Integer pid;

    private String esimg;

    private Integer ebeii;

    public Integer getEbeii() {
        return ebeii;
    }

    public void setEbeii(Integer ebeii) {
        this.ebeii = ebeii;
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
}