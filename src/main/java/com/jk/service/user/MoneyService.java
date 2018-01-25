package com.jk.service.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.user.MoneyInfo;

public interface MoneyService {
    JSONObject queryIntegralPage(int page, int rows, MoneyInfo moneyInfo);
}
