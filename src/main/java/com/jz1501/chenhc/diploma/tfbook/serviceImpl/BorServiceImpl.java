package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BorDao;
import com.jz1501.chenhc.diploma.tfbook.entity.Bor;
import com.jz1501.chenhc.diploma.tfbook.service.BorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.serviceImpl
 * @description:统计
 * @author:chenhc
 * @create_time:2019-05-26
 * @version:v1.0.0$
 **/
@Service
@Transactional
public class BorServiceImpl implements BorService {

    @Autowired
    private BorDao borDao;

    @Override
    public Bor queryTotalUserOrderRecore() {
        return borDao.selectTotalUserOrderRecore();
    }

    @Override
    public Integer queryTotalUsers() {
        return borDao.selectTotalUsers();
    }

    @Override
    public Integer queryTotalOrders() {
        return borDao.selectTotalOrders();
    }

    @Override
    public Integer queryTotalRecord() {
        return borDao.selectTotalRecord();
    }

    @Override
    public Bor queryUsersStaties() {
        return borDao.selectUsersStaties();
    }

    @Override
    public Bor queryDealInfoStaties() {
        return borDao.selectDealInfoStaties();
    }

    @Override
    public Bor queryOrderStaties() {
        return borDao.selectOrderStaties();
    }

    @Override
    public Bor queryBooksInfoStaties() {
        return borDao.selectBooksInfoStaties();
    }
}
