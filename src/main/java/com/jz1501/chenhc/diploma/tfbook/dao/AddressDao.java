package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressDao {
    public List<Address> selectAddressByUserId(String userId);


    public Address selectAddressById(@Param("userId") String userId, @Param("nickAddrId") String nickAddrId);

    //新增地址
    public void insertNewAddress(Address address);

    //修改d
    public void updateOldAddress(Address address);

    public Address selectOneAddressByID(String addressId);

}
