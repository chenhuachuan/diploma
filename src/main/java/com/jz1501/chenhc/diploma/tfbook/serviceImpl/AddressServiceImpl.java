package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.AddressDao;
import com.jz1501.chenhc.diploma.tfbook.entity.Address;
import com.jz1501.chenhc.diploma.tfbook.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressDao addressDao;

    @Override
    public List<Address> queryAddressByUserId(String userId) {
        return addressDao.selectAddressByUserId(userId);
    }

    @Override
    public Address queryAddressById(String userId, String nickAddrId) {
        return addressDao.selectAddressById(userId, nickAddrId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addNewAddress(Address address) {
        addressDao.insertNewAddress(address);
    }
}
