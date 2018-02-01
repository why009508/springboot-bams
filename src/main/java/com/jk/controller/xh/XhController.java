package com.jk.controller.xh;

import com.jk.pojo.xh.JokeDemo;
import com.jk.service.xh.XhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/22.
 */
@Controller
@RequestMapping("xhc")
public class XhController {

    @Autowired
    private XhService xhService;

    @RequestMapping("toXhList")
    public String toXhList() {
        return "../xh/xhlist";
    }

    @RequestMapping("toShXhList")
    public String toShXhList() {
        return "../sh/yllist";
    }

    @RequestMapping("toAddXhua")
    public String toAddXhua() {
        return "../xh/xhadd";
    }

    @RequestMapping("/queryXh")
    @ResponseBody
    public Object queryXh(JokeDemo joke,int page,int rows){
        if(joke.getJotitle()!=""){
            Map<String, Object> menutree = xhService.queryXh(joke,page,rows);
            return menutree;
        }else{
            Map<String, Object> menutree = xhService.queryXh(joke,page,rows);
            return menutree;
        }
    }

    @RequestMapping("/addXhua")
    @ResponseBody
    public int addXhua(JokeDemo joke,HttpSession session){
        Date date = new Date();
        joke.setJotime(date);
        joke.setJuid(1);
        int i = 0;
        i = xhService.addXhua(joke);
        return i;
    }

    //单条删除流程
    @RequestMapping("delXiaoh")
    @ResponseBody
    int delXiaoh(JokeDemo hrm){

        int i = xhService.delXiaoh(hrm);
        System.out.println(hrm.getJoid());
        return i;
    }

    //查询当前行跳转修改页面
    @RequestMapping("toUpdXhua")
    String toUpdXhua(JokeDemo hrm,HttpServletRequest request){
        JokeDemo orglist = xhService.toUpdXhua(hrm);
        request.setAttribute("xhupd",orglist);
        return "../xh/xhupd";
    }

    //修改当前行内容
    @RequestMapping("updXhua")
    @ResponseBody
    int updXhua(JokeDemo hrm){
        int i = xhService.updXhua(hrm);
        return i;
    }
}
