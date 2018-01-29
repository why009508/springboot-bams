package com.jk.dao.ad;

import com.jk.pojo.ad.AD;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ADMapper {

    List<AD> queryADPage(@Param("start") int start, @Param("end")int end, @Param("ad")AD ad);

    long queryADCount(@Param("ad") AD ad);

    int addAD(@Param("ad")AD ad);

    int deleteAD(Integer adid);

    int updateAD(@Param("ad") AD ad);

    AD queryADById(Integer adid);
}