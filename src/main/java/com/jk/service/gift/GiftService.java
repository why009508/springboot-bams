package com.jk.service.gift;

import com.jk.pojo.gift.Gift;

import java.util.Map;

public interface GiftService {
    Map<String,Object> queryGift(int page, int rows, Gift gift);

    int addGift(Gift gift);

    int setGiftUp(Integer giftid);

    int setGiftDown(Integer giftid);

    int deleteGift(Integer giftid);

    Gift queryGiftById(Gift gift);

    int updateGift(Gift gift);
}
