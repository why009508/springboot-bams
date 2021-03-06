package com.jk.pojo.tree;

import java.util.List;

public class MenuTree {
    private Integer id;

    private String text;

    private Integer pid;

    private String url;

    private String state;

    private String icon;

    private List<MenuTree> nodes;
    /*业务字段*/
    private String href;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public MenuTree setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getText() {
        return text;
    }

    public MenuTree setText(String text) {
        this.text = text;
        return this;
    }

    public Integer getPid() {
        return pid;
    }

    public MenuTree setPid(Integer pid) {
        this.pid = pid;
        return this;
    }

    public String getHref() {
        return href;
    }

    public MenuTree setHref(String href) {
        this.href = href;
        return this;
    }

    public String getState() {
        return state;
    }

    public MenuTree setState(String state) {
        this.state = state;
        return this;
    }

    public String getIcon() {
        return icon;
    }

    public MenuTree setIcon(String icon) {
        this.icon = icon;
        return this;
    }

    public List<MenuTree> getNodes() {
        return nodes;
    }

    public MenuTree setNodes(List<MenuTree> nodes) {
        this.nodes = nodes;
        return this;
    }
}