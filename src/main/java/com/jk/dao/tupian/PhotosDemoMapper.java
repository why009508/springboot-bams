package com.jk.dao.tupian;

import com.jk.pojo.tupian.PhotosDemo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PhotosDemoMapper {
    int deleteByPrimaryKey(Integer phoid);

    int insert(PhotosDemo record);

    int insertSelective(PhotosDemo record);

    PhotosDemo selectByPrimaryKey(Integer phoid);

    int updateByPrimaryKeySelective(PhotosDemo record);

    int updateByPrimaryKey(PhotosDemo record);

    long queryTotal(PhotosDemo photod);

    List<PhotosDemo> queryTupian(@Param(value = "photod") PhotosDemo photod, @Param(value = "start") int start, @Param(value = "end") int end);

    int updPizhunp(PhotosDemo photod);

    int updnoPizhunp(PhotosDemo photod);
}