package com.jk.controller.tree;

import com.jk.pojo.tree.MenuTree;
import com.jk.service.tree.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.reflect.generics.tree.Tree;

import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("Tree")
public class TreeController {
    @Autowired
    private TreeService treeService;
    @RequestMapping("/queryTree")
    @ResponseBody
    public Object queryTree(){
        List<MenuTree> menutree = treeService.queryTree(0);
        return menutree;
    }
}
