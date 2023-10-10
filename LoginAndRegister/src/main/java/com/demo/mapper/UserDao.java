package com.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.model.po.system.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserDao extends BaseMapper<User> {
    @Results({
            @Result(property = "role",column = "role",one = @One(select="com.demo.mapper.RoleDao.selectById"))
    })
    @Select("select * from sys_user where email = #{email}")
    User selectByEmail(String email);
}
