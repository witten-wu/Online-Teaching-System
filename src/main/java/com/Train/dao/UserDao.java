package com.Train.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.Train.model.User;

public interface UserDao {

    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertUser(User user);
    
    User selectUserByUname(String cTeacher);

    User selectUserByUidAndPassword(@Param("uid")Integer uid,@Param("password")String password);
    
    User selectUserByUid(Integer uid);
    
    List<User> selectUidByEmail(String email);

    int updatePasswordByUserId(User user);

    int updateByPrimaryKey(User record);
    
}