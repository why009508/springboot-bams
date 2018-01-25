package com.jk.service.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.User;
import com.jk.pojo.user.UserInfo;

public interface UsersService {
    JSONObject queryUserPage(int page, int rows,UserInfo userinfo);

    int deleteUsers(int userinfoid);
}
