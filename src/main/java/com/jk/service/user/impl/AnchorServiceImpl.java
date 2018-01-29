package com.jk.service.user.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.user.AnchorMapper;
import com.jk.pojo.User;
import com.jk.pojo.user.Anchor;
import com.jk.service.user.AnchorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AnchorServiceImpl implements AnchorService{
    @Autowired
    private AnchorMapper anchorMapper;
    @Override
    public JSONObject queryAnchorByPage(int page, int rows, Anchor anc) {
        long total = anchorMapper.queryIntegralCount(anc);
        int start = (page-1)*rows;
        int end = start+rows;
        List<User> money = anchorMapper.queryAnchorByPage(start,end,anc);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", money);
        return json;
    }

    @Override
    public int deleteAnchor(Anchor anc) {
        return anchorMapper.deleteAnchor(anc);
    }

    @Override
    public Anchor queryAnchorById(int anid) {
        return anchorMapper.queryAnchorById(anid);
    }

    @Override
    public int updateAnchor(Anchor anc) {
        return anchorMapper.updateAnchor(anc);
    }

    @Override
    public List<Anchor> plQueryAnchor(String plids) {
        List<Anchor> upcount= new ArrayList<Anchor>();
        if(plids!=""){
            String[] allids=plids.split(",");
            int idSize=allids.length;
            for(int i=0;i<idSize;i++){
                int m=(Integer.parseInt(allids[i]));

                Anchor  upa=anchorMapper.plQueryAnchor(m);
                upcount.add(upa);
            }
        }
        return upcount;
    }

    @Override
    public int updatePlAnchor(String plids, String anpass) {
        int idSize=0;

        if (plids!=null&&plids!=""){
            String[] allids=plids.split(",");
            String[] passwords=anpass.split(",");
            idSize=allids.length;
            for(int i=0;i<idSize;i++){
                int m=(Integer.parseInt(allids[i]));
                String p=(passwords[i]);
                System.out.println(p);
                int idSizes=anchorMapper.updatePlAnchor(m,p);
            }
        }
        return idSize;
    }

    @Override
    public int addAnchor(Anchor anc) {
        return anchorMapper.addAnchor(anc);
    }
}
