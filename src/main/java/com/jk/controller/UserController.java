package com.jk.controller;

import com.alibaba.fastjson.JSONArray;
import com.jk.pojo.User;
import com.jk.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@EnableAutoConfiguration
public class UserController {
    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    //跳转页面
    @RequestMapping("/toIndex")
    public String toIndex() {
        System.out.print("1231312312");
        return "../main/index";
    }
    @RequestMapping("/see")
    public String toSee(){
        return "/see";
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
}
