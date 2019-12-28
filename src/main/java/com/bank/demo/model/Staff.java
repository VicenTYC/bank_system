package com.bank.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "Staffs")
public class Staff {
    @Id
    private String staffId;

    @Column(length = 8)
    private String staffName;

    @Column(updatable = false, length = 2)
    private Integer staffSite;

    @Column(length = 11)
    private String staffPhone;

    @Column(length = 32)
    private String staffPwd;

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public Integer getStaffSite() {
        return staffSite;
    }

    public void setStaffSite(Integer staffSite) {
        this.staffSite = staffSite;
    }

    public String getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

    public String getStaffPwd() {return staffPwd; }

    public void setStaffPwd(String staffPwd) { this.staffPwd = staffPwd;  }
}
