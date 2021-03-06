package com.jk.dao;

import com.jk.pojo.User;

import com.jk.pojo.user.Users;
import com.jk.pojo.users.Adminuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserById(int id);

    List<Adminuser> queryName(Adminuser adminuser);
}

