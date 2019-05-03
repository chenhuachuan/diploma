<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">

                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4>首页轮播</h4>
                    <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#"
                                                                                                  class="alert-link">alert
                    link</a>
                </div>

                <div class="col-md-12 column">
                    <div class="carousel slide" id="carousel-935012">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-935012">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-935012" class="active">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-935012">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item">
                                <img alt="" src="../pages/images/shop-slider/slide1/banner1.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        First Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item active">
                                <img alt="" src="../pages/images/shop-slider/slide2/banner2.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        Second Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="../pages/images/shop-slider/slide3/banner3.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        Third Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-935012" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-935012" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

            </div>


        </div>
        <div class="col-md-12 column">
            <div class="alert alert-success alert-dismissable" style="margin-top: 5px">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>广告图分类信息</h4>
                <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#"
                                                                                              class="alert-link">alert
                link</a>
            </div>
            <div class="col-md-12 column">
                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            编号
                        </th>
                        <th>
                            图片描述
                        </th>
                        <th>
                            尺寸
                        </th>
                        <th>
                            图片路径
                        </th>
                        <th>
                            更换时间
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="success">
                        <td>
                            1
                        </td>
                        <td>
                            TB - Monthly
                        </td>
                        <td>
                            128*128
                        </td>
                        <td>
                            ../pages/images/shop-slider/slide1/banner2.jpg
                        </td>
                        <td>
                            2015-02-01
                        </td>
                        <td>
                            启用
                        </td>
                        <td>
                            <button type="button" class="btn btn-default">禁用</button>
                            <button type="button" class="btn btn-default">编辑</button>
                            <button type="button" class="btn btn-default">删除</button>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>