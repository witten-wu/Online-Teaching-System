package com.Train.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Train.dao.UserDao;
import com.Train.dao.UserinfoDao;
import com.Train.model.User;
import com.Train.model.Userinfo;
import com.Train.service.CommonService;


@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService{
	
	
	@Resource
	private UserDao userDao;
	@Resource
	private UserinfoDao userinfoDao;

	public User selectUserByUid(Integer uid) {
		return userDao.selectUserByUid(uid);
	}

	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	public User selectUserByUidAndPassword(Integer uid, String password) {
		return userDao.selectUserByUidAndPassword(uid, password);
	}

	public int updatePasswordByUserId(User user) {
		return userDao.updatePasswordByUserId(user);
	}

	public int insertUserInfo(Userinfo userinfo) {
		return userinfoDao.insertUserInfo(userinfo);
	}

	public List<User> selectUidByEmail(String email) {
		return userDao.selectUidByEmail(email);
	}
}
