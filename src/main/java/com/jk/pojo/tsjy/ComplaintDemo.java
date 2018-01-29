package com.jk.pojo.tsjy;

import java.util.Date;

public class ComplaintDemo {
    private Integer comid;

    private Integer cuid;

    private String commsg;

    private Date comtime;

    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public Integer getCuid() {
        return cuid;
    }

    public void setCuid(Integer cuid) {
        this.cuid = cuid;
    }

    public String getCommsg() {
        return commsg;
    }

    public void setCommsg(String commsg) {
        this.commsg = commsg == null ? null : commsg.trim();
    }

    public Date getComtime() {
        return comtime;
    }

    public void setComtime(Date comtime) {
        this.comtime = comtime;
    }
}