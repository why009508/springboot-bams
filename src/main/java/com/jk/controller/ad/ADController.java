package com.jk.controller.ad;

import com.jk.pojo.ad.AD;
import com.jk.service.ad.ADService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("AD")
@EnableAutoConfiguration
public class ADController {
    @Autowired
    private ADService aDService;
    @RequestMapping("toADList")
    public String toADList(){
        return "../ad/adList";
    }

    @RequestMapping("queryAD")
    @ResponseBody
    public Object queryAD(int page,int rows,AD ad){
        Map<String, Object> map = aDService.queryAD(page,rows,ad);
        return map;
    }

    @RequestMapping("toAddAD")
    public String toAddAD(){
        return "../ad/addAD";
    }

    private static final Logger logger = LoggerFactory.getLogger(ADController.class);

    //文件上传相关代码
    @RequestMapping(value = "upload")
    @ResponseBody
    public String upload(@RequestParam("test") MultipartFile artImg,HttpServletRequest req) throws IOException {
        if (artImg.isEmpty()) {
            return "文件为空";
        }

        //获取原文件名称
        String fileName = artImg.getOriginalFilename();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String folderPath = req.getSession().getServletContext().getRealPath("/")+
                "adimage/";
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
        return  "adimage/"+onlyFileName;

    }


    @RequestMapping("addAD")
    @ResponseBody
    public Object addAD(AD ad){
        int b = aDService.addAD(ad);
        return 1;
    }


    @RequestMapping("deleteAD")
    @ResponseBody
    public Object deleteAD(AD ad){
        int b = aDService.deleteAD(ad);
        return 1;
    }


    @RequestMapping("toEditAD")
    public String toEditAD(){
        return "../ad/editAD";
    }

    @RequestMapping("updateAD")
    @ResponseBody
    public Object updateAD(AD ad){
        int b = aDService.updateAD(ad);
        return 1;
    }
}
