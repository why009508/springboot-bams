package com.jk.pojo.xh;

import java.util.Date;

public class JokeDemo {
    private Integer joid;

    private String jotitle;

    private Date jotime;

    private String jocontent;

    private String jotype;

    private Integer juid;

    private Integer beii;

    private String beiv;

    private Date statime;

    private Date endtime;


    public Date getStatime() {
        return statime;
    }

    public void setStatime(Date statime) {
        this.statime = statime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getJoid() {
        return joid;
    }

    public void setJoid(Integer joid) {
        this.joid = joid;
    }

    public String getJotitle() {
        return jotitle;
    }

    public void setJotitle(String jotitle) {
        this.jotitle = jotitle == null ? null : jotitle.trim();
    }

    public Date getJotime() {
        return jotime;
    }

    public void setJotime(Date jotime) {
        this.jotime = jotime;
    }

    public String getJocontent() {
        return jocontent;
    }

    public void setJocontent(String jocontent) {
        this.jocontent = jocontent == null ? null : jocontent.trim();
    }

    public String getJotype() {
        return jotype;
    }

    public void setJotype(String jotype) {
        this.jotype = jotype == null ? null : jotype.trim();
    }

    public Integer getJuid() {
        return juid;
    }

    public void setJuid(Integer juid) {
        this.juid = juid;
    }

    public Integer getBeii() {
        return beii;
    }

    public void setBeii(Integer beii) {
        this.beii = beii;
    }

    public String getBeiv() {
        return beiv;
    }

    public void setBeiv(String beiv) {
        this.beiv = beiv == null ? null : beiv.trim();
    }
}