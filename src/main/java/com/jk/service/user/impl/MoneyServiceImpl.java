package com.jk.service.user.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.user.MoneyMapper;
import com.jk.pojo.User;
import com.jk.pojo.user.MoneyInfo;
import com.jk.service.user.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MoneyServiceImpl implements MoneyService {
    @Autowired
    private MoneyMapper moneyMapper;
    @Override
    public JSONObject queryIntegralPage(int page, int rows, MoneyInfo moneyInfo) {
        long total = moneyMapper.queryIntegralCount(moneyInfo);
        int start = (page-1)*rows;
        int end = start+rows;
        List<User> money = moneyMapper.queryIntegralPage(start,end,moneyInfo);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", money);
        return json;
    }
}
