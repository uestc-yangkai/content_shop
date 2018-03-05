package com.netease.course.service;

import com.netease.course.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by kaizige on 2018/1/28.
 */
@Service
public class UserService {
    @Autowired
    UserMapper userMapper;
}
