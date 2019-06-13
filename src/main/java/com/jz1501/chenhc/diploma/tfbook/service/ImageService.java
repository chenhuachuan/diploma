package com.jz1501.chenhc.diploma.tfbook.service;


import com.jz1501.chenhc.diploma.tfbook.entity.Image;

import java.util.List;

public interface ImageService {
    public List<Image> queryAllImage();

    public void addOneImage(Image image);

    //删除，启用，禁用，
    public void modifyOneImageStatus(String imageId, String status);

    public void modifyOneImage(Image image);

    public Image queryOneImageInfoById(String imageId);

    public List<Image> queryAllBannerImageCHC();
}
