package com.jk.controller.topic;

import com.jk.pojo.topic.Topic;
import com.jk.service.topic.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.Map;


@Controller
@EnableAutoConfiguration
@RequestMapping("Topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @RequestMapping("toTopicMain")
    public String toTopicMain()
    {
        return "topic/topicmain";
    }
    /**
     * 查询专题列表
     * @param pageSize
     * @param start
     * @param topic
     * @return
     */
    @RequestMapping("queryTopic")
    @ResponseBody
    public Map<String,Object> queryTopic(Integer pageSize,Integer start, Topic topic){
        /*使用map存储查询到的话题集合*/
        Map<String,Object> map =null;
        map = topicService.queryTopic(pageSize,start,topic);

        return map;
    }

}
