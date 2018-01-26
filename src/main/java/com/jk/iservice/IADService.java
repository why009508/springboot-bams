package com.jk.iservice;

import com.jk.dao.ad.ADMapper;
import com.jk.pojo.ad.AD;
import com.jk.service.ad.ADService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class IADService implements ADService {
    @Autowired
    private ADMapper aDMapper;
    @Override
    public Map<String, Object> queryAD(int page, int rows, AD ad) {
        /*总条数*/
        long total = aDMapper.queryADCount(ad);
//		当前页数据
        int start = (page-1)*rows;
        int end = rows;
        List<AD> menus = aDMapper.queryADPage(start,end,ad);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", menus);
        return map;
    }

    @Override
    public int addAD(AD ad) {
        ad.setAdstatus(1);
        int b = aDMapper.addAD(ad);
        return 1;
    }

    @Override
    public int deleteAD(AD ad) {
        int b = aDMapper.deleteAD(ad.getAdid());
        return b;
    }

    @Override
    public int updateAD(AD ad) {
        int b = aDMapper.updateAD(ad);
        return b;
    }
}
