package com.jk.service.xh;

import com.jk.dao.xh.JokeDemoMapper;
import com.jk.pojo.xh.JokeDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/23.
 */
@Service(value="xhService")
public class XhServiceImpl implements XhService{

    @Autowired
    private JokeDemoMapper jokemapper;

    @Override
    public Map<String, Object> queryXh(JokeDemo joke, int page, int rows) {
        // TODO Auto-generated method stub
        long total = jokemapper.queryTotal(joke);
        int start = (page-1)*rows;
        System.out.println(start);
        int end = start+rows;
        List<JokeDemo> shangList = jokemapper.queryXh(joke,start,end);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", shangList);
        return map;

    }

    @Override
    public int addXhua(JokeDemo joke) {
        return jokemapper.insertSelective(joke);
    }

    @Override
    public int delXiaoh(JokeDemo hrm) {
        return jokemapper.delXiaoh(hrm);
    }

    @Override
    public JokeDemo toUpdXhua(JokeDemo hrm) {
        return jokemapper.toUpdXhua(hrm);
    }

    @Override
    public int updXhua(JokeDemo hrm) {
        return jokemapper.updateByPrimaryKey(hrm);
    }

    @Override
    public int updPizhun(JokeDemo joke) {
        return jokemapper.updPizhun(joke);
    }

    @Override
    public int updnoPizhun(JokeDemo joke) {
        return jokemapper.updnoPizhun(joke);
    }
}
