package com.jk.service.user;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.user.Anchor;

import java.util.List;

public interface AnchorService {
    JSONObject queryAnchorByPage(int page, int rows, Anchor anc);

    int deleteAnchor(Anchor anc);

    Anchor queryAnchorById(int anid);

    int updateAnchor(Anchor anc);

    List<Anchor> plQueryAnchor(String plids);

    int updatePlAnchor(String plids, String anpass);

    int addAnchor(Anchor anc);
}
