package com.jk.dao.user;

import com.jk.pojo.User;
import com.jk.pojo.user.UserInfo;
import com.jk.pojo.users.Adminuser;
import com.jk.pojo.users.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersMapper {
    long queryUserCount(UserInfo userinfo);
    List<User> queryUserPage(@Param("s")int start, @Param("e")int end, @Param("u")UserInfo userinfo);

    int deleteUsers(int userinfoid);

    long queryAdminCount(Adminuser adminsuer);

    List<Adminuser> queryAdminPage(int start, int end, Adminuser adminuser);

    List<Adminuser> queryUsRo(int uid);

    List<Role> queryRole();

    int updateRid(@Param("rid") int rid,@Param("uid") int uid);
}
