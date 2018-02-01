package com.jk.service.user.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.user.UsersMapper;
import com.jk.pojo.User;
import com.jk.pojo.user.UserInfo;
import com.jk.pojo.users.Adminuser;
import com.jk.pojo.users.Role;
import com.jk.service.UserService;
import com.jk.service.user.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Autowired UsersMapper usersMapper;
    @Override
    public JSONObject queryUserPage(int page, int rows, UserInfo userinfo) {
        long total = usersMapper.queryUserCount(userinfo);
        int start = (page-1)*rows;
        int end = start+rows;
        List<User> users = usersMapper.queryUserPage(start,end,userinfo);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", users);
        return json;
    }

    @Override
    public int deleteUsers(int userinfoid) {
        return usersMapper.deleteUsers(userinfoid);
    }

    @Override
    public JSONObject queryAdminPage(int rows, int page, Adminuser adminuser) {
        long total = usersMapper.queryAdminCount(adminuser);
        int start = (page-1)*rows;
        int end = start+rows;
        List<Adminuser> userlist = usersMapper.queryAdminPage(start,end,adminuser);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", userlist);
        return json;
    }

    @Override
    public List<Adminuser> queryUsRo(int uid) {
        return usersMapper.queryUsRo(uid);
    }

    @Override
    public List<Role> queryRole() {
        return usersMapper.queryRole();
    }

    @Override
    public int updateRid(int rid,int uid) {
        return usersMapper.updateRid(rid,uid);
    }
}
