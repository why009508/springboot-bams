package com.jk.service.essay;



import com.jk.pojo.essay.Essay;

import java.util.Map;

public interface EssayService {
    Map SelectUserList(Integer pageSize, Integer start, Essay essay);

    /**
     * 征文批量删除
     * @param ids
     * @return
     */
    int delEssay(String ids);

    /**
     * 创建模态框
     * @param esid
     * @return
     */
    Essay findById(Integer esid);

    /**
     * 修改
     * @param essay
     */
    void updateEssay(Essay essay);
}
