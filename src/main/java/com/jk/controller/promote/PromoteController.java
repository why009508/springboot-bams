package com.jk.controller.promote;

import com.jk.pojo.essay.Essay;
import com.jk.service.promote.PromoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("Promote")
@EnableAutoConfiguration
public class PromoteController {
    @Autowired
    private PromoteService promoteService;

    @RequestMapping("toEsList")
    public String toEsList(){
        return "../promote/esList";
    }


    @RequestMapping("proEssay")
    @ResponseBody
    public Object proEssay(Essay essay){
        int b = promoteService.proEssay(essay.getEsid());
        return 1;
    }

    @RequestMapping("cancelPromote")
    @ResponseBody
    public Object cancelPromote(Essay essay){
        int b = promoteService.cancelPromote(essay.getEsid());
        return 1;
    }
}
