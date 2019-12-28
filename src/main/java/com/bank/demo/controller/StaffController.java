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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        staff.setStaffPwd(DataTest.getMD5(staffBean.sPwd));
        staffRepository.save(staff);
        return true;
    }

    @GetMapping(value = "/getAllStaff")
    public List<Staff> getAll(){
        return staffRepository.findAll();
    }

    @RequestMapping("/verifyPwd")
    @ResponseBody
    public Map<String,String> verifyPwd(String staffId, String staffPwd){
        Map res = new HashMap<String,String>();
        if(staffId==null||staffPwd==null)
            res.put("resVal","1");
        String id=staffId;
        Staff account = staffRepository.findByStaffId(id);
        String pwd=DataTest.getMD5(staffPwd);
        System.out.println(pwd);
        if(pwd.equals(account.getStaffPwd()))
        {
            res.put("resVal","0");
            res.put("staffName",account.getStaffName());
        }
        else res.put("resVal","1");
        return res;
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