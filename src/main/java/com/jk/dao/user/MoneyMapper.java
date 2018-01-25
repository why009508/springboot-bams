package com.jk.dao.user;

import com.jk.pojo.User;
import com.jk.pojo.user.MoneyInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneyMapper {
    long queryIntegralCount(MoneyInfo moneyInfo);

    List<User> queryIntegralPage(@Param("s") int start, @Param("e")int end, @Param("mo")MoneyInfo moneyInfo);
}
