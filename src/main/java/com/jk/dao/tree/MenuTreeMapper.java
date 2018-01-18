package com.jk.dao.tree;

import com.jk.pojo.tree.MenuTree;

import java.util.List;

public interface MenuTreeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MenuTree record);

    int insertSelective(MenuTree record);

    MenuTree selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MenuTree record);

    int updateByPrimaryKey(MenuTree record);

    List<MenuTree> queryTree(Integer s);
}