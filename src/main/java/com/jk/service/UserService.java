package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.User;
import com.jk.pojo.user.Users;


import javax.servlet.http.HttpSession;

public interface UserService {
    User getUserById(int id);

    String login(Users users, HttpSession session);
}
