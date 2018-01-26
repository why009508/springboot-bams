package com.jk.iservice.essay;
import com.jk.dao.essay.EssayMapper;
import com.jk.pojo.essay.Essay;
import com.jk.service.essay.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class IEssayService implements EssayService {

    @Autowired
    private EssayMapper essayDao;


    public Map SelectUserList(Integer pageSize, Integer start, Essay essay) {
        long count =essayDao.selectCountList(essay);

        List<LinkedHashMap> list =essayDao.selectEssayList(pageSize,start,essay);
        Map map = new HashMap();
        //返回的一定是rows,total
        map.put("rows",list);
        map.put("total",count);
        return map;
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @Override
    public int delEssay(String ids) {
        String[] split = ids.split(",");
        List<Integer> idlist = new ArrayList<Integer>();
        for(int i=0;i<split.length;i++){
            //valueof返回最适合该对象类型的原始值；数据类型转换
            essayDao.delEssay(Integer.valueOf(split[i]));
        }

        return 1;
    }

    @Override
    public Essay findById(Integer esid) {

        return essayDao.findById(esid);
    }

    /**
     * 修改的方法
     * @param essay
     */
    @Override
    public void updateEssay(Essay essay) {
        essayDao.updateEssay(essay);
    }
}
