package com.jk.controller.wenz;

import com.jk.pojo.wenz.EssayDemo;
import com.jk.pojo.xh.JokeDemo;
import com.jk.service.wenz.WenzService;
import com.jk.service.xh.XhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Controller
@RequestMapping("milu")
public class WenzController {

    @Autowired
    private WenzService wenzService;

    @RequestMapping("toWenzList")
    public String toWenzList(HttpSession session) {
        session.setAttribute("userName", "张三");
        return "../sh/wzlist";
    }

    @RequestMapping("/queryWenz")
    @ResponseBody
    public Object queryWenz(EssayDemo essay, int page, int rows){

            Map<String, Object> menutree = wenzService.queryWenz(essay,page,rows);
            return menutree;

    }

    @RequestMapping("updPizhun")
    @ResponseBody
    int updPizhun(EssayDemo essay){
        int i = wenzService.updPizhun(essay);
        return i;
    }

    @RequestMapping("updnoPizhun")
    @ResponseBody
    int updnoPizhun(EssayDemo essay){
        int i = wenzService.updnoPizhun(essay);
        return i;
    }

}
