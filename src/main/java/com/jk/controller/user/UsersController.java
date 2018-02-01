package com.jk.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.user.UserInfo;
import com.jk.pojo.users.Adminuser;
import com.jk.pojo.users.Role;
import com.jk.service.UserService;
import com.jk.service.user.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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
    // 六表联查普通用户信息
    @RequestMapping("/queryUserPage")
    @ResponseBody
    public Object queryUserPage(int page, int rows, UserInfo userinfo){
        JSONObject json = usersService.queryUserPage(page,rows,userinfo);
        return json;
    }
    // 删除用户信息
    @RequestMapping("/deleteUsers")
    @ResponseBody
    public Object deleteUsers(UserInfo userInfo){
        int a = usersService.deleteUsers(userInfo.getUserinfoid());
        return a;
    }
    // 跳转到管理员列表页面
    @RequestMapping("/toadminList")
    public String toadminList(){
        return "../user/adminlist";
    }
    // 管理员列表查询
    @RequestMapping("/queryAdminPage")
    @ResponseBody
    public Object queryAdminPage(int rows,int page,Adminuser adminuser){
        JSONObject json = usersService.queryAdminPage(rows,page,adminuser);
        return json;
    }

    // 跳转角色弹框
    @RequestMapping("/torole")
    public String todigrole(Adminuser adminuser,HttpServletRequest request){
        request.setAttribute("userid", adminuser.getUid());
        List<Adminuser> list1 = usersService.queryUsRo(adminuser.getUid());
        List<Role> list2 = usersService.queryRole();
        request.setAttribute("uro", list1);
        request.setAttribute("rol", list2);
        return "../user/digrole";
    }
    @RequestMapping("/addRid")
    @ResponseBody
    public Object addRid(String r,Adminuser adminuser){
        int rid = Integer.parseInt(r);
        int sa = usersService.updateRid(rid,adminuser.getUid());
        return sa;
    }
}
