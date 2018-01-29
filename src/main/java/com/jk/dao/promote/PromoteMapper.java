package com.jk.dao.promote;


import com.jk.pojo.essay.Essay;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.LinkedHashMap;
import java.util.List;

public interface PromoteMapper {
    int deleteByPrimaryKey(Integer esid);

    int insert(Essay record);

    int insertSelective(Essay record);

    Essay selectByPrimaryKey(Integer esid);

    int updateByPrimaryKeySelective(Essay record);

    int updateByPrimaryKey(Essay record);

    /**
     * 修改
     * @param esid
     */
    @Select("   UPDATE essay \n" +
            "      SET promote = 2\n" +
            "      WHERE esid = #{esid}")
    void proEssay(@Param("esid") Integer esid);

    /**
     * 修改
     * @param esid
     */
    @Select("   UPDATE essay \n" +
            "      SET promote = 1\n" +
            "      WHERE esid = #{esid}")
    void cancelPromote(@Param("esid") Integer esid);

}