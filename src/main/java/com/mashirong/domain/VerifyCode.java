package com.mashirong.domain;

public class VerifyCode {
    private Integer codeid;

    private String email;

    private Integer code;

    public Integer getCodeid() {
        return codeid;
    }

    public void setCodeid(Integer codeid) {
        this.codeid = codeid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}