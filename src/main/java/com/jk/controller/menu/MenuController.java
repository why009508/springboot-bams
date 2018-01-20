package com.jk.controller.menu;

import com.jk.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("Menu")
@EnableAutoConfiguration
public class MenuController {
    /*@Autowired
    private MenuService menuService;*/

    @RequestMapping("toMenuList")
    public String toMenuList() {
        return "../menuManage/menuList";
    }
}
