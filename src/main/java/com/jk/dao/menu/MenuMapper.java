package com.jk.dao.menu;

import com.jk.pojo.menu.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {

    long queryMenuCount(@Param("menu")Menu menu);

    List<Menu> queryMenuPage(@Param("start") int start, @Param("end")int end, @Param("menu")Menu menu);

    int addMenu(Menu menu);
}