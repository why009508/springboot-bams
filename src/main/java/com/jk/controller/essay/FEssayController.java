package com.jk.controller.essay;

import com.jk.pojo.essay.Essay;
import com.jk.service.essay.FEssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("/FEssay")
public class FEssayController {
    @Autowired
    private FEssayService fEssayService;

    @RequestMapping("getEssayList")
    @ResponseBody
    public Object getEssayList(){
        List<Essay> essayList = fEssayService.getEssayList();
        return essayList;
    }
}
