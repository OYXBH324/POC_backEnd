package com.demo.controller;

import com.demo.model.po.LoginUser;
import com.demo.result.R;
import com.demo.service.UserService;
import com.demo.service.impl.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class UserController {

    @Autowired
    UserServiceImpl userService;


    @PostMapping("/login")
    public R login(@RequestBody LoginUser loginUser){
        String name = loginUser.getUsername();
        String password = loginUser.getPassword();
        LoginUser loginUserDB = userService.getByNameAndPassword(name,password);
        if(loginUserDB ==null){
            return R.error(20001,"没有该用户");
        }
        return R.ok("登录成功").setData(loginUserDB);

    }

    @PostMapping("/register")
    public R regiseter(@RequestBody LoginUser loginUser){
        String name = loginUser.getUsername();
        LoginUser checkName = userService.getByName(name);
        if(checkName!=null){
            return R.error(20001,"用户名已被注册");
        }
        userService.addUser(loginUser);
        return R.ok("注册成功").setData(loginUser);

    }
}
