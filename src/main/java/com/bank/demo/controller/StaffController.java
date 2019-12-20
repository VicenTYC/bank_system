package com.bank.demo.controller;

import com.bank.demo.RequestBean.AccountBean;
import com.bank.demo.RequestBean.LoginBean;
import com.bank.demo.RequestBean.StaffBean;
import com.bank.demo.mainModel.Accountsum;
import com.bank.demo.mainModel.User;
import com.bank.demo.model.Account;
import com.bank.demo.model.Staff;
import com.bank.demo.repository.AccountRepository;
import com.bank.demo.repository.AccountsumRepository;
import com.bank.demo.repository.StaffRepository;
import com.bank.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping(value = "/staff")
public class StaffController {

    @Autowired
    private StaffRepository staffRepository;

    @PostMapping(value = "/addStaff")
    public boolean addStaff(@RequestBody StaffBean staffBean) {
        if(staffBean==null||staffBean.sName=="")
            return false;
        if(staffBean.sName.length()>8||staffBean.sPhone.length()>11)
            return false;
        Staff staff=new Staff();
        staff.setStaffId(DataTest.makeStaffid(staffBean.sSite));
        staff.setStaffName(staffBean.sName);
        staff.setStaffPhone(staffBean.sPhone);
        staff.setStaffSite(staffBean.sSite);
        staffRepository.save(staff);
        return true;
    }

    @GetMapping(value = "/getAllStaff")
    public List<Staff> getAll(){
        return staffRepository.findAll();
    }



    @GetMapping(value = "/getStaffByStaffId/{Sid}")
    public Staff getStaffByStaffId(@PathVariable String Sid){
        return staffRepository.findByStaffId(Sid);
    }

    @GetMapping(value = "/getStaffBySiteId/{Sid}")
    public List<Staff> getUserByUid(@PathVariable Integer Sid){
        List<Staff> staffs =staffRepository.findByStaffSite(Sid);
        return staffs;
    }

    @GetMapping(value = "/getStaffByPhone/{sphone}")
    public List<Staff> getStaffByPhone(@PathVariable String sphone){
        return staffRepository.findByStaffPhone(sphone);
    }
}