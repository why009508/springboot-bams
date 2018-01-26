package com.jk.dao.promote;

import com.jk.pojo.promote.Essay;

public interface EssayMapper {
    int deleteByPrimaryKey(Integer esid);

    int insert(Essay record);

    int insertSelective(Essay record);

    Essay selectByPrimaryKey(Integer esid);

    int updateByPrimaryKeySelective(Essay record);

    int updateByPrimaryKey(Essay record);
}