package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Image;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ImageDao {

    public List<Image> selectAllImage();

    public Image selectOneImageById(String imageId);

    public void insertOneImage(Image image);

    //删除，启用，禁用，
    public void updateOneImageStatus(@Param("imageId") String imageId, @Param("status") String status);

    public void updateOneImage(Image image);

    //轮播图
    public List<Image> selectBannerImage();
}
