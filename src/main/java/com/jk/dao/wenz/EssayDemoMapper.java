package com.jk.dao.wenz;

import com.jk.pojo.wenz.EssayDemo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EssayDemoMapper {
    int deleteByPrimaryKey(Integer esid);

    int insert(EssayDemo record);

    int insertSelective(EssayDemo record);

    EssayDemo selectByPrimaryKey(Integer esid);

    int updateByPrimaryKeySelective(EssayDemo record);

    int updateByPrimaryKey(EssayDemo record);

    long queryTotal(EssayDemo essay);

    List<EssayDemo> queryWenz(@Param(value = "essay") EssayDemo essay, @Param(value = "start") int start, @Param(value = "end") int end);

    int updPizhun(EssayDemo essay);

    int updnoPizhun(EssayDemo essay);

    int updPizhun2(EssayDemo essay);
}