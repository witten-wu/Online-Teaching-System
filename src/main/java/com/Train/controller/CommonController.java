package com.Train.controller;


import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Train.model.Mail;
import com.Train.model.User;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;
import com.Train.service.CommonService;
import com.Train.util.CommonUtil;
import com.Train.util.EnumUtil;
import com.Train.util.MailSender;
import com.alibaba.fastjson.JSONObject;

@Controller
public class CommonController {
	
	@Autowired
	CommonService commonService;
	//获取日志类
    private static Logger logger= LoggerFactory.getLogger(CommonController.class);
    
    
	@RequestMapping("/regist")
	@ResponseBody
	public JSONObject regist(Integer userId,String password){
		try{
			if(userId == null || password ==""){
				logger.info("用户名密码验证码不能为空");
				return CommonUtil.constructResponse(EnumUtil.CAN_NOT_NULL, "请输入有效信息", null);
			}
			User user=commonService.selectUserByUid(userId);
			if(user==null){
				user=new User();
				user.setUid(userId);
				user.setPassword(password);
				Integer resultOfInsertUser=commonService.insertUser(user);
				if(resultOfInsertUser>0){
					return CommonUtil.constructResponse(EnumUtil.OK, "用户注册成功", null);
				}else{
					return CommonUtil.constructResponse(0, "用户注册失败", null);
				}
			}else{
				return CommonUtil.constructResponse(0, "此用户已被注册，可直接登录", null);
			}
		}catch(Exception e){
			logger.error(e.getMessage());
			return CommonUtil.constructExceptionJSON(EnumUtil.UNKOWN_ERROR, "未知错误，请联系管理员", null);
		}
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public JSONObject login(HttpSession session,Integer userId,String password){
		try{
			if(userId == null || password == ""){
				logger.info("用户名密码不能为空");
				return CommonUtil.constructResponse(EnumUtil.CAN_NOT_NULL, "请输入有效信息", null);
			}
			logger.info("开始验证用户 "+ userId +" 是否存在");
			User user=commonService.selectUserByUidAndPassword(userId, password);
			if(user==null){
				return CommonUtil.constructResponse(EnumUtil.PASSWORD_ERROR, "用户名或密码错误", null);
			}else{
				session.setAttribute("user", user);
				if(user.getGrade()==0){
					Userinfo userinfo=new Userinfo();
					userinfo.setUid(userId);
					commonService.insertUserInfo(userinfo);
				}				
				logger.info("登陆成功");
				return CommonUtil.constructResponse(EnumUtil.OK, "登录成功", user);
			}
		}catch(Exception e){
			logger.error(e.getMessage());
			return CommonUtil.constructExceptionJSON(EnumUtil.UNKOWN_ERROR, "未知错误，请联系管理员", null);
		}
	}
	
	@RequestMapping("/exit")
	@ResponseBody
	public JSONObject exit(HttpSession session) throws Exception {
		session.removeAttribute("user");
		return CommonUtil.constructResponse(EnumUtil.OK,"退出成功", null);
	}
	
	/**
	 * 认证邮箱
	 */
	@RequestMapping("/verifyEmail")
	@ResponseBody
	public JSONObject verifyEmail(String email,HttpSession session) throws Exception {	
		logger.info(email);
		/**
		 * 生成一个验证码
		 */
		Random random = new Random();    
		String sRand="";      
		for (int i=0;i<4;i++){      
			String rand=String.valueOf(random.nextInt(10));      
			sRand+=rand;
		}
		logger.info(sRand);
		session.setAttribute("verifyCode", sRand);
		session.setAttribute("email",email);
		String emailInfo="要使用新的密码, 请将以下字符输入验证框中，完成重置密码的操作!。（若不是本人操作，请忽略此条邮件）\r\n\r\n"+sRand+
				"\r\n\r\n\r\n感谢您的使用！";
		Mail mail=new Mail(email,"重置密码！",emailInfo,null);
	    MailSender.sendMail(mail);
		return CommonUtil.constructResponse(EnumUtil.OK,"发送验证邮箱成功", null);
	}
	
	@RequestMapping("/verifyCodeValue")
	@ResponseBody
	public JSONObject verifyCodeValue(HttpSession session,String code) throws Exception {
		String verifyCode=(String) session.getAttribute("verifyCode");
		if(code.equals(verifyCode)){
			return CommonUtil.constructResponse(EnumUtil.OK,"验证成功，可以设置新密码", null);
		}else{
			return CommonUtil.constructResponse(0,"验证失败，不可以设置新密码", null);
		}	
	}
	
	@RequestMapping("/alterPassword")
	@ResponseBody
	public JSONObject alterPassword(HttpSession session,String password,String surePassword) 
			throws Exception {
		String email=(String) session.getAttribute("email");
		if(email==null||email.isEmpty()){
			return CommonUtil.constructResponse(0,"email不能为空", null);
		}
		else{
			List<User> uid=commonService.selectUidByEmail(email);
			if(uid.size()>1){
				return CommonUtil.constructResponse(0,"你不能修改密码，你的邮箱不唯一", null);
			}
			if(uid.size()==0||uid.isEmpty()){
				return CommonUtil.constructResponse(0,"你注册的账户并没有此邮箱", null);
			}
			if(!password.equals(surePassword)){
				return CommonUtil.constructResponse(0,"两次密码输入不一致", null);
			}else{
				Integer userId=uid.get(0).getUid();
				User user=new User();
				user.setUid(userId);
				user.setPassword(password);
				Integer resultOfAlterPassword=commonService.updatePasswordByUserId(user);
				if(resultOfAlterPassword>0){
					System.out.println("returned");
					return CommonUtil.constructResponse(EnumUtil.OK,"密码修改成功", null);
				}else{
					return CommonUtil.constructResponse(0,"密码修改失败", null);
				}
			}
		}
	}
	
	/**
	 * 输入原密码的修改密码
	 * @param userId
	 * @param password
	 * @param surePassword
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public JSONObject alterPassword(HttpSession session,String oldPassword,
			String newPassword,String surePassword) 
			throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		user=commonService.selectUserByUid(userId);
		String password=user.getPassword();
		if(oldPassword==""||newPassword==""||surePassword==""){
			return CommonUtil.constructResponse(EnumUtil.CAN_NOT_NULL, "请输入有效信息", null);
		}else{
			if(!oldPassword.equals(password)){
				return CommonUtil.constructResponse(EnumUtil.PASSWORD_ERROR, "原密码输入错误，请重新输入",
						null);
			}
			if(!newPassword.equals(surePassword)){
				return CommonUtil.constructResponse(0, "两次密码输入不一样",
						null);
			}
			user.setUid(userId);
			user.setPassword(newPassword);
			Integer resultOfAlterPassword=commonService.updatePasswordByUserId(user);
			if(resultOfAlterPassword>0){
				return CommonUtil.constructResponse(EnumUtil.OK,"密码修改成功", null);
			}else{
				return CommonUtil.constructResponse(0,"密码修改失败", null);
			}
		}
	}	
}
