package com.jk.controller.tsjy;

import com.jk.pojo.tsjy.ComplaintDemo;
import com.jk.service.tsjy.TsjyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Controller
@RequestMapping("tsjy")
public class TsjyController {

    @Autowired
    private TsjyService tsjyService;

    @RequestMapping("toTsjyList")
    public String toTsjyList() {
        return "../tsjy/tsjylist";
    }

    @RequestMapping("/queryTsjy")
    @ResponseBody
    public Object queryTsjy(ComplaintDemo compl, int page, int rows) {

        Map<String, Object> menutree = tsjyService.queryTsjy(compl, page, rows);
        return menutree;
    }

    //单条删除流程
    @RequestMapping("delTsjy")
    @ResponseBody
    int delTsjy(ComplaintDemo compl){

        int i = tsjyService.delTsjy(compl);
        System.out.println(compl.getComid());
        return i;
    }
}
