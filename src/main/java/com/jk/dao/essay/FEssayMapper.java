package com.jk.dao.essay;

import com.jk.pojo.essay.Essay;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FEssayMapper {
    /**
     * 文章列表
     * @return
     */
    @Select("SELECT esid,estitle,escontent,estime,esimg,statue,promote,ebeii,pictitle as pictitle,username as fullname\n" +
            " FROM (SELECT e.`esid`,e.`estitle`,e.`escontent`,e.`estime`,e.`esimg`,e.`statue`,e.`promote`,e.`ebeii`,e.`pid` top , u.`username` \n" +
            "\tFROM essay e INNER JOIN users u\n" +
            "\tON e.`esuid` =u.`id` )n INNER JOIN topic t\n" +
            "ON n.top = t.`picid` where ebeii=2")
    List<Essay> getEssayList();
}
