package com.jk.service.ad;

import com.jk.pojo.ad.AD;

import java.util.Map;

public interface ADService {
    Map<String,Object> queryAD(int page, int rows, AD ad);

    int addAD(AD ad);

    int deleteAD(AD ad);

    int updateAD(AD ad);

    AD queryADById(AD ad);

    int setADUp(AD ad);

    int setADDown(AD ad);
}
