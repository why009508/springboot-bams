package com.jk.service.xh;

import com.jk.pojo.xh.JokeDemo;

import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/22.
 */
public interface XhService {
    Map<String, Object> queryXh(JokeDemo joke, int page, int rows);

    int addXhua(JokeDemo joke);

    int delXiaoh(JokeDemo hrm);

    JokeDemo toUpdXhua(JokeDemo hrm);

    int updXhua(JokeDemo hrm);

    int updPizhun(JokeDemo joke);

    int updnoPizhun(JokeDemo joke);
}
