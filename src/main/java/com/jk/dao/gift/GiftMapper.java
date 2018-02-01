package com.jk.dao.gift;

import com.jk.pojo.gift.Gift;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GiftMapper {

    long queryGiftCount(Gift gift);

    List<Gift> queryGiftPage(@Param("start") int start, @Param("end")int end, @Param("gift")Gift gift);

    int addGift(Gift gift);

    int setGiftUp(Integer giftid);

    int setGiftDown(Integer giftid);

    int deleteGift(Integer giftid);

    Gift queryGiftById(Integer giftid);

    int updateGift(Gift gift);
}