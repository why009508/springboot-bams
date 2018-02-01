package com.jk.iservice.gift;

import com.jk.dao.gift.GiftMapper;
import com.jk.pojo.gift.Gift;
import com.jk.service.gift.GiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IGiftService implements GiftService{
    @Autowired
    private GiftMapper giftMapper;

    @Override
    public Map<String, Object> queryGift(int page, int rows, Gift gift) {
        /*总条数*/
        long total = giftMapper.queryGiftCount(gift);
//		当前页数据
        int start = (page-1)*rows;
        int end = rows;
        List<Gift> menus = giftMapper.queryGiftPage(start,end,gift);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", menus);
        return map;
    }

    @Override
    public int addGift(Gift gift) {
        gift.setGiftstatus(1);
        int b = giftMapper.addGift(gift);
        return b;
    }

    @Override
    public int setGiftUp(Integer giftid) {
        int b = giftMapper.setGiftUp(giftid);
        return b;
    }

    @Override
    public int setGiftDown(Integer giftid) {
        int b = giftMapper.setGiftDown(giftid);
        return b;
    }

    @Override
    public int deleteGift(Integer giftid) {
        int b = giftMapper.deleteGift(giftid);
        return b;
    }

    @Override
    public Gift queryGiftById(Gift gift) {
        Gift giftdemo = giftMapper.queryGiftById(gift.getGiftid());
        return giftdemo;
    }

    @Override
    public int updateGift(Gift gift) {
        int b = giftMapper.updateGift(gift);
        return b;
    }
}
