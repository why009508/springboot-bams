package com.jk.service.menu;

import com.jk.pojo.menu.Menu;

import java.util.Map;

public interface MenuService {
    Map<String,Object> queryMenu(int page, int rows, Menu menu);

    int addMenu(Menu menu);
}
