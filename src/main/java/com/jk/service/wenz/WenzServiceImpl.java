package com.jk.service.wenz;

import com.jk.dao.wenz.EssayDemoMapper;
import com.jk.pojo.wenz.EssayDemo;
import com.jk.pojo.xh.JokeDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Service(value="wenzService")
public class WenzServiceImpl implements WenzService {
    @Autowired
    private EssayDemoMapper essayMapper;

    @Override
    public Map<String, Object> queryWenz(EssayDemo essay, int page, int rows) {
        long total = essayMapper.queryTotal(essay);
        int start = (page-1)*rows;
        System.out.println(start);
        int end = start+rows;
        List<EssayDemo> shangList = essayMapper.queryWenz(essay,start,end);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", shangList);
        return map;
    }

    @Override
    public int updPizhun(EssayDemo essay) {
        return essayMapper.updPizhun(essay);
    }

    @Override
    public int updnoPizhun(EssayDemo essay) {
        return essayMapper.updnoPizhun(essay);
    }
}
