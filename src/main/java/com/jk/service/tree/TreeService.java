package com.jk.service.tree;

import com.jk.pojo.tree.MenuTree;

import java.util.List;

public interface TreeService {
    List<MenuTree> queryTree(Integer s);
}
