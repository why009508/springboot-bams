package com.jk.dao.user;

import com.jk.pojo.User;
import com.jk.pojo.user.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersMapper {
    long queryUserCount(UserInfo userinfo);
    List<User> queryUserPage(@Param("s")int start, @Param("e")int end, @Param("u")UserInfo userinfo);

    int deleteUsers(int userinfoid);
}
