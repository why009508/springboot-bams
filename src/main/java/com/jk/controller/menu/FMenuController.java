package com.jk.controller.menu;

import com.jk.pojo.menu.Menu;
import com.jk.service.menu.FMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("FMenu")
@EnableAutoConfiguration
public class FMenuController {
    @Autowired
    private FMenuService fMenuService;

    @RequestMapping("getIndexMenu")
    public Object getIndexMenu(){
        System.out.print("主页菜单");
        List<Menu> indexMenuList = fMenuService.getIndexMenu();
        return indexMenuList;
    }
}
