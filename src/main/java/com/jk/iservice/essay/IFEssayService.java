package com.jk.iservice.essay;

import com.jk.dao.essay.FEssayMapper;
import com.jk.pojo.essay.Essay;
import com.jk.service.essay.FEssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IFEssayService implements FEssayService{
    @Autowired
    private FEssayMapper fEssayMapper;
    @Override
    public List<Essay> getEssayList() {
        List<Essay> essayList = fEssayMapper.getEssayList();
        return essayList;
    }
}
