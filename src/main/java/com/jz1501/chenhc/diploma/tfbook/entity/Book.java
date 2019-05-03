package com.jz1501.chenhc.diploma.tfbook.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {
    private String bookId;
    private String bookName;
    private Integer sortId;
    private String author;
    private String publishCompany;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publishTime;
    private Integer wordCount;
    private Integer pageCount;
    private String kaiBen;
    private Integer repertory;//库存
    private Double bookPrice;
    private Double originalPrice;//原价
    private String isbn;
    private Integer saleCount;//销售量
    private String imgUrl;
    private String bookIntro;
    private String commend;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private Sort sort;

    public Sort getSort() {
        return sort;
    }

    public void setSort(Sort sort) {
        this.sort = sort;
    }

    public Book() {
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Book(String bookId, String bookName, Integer sortId, String author, String publishCompany, Date publishTime, Integer wordCount, Integer pageCount, String kaiBen, Integer repertory, Double bookPrice, Double originalPrice, String isbn, Integer saleCount, String imgUrl, String bookIntro, String commend) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.sortId = sortId;
        this.author = author;
        this.publishCompany = publishCompany;
        this.publishTime = publishTime;
        this.wordCount = wordCount;
        this.pageCount = pageCount;
        this.kaiBen = kaiBen;
        this.repertory = repertory;
        this.bookPrice = bookPrice;
        this.originalPrice = originalPrice;
        this.isbn = isbn;
        this.saleCount = saleCount;
        this.imgUrl = imgUrl;
        this.bookIntro = bookIntro;
        this.commend = commend;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", sortId='" + sortId + '\'' +
                ", author='" + author + '\'' +
                ", publishCompany='" + publishCompany + '\'' +
                ", publishTime=" + publishTime +
                ", wordCount=" + wordCount +
                ", pageCount=" + pageCount +
                ", kaiBen='" + kaiBen + '\'' +
                ", repertory=" + repertory +
                ", bookPrice=" + bookPrice +
                ", originalPrice=" + originalPrice +
                ", isbn='" + isbn + '\'' +
                ", saleCount=" + saleCount +
                ", imgUrl='" + imgUrl + '\'' +
                ", bookIntro='" + bookIntro + '\'' +
                ", commend='" + commend + '\'' +
                '}';
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishCompany() {
        return publishCompany;
    }

    public void setPublishCompany(String publishCompany) {
        this.publishCompany = publishCompany;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getWordCount() {
        return wordCount;
    }

    public void setWordCount(Integer wordCount) {
        this.wordCount = wordCount;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public String getKaiBen() {
        return kaiBen;
    }

    public void setKaiBen(String kaiBen) {
        this.kaiBen = kaiBen;
    }

    public Integer getRepertory() {
        return repertory;
    }

    public void setRepertory(Integer repertory) {
        this.repertory = repertory;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Integer getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }


    public String getBookIntro() {
        return bookIntro;
    }

    public void setBookIntro(String bookIntro) {
        this.bookIntro = bookIntro;
    }

    public String getCommend() {
        return commend;
    }

    public void setCommend(String commend) {
        this.commend = commend;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Book(String bookId, String bookName, Integer sortId, String author, String publishCompany, Date publishTime, Integer wordCount, Integer pageCount, String kaiBen, Integer repertory, Double bookPrice, String isbn, Integer saleCount, String imgUrl, String bookIntro, String commend) {

        this.bookId = bookId;
        this.bookName = bookName;
        this.sortId = sortId;
        this.author = author;
        this.publishCompany = publishCompany;
        this.publishTime = publishTime;
        this.wordCount = wordCount;
        this.pageCount = pageCount;
        this.kaiBen = kaiBen;
        this.repertory = repertory;
        this.bookPrice = bookPrice;
        this.isbn = isbn;
        this.saleCount = saleCount;
        this.imgUrl = imgUrl;
        this.bookIntro = bookIntro;
        this.commend = commend;
    }
}

