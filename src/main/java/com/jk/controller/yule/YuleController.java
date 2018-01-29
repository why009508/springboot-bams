package com.jk.controller.yule;

import com.jk.pojo.wenz.EssayDemo;
import com.jk.pojo.xh.JokeDemo;
import com.jk.service.xh.XhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Controller
@RequestMapping("ylc")
public class YuleController {

    @Autowired
    private XhService xhService;

    @RequestMapping("toylList")
    public String toylList() {
        return "../sh/yllist";
    }

    @RequestMapping("/yllist")
    @ResponseBody
    public Object yllist(JokeDemo joke, int page, int rows){
            Map<String, Object> menutree = xhService.queryXh(joke,page,rows);
            return menutree;
        }

    @RequestMapping("updPiyule")
    @ResponseBody
    int updPiyule(JokeDemo joke){
        int i = xhService.updPizhun(joke);
        return i;
    }

    @RequestMapping("updbuPiyule")
    @ResponseBody
    int updbuPiyule(JokeDemo joke){
        int i = xhService.updnoPizhun(joke);
        return i;
    }

}
