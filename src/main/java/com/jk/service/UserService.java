package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.User;
import com.jk.pojo.user.Users;
import com.jk.pojo.users.Adminuser;


import javax.servlet.http.HttpSession;

public interface UserService {
    User getUserById(int id);

    String login(Adminuser adminuser, HttpSession session);
}
