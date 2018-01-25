package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.User;

public interface UserService {
    User getUserById(int id);
}
