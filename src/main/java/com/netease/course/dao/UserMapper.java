package com.netease.course.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by kaizige on 2018/1/27.
 */
public interface UserMapper {
    int hasUser(@Param("userName") String userName, @Param("passWord") String passWord);
}
