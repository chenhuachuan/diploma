package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Image;
import com.jz1501.chenhc.diploma.tfbook.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    @RequestMapping("/queryAllImagesByCNG_CHC")
    @ResponseBody
    public List<Image> queryAllImages() {
        List<Image> allImage = imageService.queryAllImage();
        return allImage;
    }

    @RequestMapping("/modifyOneImageByCNG_CHC")
    public String moidfyOneImageInfo(String imageId, Model model) {
        Image imageInfo = imageService.queryOneImageInfoById(imageId);
        model.addAttribute("imageInfo", imageInfo);
        return "forward:/bgpages/pages/modifyImage.jsp";
    }

    @RequestMapping("/OneImageDetailByCNG_CHC")
    public String OneImageDetaiInfo(String imageId, Model model) {
        Image imageInfo = imageService.queryOneImageInfoById(imageId);
        model.addAttribute("imageDetail", imageInfo);
        return "forward:/bgpages/pages/bannerDetail.jsp";
    }


    @RequestMapping(value = "/addImageInfoByCNG_CHC001", method = RequestMethod.POST)
    @ResponseBody
    public String addImageInfo0100(@RequestParam(value = "imgUrl", required = false) MultipartFile imgUrl, @Valid Image image, BindingResult bindingResult, HttpServletRequest request, HttpSession session) {
        String message = null;
        try {
            //获得图片保存的路径
            String realPath = session.getServletContext().getRealPath("/image/bannerImage");
            //System.out.println("图片保存路径："+realPath);
            //定义文件名
            String fileName = null, imageSize = "";
            InputStream io = null;
            if (!imgUrl.isEmpty()) {
                //生成UUID作为文件的名称
                String uuidName = UUID.randomUUID().toString().replace("-", "");
                //获得文件后缀名
                String suffixName = imgUrl.getOriginalFilename();
                fileName = uuidName + "_" + suffixName;
                //文件保存路径
                imgUrl.transferTo(new File(realPath + "/" + fileName));
                File file = new File(realPath + "/" + fileName);
                io = new FileInputStream(file);
                BufferedImage imageIO = ImageIO.read(io);
                int width = imageIO.getWidth();
                int height = imageIO.getHeight();
                imageSize = width + "px" + "*" + height + "px";
            }
            //把图片的相对路径保存到数据库  /image/books/18_ja.jpg
            image.setImageUrl("/image/bannerImage/" + fileName);
            image.setImageSize(imageSize);

            //System.out.println("表单BOOK："+book);
            //插入数据库
            imageService.addOneImage(image);
            System.out.println("____addNewImage_____\t:" + image);
            return "success";
        } catch (Exception e) {
            message = e.getMessage();
            System.out.println("message:" + message);
            return "fail";
        }
    }

    @RequestMapping("/modifyImageInfoCNG_CHC001")
    @ResponseBody
    public String modifyOnesImageInfo_CNG_001(@RequestParam(value = "imgUrl", required = false) MultipartFile imgUrl, @Valid Image image, BindingResult bindingResult, HttpServletRequest request, HttpSession session) {
        String message = null;
        try {
            //获得图片保存的路径
            String realPath = session.getServletContext().getRealPath("/image/bannerImage");
            //System.out.println("图片保存路径："+realPath);
            //定义文件名
            String fileName = null, imageSize = "";
            InputStream io = null;
            if (!imgUrl.isEmpty()) {
                //生成UUID作为文件的名称
                String uuidName = UUID.randomUUID().toString().replace("-", "");
                //获得文件后缀名
                String suffixName = imgUrl.getOriginalFilename();
                fileName = uuidName + suffixName;
                //文件保存路径
                imgUrl.transferTo(new File(realPath + "/" + fileName));

                File file = new File(realPath + "/" + fileName);
                io = new FileInputStream(file);
                BufferedImage imageIO = ImageIO.read(io);
                int width = imageIO.getWidth();
                int height = imageIO.getHeight();
                imageSize = width + "px" + "*" + height + "px";
            }
            //把图片的相对路径保存到数据库
            if (imgUrl.isEmpty()) {
                image.setImageUrl("");
                image.setImageSize("");
            } else {
                image.setImageUrl("/image/bannerImage/" + fileName);
                image.setImageSize(imageSize);
            }
            System.out.println("修改的image:\t" + image);
            //插入数据库
            imageService.modifyOneImage(image);
            return "success";
        } catch (Exception e) {
            message = e.getMessage();
            System.out.println("修改image：\t" + message);
            return "fail";
        }
    }

    //修改状态
    @RequestMapping("/modifyImageStatusCNG_CHC_001")
    @ResponseBody
    public String modifyImageStatuCNG(String imageId, String status) {
        try {
            imageService.modifyOneImageStatus(imageId, status);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }

    //轮播图
    @RequestMapping("/queryAllBannerImage_CNG_CHC")
    public String queryAllBannerImage(Model model) {
        List<Image> images = imageService.queryAllBannerImageCHC();
        model.addAttribute("imagesBanner", images);
        model.addAttribute("imageSize", images.size());
        return "forward:/pages/innerpage/banner_image.jsp";
    }


}
