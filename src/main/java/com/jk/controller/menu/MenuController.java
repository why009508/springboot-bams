package com.jk.controller.menu;

import com.jk.pojo.menu.Menu;
import com.jk.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("Menu")
@EnableAutoConfiguration
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("toMenuList")
    public String toMenuList() {
        return "../menuManage/menuList";
    }

    @RequestMapping("queryMenu")
    @ResponseBody
    public Object queryMenu(int page, int rows, Menu menu) {
        Map<String, Object> map = menuService.queryMenu(page, rows, menu);
        return map;
    }

    @RequestMapping("toAddMenu")
    public String toAddMenu() {
        return "../menuManage/addMenu";
    }

    @RequestMapping("addMenu")
    @ResponseBody
    public Object addMenu(Menu menu) {
        int b = menuService.addMenu(menu);
        return 1;
    }

    @RequestMapping("toEditMenu")
    public String toEditMenu(HttpServletRequest request, Menu menu) {
        Menu me = menuService.queryMenuById(menu);
        request.setAttribute("me", me);
        return "../menuManage/editMenu";
    }

    @RequestMapping("deleteMenu")
    @ResponseBody
    public Object deleteMenu(Menu menu) {
        int b = menuService.deleteMenu(menu.getId());
        return 1;
    }


    @RequestMapping("updateMenu")
    @ResponseBody
    public Object updateMenu(Menu menu) {
        int b = menuService.updateMenu(menu);
        return 1;
    }
}
