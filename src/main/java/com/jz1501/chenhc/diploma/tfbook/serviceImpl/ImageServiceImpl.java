package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.ImageDao;
import com.jz1501.chenhc.diploma.tfbook.entity.Image;
import com.jz1501.chenhc.diploma.tfbook.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageDao imageDao;

    @Override
    public List<Image> queryAllImage() {
        return imageDao.selectAllImage();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void modifyOneImageStatus(String imageId, String status) {
        imageDao.updateOneImageStatus(imageId, status);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addOneImage(Image image) {
        image.setImageId(UUID.randomUUID().toString().replace("-", ""));
        image.setReplaceTime(new Date());
        imageDao.insertOneImage(image);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void modifyOneImage(Image image) {
        image.setReplaceTime(new Date());
        imageDao.updateOneImage(image);
    }

    @Override
    public Image queryOneImageInfoById(String imageId) {
        return imageDao.selectOneImageById(imageId);
    }

    @Override
    public List<Image> queryAllBannerImageCHC() {
        return imageDao.selectBannerImage();
    }
}
