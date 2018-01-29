package com.jk.dao.xh;

import com.jk.pojo.xh.JokeDemo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JokeDemoMapper {
    int deleteByPrimaryKey(Integer joid);

    int insert(JokeDemo record);

    int insertSelective(JokeDemo joke);

    JokeDemo selectByPrimaryKey(Integer joid);

    int updateByPrimaryKeySelective(JokeDemo record);

    int updateByPrimaryKey(JokeDemo hrm);

    List<JokeDemo> queryXh(@Param(value = "joke") JokeDemo joke, @Param(value = "start") int start, @Param(value = "end") int end);

    long queryTotal(JokeDemo joke);

    int delXiaoh(JokeDemo hrm);

    JokeDemo toUpdXhua(JokeDemo hrm);

    int updPizhun(JokeDemo joke);

    int updnoPizhun(JokeDemo joke);
}