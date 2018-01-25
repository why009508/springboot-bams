package com.jk.pojo.tree;

import java.util.List;

public class MenuTree {
    private Integer id;

    private String text;

    private Integer pid;

    private String url;

    private String closed;

    /*业务字段*/
    private String href;

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getId() {
        return id;
    }

    private List<MenuTree> nodes;

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getClosed() {
        return closed;
    }

    public void setClosed(String closed) {
        this.closed = closed == null ? null : closed.trim();
    }

    public List<MenuTree> getNodes() {
        return nodes;
    }

    public void setNodes(List<MenuTree> nodes) {
        this.nodes = nodes;
    }
}