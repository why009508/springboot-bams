package com.jk.dao.essay;


import com.jk.pojo.essay.Essay;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.LinkedHashMap;
import java.util.List;

public interface EssayMapper {
    int deleteByPrimaryKey(Integer esid);

    int insert(Essay record);

    int insertSelective(Essay record);

    Essay selectByPrimaryKey(Integer esid);

    int updateByPrimaryKeySelective(Essay record);

    int updateByPrimaryKey(Essay record);

    /**
     * 文章总条数
     * @param essay
     * @return
     */
    @Select("SELECT  count(*) from essay")
    long selectCountList(Essay essay);

    /**
     * 文章列表
     * @param pageSize
     * @param start
     * @param essay
     * @return
     */
    @Select("SELECT esid,estitle,escontent,estime,esimg,statue,promote,pictitle as pictitle,username as fullname\n" +
            " FROM (SELECT e.`esid`,e.`estitle`,e.`escontent`,e.`estime`,e.`esimg`,e.`statue`,e.`promote`,e.`pid` top , u.`username` \n" +
            "\tFROM essay e INNER JOIN users u\n" +
            "\tON e.`esuid` =u.`id` )n INNER JOIN topic t\n" +
            "ON n.top = t.`picid`  limit #{start},#{pageSize}")
    List<LinkedHashMap> selectEssayList(@Param("pageSize") Integer pageSize, @Param("start") Integer start, @Param("essay") Essay essay);

    /**
     * 批量删除
     * @param idlist
     * @return
     *  collection ：@param注解中的value属性值 参数名
        open：在循环开始拼接的字符
        close：在循环结束的时候拼接的字符
        separator：每条数据以固定字符分割
        index：下标/序号
        item：别名
     */
    @Select("DELETE FROM essay WHERE esid =#{id}")
    /*
    * 是否通过#取变量值，必须要通过@param标签
    * */
    void delEssay(@Param("id") Integer idlist);

    /**
     * 根据id 查询回显框内容--模态框展示的内容
     * @param esid
     * @return
     */
    @Select("SELECT esid,estitle,escontent,estime,esimg,statue,pictitle AS pictitle,username AS fullname,pid,esuid\n" +
            "     FROM (SELECT e.`esid`,e.`estitle`,e.`escontent`,e.`estime`,e.`esimg`,e.`statue`,e.`pid`,e.`esuid`,u.`username` \n" +
            "            FROM essay e INNER JOIN users u\n" +
            "           ON e.`esuid` =u.`id` )n INNER JOIN topic t \n" +
            "            ON n.pid = t.`picid`\n" +
            "           WHERE esid  =#{id}")
    Essay findById(@Param("id") Integer esid);

    /**
     * 修改
     * @param essay
     */
    @Select("   UPDATE essay \n" +
            "      SET estitle =#{essay.estitle},esuid=#{essay.esuid},escontent=#{essay.escontent},pid=#{essay.pid}\n" +
            "      WHERE esid = #{essay.esid}")
    void updateEssay(@Param("essay") Essay essay);
}