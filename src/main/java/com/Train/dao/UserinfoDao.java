package com.Train.dao;

import java.util.List;
import java.util.Map;

import com.Train.model.Userinfo;

public interface UserinfoDao {

    int deleteByPrimaryKey(Integer uid);

    int insert(Userinfo record);

    int insertUserInfo(Userinfo userinfo);

    Userinfo selectUserInfoByUserId(Integer uid);
    
    int updateUserInfoByUserId(Userinfo userinfo);
    
    List<Userinfo> selectAllUser(Integer uid);
    
    List<Userinfo> selectAllU();
    
    List<Userinfo> selectUserScore(Integer cid);

    int updateByPrimaryKey(Userinfo record);
    
}