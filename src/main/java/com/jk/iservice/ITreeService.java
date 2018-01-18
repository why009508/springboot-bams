package com.jk.iservice;

import com.jk.dao.tree.MenuTreeMapper;
import com.jk.pojo.tree.MenuTree;
import com.jk.service.tree.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ITreeService implements TreeService{
    @Autowired
    private MenuTreeMapper menuTreeMapper;

    @Override
    public List<MenuTree> queryTree(Integer s) {
        List<MenuTree> menus = menuTreeMapper.queryTree(s);
        if(menus != null && menus.size()>0){
            for (int i = 0; i < menus.size(); i++) {
                List<MenuTree> menu2 = queryTree(menus.get(i).getId());
                menus.get(i).setNodes(menu2);
            }
        }
        return menus;
    }



}
