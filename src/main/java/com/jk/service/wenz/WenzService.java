package com.jk.service.wenz;

import com.jk.pojo.wenz.EssayDemo;

import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
public interface WenzService {
    Map<String,Object> queryWenz(EssayDemo essay, int page, int rows);

    int updPizhun(EssayDemo essay);

    int updnoPizhun(EssayDemo essay);
}
