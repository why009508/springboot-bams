package com.jk.service.tsjy;

import com.jk.dao.tsjy.ComplaintDemoMapper;
import com.jk.pojo.tsjy.ComplaintDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Service(value="tsjyService")
public class TsjyServiceImpl implements TsjyService{

    @Autowired
    private ComplaintDemoMapper complaintMapper;

    @Override
    public Map<String, Object> queryTsjy(ComplaintDemo compl, int page, int rows) {
        long total = complaintMapper.queryTotal(compl);
        int start = (page-1)*rows;
        System.out.println(start);
        int end = start+rows;
        List<ComplaintDemo> shangList = complaintMapper.queryTsjy(compl,start,end);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", shangList);
        return map;
    }

    @Override
    public int delTsjy(ComplaintDemo compl) {
       return complaintMapper.delTsjy(compl);
    }
}
