package com.jk.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.user.MoneyInfo;
import com.jk.service.user.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
@RequestMapping("/integral")
public class MoneyController {
    @Autowired
    private MoneyService moneyService;

    @RequestMapping("/toMoney")
    public String toMoney(){
        return "../user/moneylist";
    }
    // 积分余额查询
    @RequestMapping("/queryIntegralPage")
    @ResponseBody
    public Object queryIntegralPage(int page,int rows,MoneyInfo moneyInfo){
        JSONObject json = moneyService.queryIntegralPage(page,rows,moneyInfo);
        return json;
    }
}
