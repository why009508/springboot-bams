package com.jk.iservice;

import com.jk.dao.promote.PromoteMapper;
import com.jk.service.promote.PromoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IPromoteService implements PromoteService{
    @Autowired
    private PromoteMapper promoteMapper;
    @Override
    public int proEssay(Integer esid) {
        promoteMapper.proEssay(esid);
        return 1;
    }

    @Override
    public int cancelPromote(Integer esid) {
        promoteMapper.cancelPromote(esid);
        return 1;
    }
}
