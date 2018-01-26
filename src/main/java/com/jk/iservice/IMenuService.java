package com.jk.iservice;

import com.jk.dao.menu.MenuMapper;
import com.jk.pojo.menu.Menu;
import com.jk.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IMenuService implements MenuService{
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public Map<String, Object> queryMenu(int page, int rows, Menu menu) {
        /*总条数*/
        long total = menuMapper.queryMenuCount(menu);
//		当前页数据
        int start = (page-1)*rows;
        int end = rows;
        List<Menu> menus = menuMapper.queryMenuPage(start,end,menu);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", menus);
        return map;
    }

    @Override
    public int addMenu(Menu menu) {
        int b= menuMapper.addMenu(menu);
        return 1;
    }

    @Override
    public Menu queryMenuById(Menu menu) {
        Menu me = menuMapper.queryMenuById(menu.getId());
        return me;
    }

    @Override
    public int deleteMenu(Integer id) {
        int b = menuMapper.deleteMenu(id);
        return b;
    }

    @Override
    public int updateMenu(Menu menu) {
        int b = menuMapper.updateMenu(menu);
        return b;
    }
}
