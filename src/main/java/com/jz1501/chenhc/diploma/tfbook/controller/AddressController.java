package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Address;
import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/addr")
public class AddressController {

    @Autowired
    private AddressService addressService;

    /**
     * 查询用户地址，用户点击切换地址时触发
     *
     * @param nickAddrId
     * @param session
     * @return
     */
    @RequestMapping("/queryAllAddressById")
    @ResponseBody
    public Address queryAllAddressById(String nickAddrId, HttpSession session) {
        //String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        User currentUser = (User) session.getAttribute("CurrentUser");
        //List<Address> addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        Address addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        return addresses;
    }

    /**
     * 查询用户所有地址
     * @param session
     * @return
     */
    @RequestMapping("/allAddrSort")
    @ResponseBody
    public List<Address> queryAllCategoryAddress(HttpSession session) {
        //String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        User currentUser = (User) session.getAttribute("CurrentUser");
        List<Address> categoryAddr = addressService.queryAddressByUserId(currentUser.getUserId());
        return categoryAddr;
    }

    //bg
    @RequestMapping("/usersAllAddress")
    public String queryAllAddress(String userId, Model model) {
        List<Address> categoryAddr = addressService.queryAddressByUserId(userId);
        model.addAttribute("address", categoryAddr);
        return "forward:/bgpages/pages/userAddressInfo.jsp";
    }

    @RequestMapping("/queryOneAddress")
    @ResponseBody
    public Address queryOneAddressByNickId(String nickAddrId, HttpSession session) {
        //String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        User currentUser = (User) session.getAttribute("CurrentUser");
        Address addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        //model.addAttribute("one_address",addresses);
        return addresses;
    }


    @RequestMapping("/addNewAddress")
    public String addNewReceiveAddress(Address address) {
        //System.out.println(address);
        String addressId = UUID.randomUUID().toString().replace("-", "");
        String nickAddrId = UUID.randomUUID().toString().replace("-", "");
        address.setAddressId(addressId);
        address.setNickAddrId(nickAddrId);

        addressService.addNewAddress(address);
        return "forward:/index.jsp";
    }


}
