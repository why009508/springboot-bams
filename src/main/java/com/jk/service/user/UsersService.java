package com.jk.service.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.User;
import com.jk.pojo.user.UserInfo;
import com.jk.pojo.users.Adminuser;
import com.jk.pojo.users.Role;

import java.util.List;

public interface UsersService {
    JSONObject queryUserPage(int page, int rows,UserInfo userinfo);

    int deleteUsers(int userinfoid);

    JSONObject queryAdminPage(int rows, int page, Adminuser adminuser);

    List<Adminuser> queryUsRo(int uid);

    List<Role> queryRole();

    int updateRid(int rid, int uid);
}
