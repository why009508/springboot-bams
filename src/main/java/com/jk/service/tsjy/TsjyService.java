package com.jk.service.tsjy;

import com.jk.pojo.tsjy.ComplaintDemo;

import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
public interface TsjyService {
    Map<String,Object> queryTsjy(ComplaintDemo compl, int page, int rows);

    int delTsjy(ComplaintDemo compl);
}
