package com.neuedu.pojo;

import java.sql.Date;
import lombok.Data;

@Data
public class Users {
    private Integer id;

    private String username;

    private String password;

    private String nickname;

    private String phone;

    private String email;

    private Integer type;

    private Integer status;

    private String createDate;

    private String updateDate;

    private Integer loginNumber;

}