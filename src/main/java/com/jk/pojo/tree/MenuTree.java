package com.jk.pojo.tree;

import java.util.List;

public class MenuTree {
    private Integer id;

    private String text;

    private Integer pid;

    private String href;

    private String closed;

    private List<MenuTree> nodes;

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

    public String getClosed() {
        return closed;
    }

    public MenuTree setClosed(String closed) {
        this.closed = closed;
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