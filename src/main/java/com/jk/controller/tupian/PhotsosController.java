package com.jk.controller.tupian;

import com.jk.pojo.tupian.PhotosDemo;
import com.jk.pojo.wenz.EssayDemo;
import com.jk.service.tupian.PhotoService;
import com.jk.service.wenz.WenzService;
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
@RequestMapping("phtot")
public class PhotsosController {

    @Autowired
    private PhotoService photoService;

    @RequestMapping("tpList")
    public String tpList() {
        return "../sh/tplist";
    }

    @RequestMapping("/queryTupian")
    @ResponseBody
    public Object queryTupian(PhotosDemo photod, int page, int rows){

        Map<String, Object> menutree = photoService.queryTupian(photod,page,rows);
        return menutree;
    }

    @RequestMapping("updPizhunp")
    @ResponseBody
    int updPizhunp(PhotosDemo photod){
        int i = photoService.updPizhunp(photod);
        return i;
    }

    @RequestMapping("updnoPizhunp")
    @ResponseBody
    int updnoPizhunp(PhotosDemo photod){
        int i = photoService.updnoPizhunp(photod);
        return i;
    }
}
