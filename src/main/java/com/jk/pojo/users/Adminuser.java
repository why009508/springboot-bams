package com.jk.pojo.users;

public class Adminuser {

    private int uid;
    private String uname;
    private String upass;
    private String ustatic;
    private int rid;
    private String rname;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getUstatic() {
        return ustatic;
    }

    public void setUstatic(String ustatic) {
        this.ustatic = ustatic;
    }
}
