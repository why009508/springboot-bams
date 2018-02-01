package com.jk.dao.topic;

import com.jk.pojo.topic.Topic;
import com.jk.pojo.users.Adminuser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.LinkedHashMap;
import java.util.List;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer picid);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer picid);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);
    /*总条数*/
    @Select("select count(1) from topic")
    long queryCount(Topic topic);
    /*当前页内容*/
    @Select("SELECT * FROM topic  LIMIT #{start},#{end}")
    List<LinkedHashMap> queryTopicAll(@Param("end") Integer pageSize,@Param("start")Integer start,@Param("topic") Topic topic);

    int addTopic(Topic topic);

    long queryTopicCount();

    List<Topic> queryTopicPage(@Param("s") int start, @Param("e") int end);
}