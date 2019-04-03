package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Address;
import com.jz1501.chenhc.diploma.tfbook.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/addr")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @RequestMapping("/queryAllAddressById")
    @ResponseBody
    public Address queryAllAddressById(String nickAddrId, HttpSession session) {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        //User currentUser = (User)session.getAttribute("CurrentUser");
        //List<Address> addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        Address addresses = addressService.queryAddressById(userId, nickAddrId);
        return addresses;
    }

    @RequestMapping("/allAddrSort")
    @ResponseBody
    public List<Address> queryAllCategoryAddress() {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        List<Address> categoryAddr = addressService.queryAddressByUserId(userId);
        return categoryAddr;
    }

    @RequestMapping("/queryOneAddress")
    @ResponseBody
    public Address queryOneAddressByNickId(String nickAddrId) {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        Address addresses = addressService.queryAddressById(userId, nickAddrId);
        //model.addAttribute("one_address",addresses);
        return addresses;
    }


    @RequestMapping("/addNewAddress")
    public String addNewReceiveAddress(Address address) {

        System.out.println(address);
        /*String addressId = UUID.randomUUID().toString().replace("-", "");
        String nickAddrId = UUID.randomUUID().toString().replace("-", "");
        address.setAddressId(addressId);
        address.setNickAddrId(nickAddrId);

        addressService.addNewAddress(address);*/
        return "forward:/index.jsp";
    }


}
