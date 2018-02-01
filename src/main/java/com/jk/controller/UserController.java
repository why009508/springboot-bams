package com.jk.controller;

import com.alibaba.fastjson.JSONArray;
import com.jk.pojo.User;
import com.jk.pojo.user.Users;
import com.jk.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@EnableAutoConfiguration
public class UserController {
    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    //跳转页面
    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session) {
        //在这根据当前用户ID查询他所拥有的角色返回Integer
        session.setAttribute("userjs",1);//这里添加一个假数据假设当前用户的角色是1
        //Integer aa = (Integer) session.getAttribute("userjs");
        //System.out.print(aa);
        return "../main/index";
    }


    @RequestMapping("/getUserById")
    @ResponseBody
    public User getUserById(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);
        if(user!=null){
            logger.info(JSONArray.toJSON(user));
        }
        return user;
    }

    @RequestMapping("/login")
    @ResponseBody
    public Object login(Users users, HttpSession session){
        String loginFlag = null;
        loginFlag = userService.login(users,session);
        return loginFlag;
    }
}

