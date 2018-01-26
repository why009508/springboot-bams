package com.jk.pojo.tupian;

import java.util.Date;

public class PhotosDemo {
    private Integer phoid;

    private String phourl;

    private Date photime;

    private String phoname;

    private Integer pbeii;

    private String pbeiv;

    public Integer getPhoid() {
        return phoid;
    }

    public void setPhoid(Integer phoid) {
        this.phoid = phoid;
    }

    public String getPhourl() {
        return phourl;
    }

    public void setPhourl(String phourl) {
        this.phourl = phourl == null ? null : phourl.trim();
    }

    public Date getPhotime() {
        return photime;
    }

    public void setPhotime(Date photime) {
        this.photime = photime;
    }

    public String getPhoname() {
        return phoname;
    }

    public void setPhoname(String phoname) {
        this.phoname = phoname == null ? null : phoname.trim();
    }

    public Integer getPbeii() {
        return pbeii;
    }

    public void setPbeii(Integer pbeii) {
        this.pbeii = pbeii;
    }

    public String getPbeiv() {
        return pbeiv;
    }

    public void setPbeiv(String pbeiv) {
        this.pbeiv = pbeiv == null ? null : pbeiv.trim();
    }
}