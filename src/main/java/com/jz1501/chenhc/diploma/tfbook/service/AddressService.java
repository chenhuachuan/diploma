package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Address;

import java.util.List;

public interface AddressService {

    public List<Address> queryAddressByUserId(String userId);

    public Address queryAddressById(String userId, String nickAddrId);

    void addNewAddress(Address address);

    void modifyAddress(Address address);

    Address queryAddressById(String addressId);
}
