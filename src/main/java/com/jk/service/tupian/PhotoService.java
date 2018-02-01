package com.jk.service.tupian;

import com.jk.pojo.tupian.PhotosDemo;

import java.util.Map;

/**
 * Created by admin on 2018/1/25.
 */
public interface PhotoService {
    Map<String,Object> queryTupian(PhotosDemo photod, int page, int rows);

    int updPizhunp(PhotosDemo photod);

    int updnoPizhunp(PhotosDemo photod);

    int updPizhunp2(PhotosDemo photod);
}
