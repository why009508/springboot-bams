package com.jk.controller.topic;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.topic.Topic;
import com.jk.service.topic.TopicService;
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
@EnableAutoConfiguration
@RequestMapping("Topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    /**
     * 查询专题列表
     */
    @RequestMapping("queryTopic")
    @ResponseBody
    public Map<String,Object> queryTopic(Integer pageSize,Integer start, Topic topic){
        /*使用map存储查询到的话题集合*/
        Map<String,Object> map =null;
        map = topicService.queryTopic(pageSize,start,topic);

        return map;
    }
    //新增页面跳转
    @RequestMapping("toAddTopic")
    public String  toAddTopic(){
        return "../topic/addtopic";
    }
    /**
     * 新增和修改方法
     * @param topic
     */
    @RequestMapping("addTopic")
    @ResponseBody
    public Object addTopic(Topic topic){
        int to = topicService.addTopic(topic);
        return to;
    }




    //文件上传相关代码
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
    @RequestMapping("/toTopicList")
    public String toTopicList(){
        return "../topic/TopicList";
    }
    @RequestMapping("/queryTopicPage")
    @ResponseBody
    public Object queryTopicPage(int rows,int page){
        System.out.println(page);
        JSONObject json = topicService.queryTopicPage(page,rows);
        return json;
    }


}
