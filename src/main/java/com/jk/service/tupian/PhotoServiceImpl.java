package com.jk.service.tupian;

import com.jk.dao.tupian.PhotosDemoMapper;
import com.jk.dao.wenz.EssayDemoMapper;
import com.jk.pojo.tupian.PhotosDemo;
import com.jk.pojo.wenz.EssayDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
@Service(value="photoService")
public class PhotoServiceImpl implements PhotoService {

    @Autowired
    private PhotosDemoMapper photosMapper;

    @Override
    public Map<String, Object> queryTupian(PhotosDemo photod, int page, int rows) {
        long total = photosMapper.queryTotal(photod);
        int start = (page-1)*rows;
        System.out.println(start);
        int end = start+rows;
        List<PhotosDemo> shangList = photosMapper.queryTupian(photod,start,end);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", shangList);
        return map;
    }

    @Override
    public int updPizhunp(PhotosDemo photod) {
        return photosMapper.updPizhunp(photod);
    }

    @Override
    public int updnoPizhunp(PhotosDemo photod) {
        return photosMapper.updnoPizhunp(photod);
    }

    @Override
    public int updPizhunp2(PhotosDemo photod) {
        return photosMapper.updPizhunp2(photod);
    }
}
