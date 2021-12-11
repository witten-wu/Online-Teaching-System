package com.Train.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Train.model.User;
import com.Train.model.Userinfo;

/**
 * 登录注册service
 * @author as PiscesTong
 *
 */
public interface CommonService {
	
	User selectUserByUid(Integer uid);
	
	int insertUser(User user);
	
	User selectUserByUidAndPassword(Integer uid,String password);
	
	int updatePasswordByUserId(User user);
	
	int insertUserInfo(Userinfo userinfo);
	
	List<User> selectUidByEmail(String email);
}
