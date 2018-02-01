package com.jk.controller.gift;

import com.jk.pojo.gift.Gift;
import com.jk.service.gift.GiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("Gift")
@EnableAutoConfiguration
public class GiftController {
    @Autowired
    private GiftService giftService;

    @RequestMapping("toGiftList")
    public String toGiftList(){
        return "../gift/giftList";
    }

    @RequestMapping("queryGift")
    @ResponseBody
    public Object queryGift(int page,int rows,Gift gift){
        Map<String, Object> map = giftService.queryGift(page,rows,gift);
        return map;
    }

    @RequestMapping("toAddGift")
    public String toAddGift(){
        return "../gift/addGift";
    }

    //文件上传相关代码
    @RequestMapping(value = "upload")
    @ResponseBody
    public String upload(@RequestParam("test") MultipartFile artImg, HttpServletRequest req) throws IOException {
        if (artImg.isEmpty()) {
            return "文件为空";
        }

        //获取原文件名称
        String fileName = artImg.getOriginalFilename();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String folderPath = req.getSession().getServletContext().getRealPath("/")+
                "giftimage/";
        File file = new File(folderPath);
//	        该目录是否已经存在
        if(!file.exists()){
            //   创建文件夹
            file.mkdir();
        }
        String onlyFileName = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
        FileOutputStream fos = new FileOutputStream(folderPath+onlyFileName);
        fos.write(artImg.getBytes());
        fos.flush();
        fos.close();
        return  "giftimage/"+onlyFileName;

    }


    @RequestMapping("addGift")
    @ResponseBody
    public Object addGift(Gift gift){
        int b = giftService.addGift(gift);
        return 1;
    }


    @RequestMapping("setGiftUp")
    @ResponseBody
    public Object setGiftUp(Gift gift){
        int b = giftService.setGiftUp(gift.getGiftid());
        return 1;
    }

    @RequestMapping("setGiftDown")
    @ResponseBody
    public Object setGiftDown(Gift gift){
        int b = giftService.setGiftDown(gift.getGiftid());
        return 1;
    }


    @RequestMapping("deleteGift")
    @ResponseBody
    public Object deleteGift(Gift gift){
        int b = giftService.deleteGift(gift.getGiftid());
        return 1;
    }

    @RequestMapping("toEditGift")
    public String toEditGift(Gift gift,HttpServletRequest request){
        Gift giftdemo = giftService.queryGiftById(gift);
        request.setAttribute("giftdemo",giftdemo);
        return "../gift/editGift";
    }


    @RequestMapping("updateGift")
    @ResponseBody
    public Object updateGift(Gift gift){
        int b = giftService.updateGift(gift);
        return 1;
    }
}
