package com.jk.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.user.UserInfo;
import com.jk.service.UserService;
import com.jk.service.user.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
@EnableAutoConfiguration
public class UsersController {

    @Autowired
    private UsersService usersService;
    // 跳转到用户列表页面
    @RequestMapping("/toUserList")
    public String touserlist(){
        return "../user/userList";
    }
    @RequestMapping("/queryUserPage")
    @ResponseBody
    public Object queryUserPage(int page, int rows, UserInfo userinfo){
        JSONObject json = usersService.queryUserPage(page,rows,userinfo);
        return json;
    }
    @RequestMapping("/deleteUsers")
    @ResponseBody
    public Object deleteUsers(UserInfo userInfo){
        int a = usersService.deleteUsers(userInfo.getUserinfoid());
        return a;
    }
}
