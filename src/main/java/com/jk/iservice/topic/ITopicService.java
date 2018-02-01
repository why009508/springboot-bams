package com.jk.iservice.topic;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.topic.TopicMapper;
import com.jk.pojo.topic.Topic;
import com.jk.pojo.users.Adminuser;
import com.jk.service.topic.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
@Service
public class ITopicService implements TopicService {

    @Autowired
    private TopicMapper topicDao;
    /*
    * 专题查询列表
    * */
    public Map<String, Object> queryTopic(Integer pageSize, Integer start, Topic topic) {

        //总条数 long类型
        long count =topicDao.queryCount(topic);

        //当前页展示内容
        List<LinkedHashMap> list =topicDao.queryTopicAll(pageSize,start,topic);

        Map map = new HashMap();
        //rows和total是 固定的返回键值
        map.put("rows",list);
        map.put("total",count);

        return map;
    }

    @Override
    public int addTopic(Topic topic) {
        return topicDao.addTopic(topic);
    }

    @Override
    public JSONObject queryTopicPage(int page, int rows) {
        long total = topicDao.queryTopicCount();
        int start = (page-1)*rows;
        int end = start+rows;
        List<Topic> userlist = topicDao.queryTopicPage(start,end);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", userlist);
        return json;
    }
}
