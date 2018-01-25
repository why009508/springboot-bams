package com.jk.service.topic;

import com.jk.pojo.topic.Topic;

import java.util.Map;

public interface  TopicService {
    /*
    * 查询话题列表
    * */
    Map<String,Object> queryTopic(Integer pageSize, Integer start, Topic topic);
}
