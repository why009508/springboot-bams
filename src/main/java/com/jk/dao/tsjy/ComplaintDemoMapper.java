package com.jk.dao.tsjy;

import com.jk.pojo.tsjy.ComplaintDemo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComplaintDemoMapper {
    int deleteByPrimaryKey(Integer comid);

    int insert(ComplaintDemo record);

    int insertSelective(ComplaintDemo record);

    ComplaintDemo selectByPrimaryKey(Integer comid);

    int updateByPrimaryKeySelective(ComplaintDemo record);

    int updateByPrimaryKey(ComplaintDemo record);

    long queryTotal(ComplaintDemo compl);

    List<ComplaintDemo> queryTsjy(@Param(value = "compl") ComplaintDemo compl, @Param(value = "start") int start, @Param(value = "end") int end);

    int delTsjy(ComplaintDemo compl);
}