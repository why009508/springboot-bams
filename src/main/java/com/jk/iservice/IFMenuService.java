package com.jk.iservice;

import com.jk.dao.menu.FMenuMapper;
import com.jk.pojo.menu.Menu;
import com.jk.service.menu.FMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IFMenuService implements FMenuService{
    @Autowired
    private FMenuMapper fMenuMapper;
    @Override
    public List<Menu> getIndexMenu() {
        List<Menu> indexMenu = fMenuMapper.getIndexMenu();
        return indexMenu;
    }
}
