package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.UserMapper;
import com.jk.pojo.User;

import com.jk.pojo.user.Users;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class IUserService implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public String login(Users users, HttpSession session) {
        List<Users> list = userMapper.queryName(users);
        if(list.size()==1){
            Users u = list.get(0);
            if(u.getUserpass().equals(users.getUserpass())){
                session.setAttribute("loginuser", u);
                return "yes";
            }else{
                return "passno";
            }
        }
        return "nameno";
    }


}
