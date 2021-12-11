package com.Train.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Train.model.Course;
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.User;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;
import com.Train.service.AdminService;
import com.Train.service.CommonService;
import com.Train.service.UserService;
import com.Train.util.CommonUtil;
import com.Train.util.EnumUtil;
import com.Train.util.FileUploadTool;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserService userService;
	@Autowired
	CommonService commonService;
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping("/addCourse")
	@ResponseBody
	public JSONObject addCourse(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
			@RequestParam(value = "cName", required = false) String cName,
			@RequestParam(value = "cDescription", required = false) String cDescription,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		Course course=new Course();	
		FileUploadTool fileUploadTool = new FileUploadTool();
		course = fileUploadTool.createImg(multipartFile, request);
		course.setCname(cName);
		course.setCdescription(cDescription);
		User user=(User)session.getAttribute("user");
		course.setCteacher(user.getUname());
		Integer resultOfInsertCourse=adminService.insertCourse(course);
		if(resultOfInsertCourse>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"添加课程信息成功", null);
		}else{
			return CommonUtil.constructResponse(0,"添加课程信息失败", null);
		}
	}
	
	
	@RequestMapping("/alterCourse")
	@ResponseBody
	public JSONObject alterCourse(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
			@RequestParam(value = "cId", required = false) Integer cId,
			@RequestParam(value = "cName", required = false) String cName,
			@RequestParam(value = "cDescription", required = false) String cDescription,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		Course course=new Course();
		FileUploadTool fileUploadTool = new FileUploadTool();
		course = fileUploadTool.createImg(multipartFile, request);
		course.setCid(cId);
		course.setCname(cName);
		course.setCdescription(cDescription);
		Integer resultOfUpdateClub=adminService.updateCourseByCid(course);
		if(resultOfUpdateClub>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"修改课程信息成功", null);
		}else{
			return CommonUtil.constructResponse(0,"修改课程信息失败", null);
		}
	}
	
	@RequestMapping("/addExam")
	@ResponseBody
	public JSONObject addExam(String title,String option_a,String option_b,String option_c,String option_d,String option_r,Integer cid,Integer ccid) throws Exception {
		Title titleT=new Title();
		titleT.setTitle(title);
		titleT.setOptionA(option_a);
		titleT.setOptionB(option_b);
		titleT.setOptionC(option_c);
		titleT.setOptionD(option_d);
		titleT.setOptionR(option_r);
		titleT.setCid(cid);
		titleT.setCcid(ccid);
		List<Title> titleC=adminService.checkTitle(ccid);
		if(titleC.isEmpty()||titleC.size()<=4){
			Integer resultOfInsertTitle=adminService.insertTitle(titleT);
			if(resultOfInsertTitle>0){
				return CommonUtil.constructResponse(EnumUtil.OK,"上传试卷成功", null);
			}else{
				return CommonUtil.constructResponse(0,"上传试卷失败", null);
			}
		}
		else{
			return CommonUtil.constructResponse(EnumUtil.OK,"你已经为该课程上传过试卷，请到修改试卷界面进行修改", null);
		}
		
	}
	
	@RequestMapping("/alterExam")
	@ResponseBody
	public JSONObject alterExam(Integer titleid,String title,String option_a,String option_b,String option_c,String option_d,String option_r,Integer cid,Integer ccid) throws Exception {
		Title titleT=new Title();
		titleT.setTitleid(titleid);
		titleT.setTitle(title);
		titleT.setOptionA(option_a);
		titleT.setOptionB(option_b);
		titleT.setOptionC(option_c);
		titleT.setOptionD(option_d);
		titleT.setOptionR(option_r);
		titleT.setCid(cid);
		titleT.setCcid(ccid);
		Integer resultOfUpdateTitle=adminService.updateTitle(titleT);
		if(resultOfUpdateTitle>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"修改试卷成功", null);
		}else{
			return CommonUtil.constructResponse(0,"修改试卷失败", null);
		}
	}
	
	
	@RequestMapping("/deleteCourse")
	@ResponseBody
	public JSONObject deleteCourse(Integer cid) throws Exception {
		Integer resultOfDeleteClub=adminService.deleteCourseByCid(cid);
		if(resultOfDeleteClub>0){
			//删除选课关系
			return CommonUtil.constructResponse(EnumUtil.OK,"删除课程信息成功", null);
		}else{
			return CommonUtil.constructResponse(0,"删除课程信息失败", null);
		}
	}
	
	@RequestMapping("/deleteCourse2")
	@ResponseBody
	public JSONObject deleteCourse2(Integer fileId) throws Exception {
		Integer resultOfDeleteClub=adminService.deleteCourseByfileId(fileId);
		if(resultOfDeleteClub>0){
			//删除选课关系
			return CommonUtil.constructResponse(EnumUtil.OK,"删除课程信息成功", null);
		}else{
			return CommonUtil.constructResponse(0,"删除课程信息失败", null);
		}
	}
	

	
	@RequestMapping("/addScore")
	@ResponseBody
	public JSONObject addScore(Integer cid,String Score,HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();
		UserCourse usercourse=new UserCourse();
		usercourse.setCid(cid);
		usercourse.setUid(userId);
		usercourse.setScore(Score);
		Integer resultOfaddScore=adminService.updateUserCourse(usercourse);
		if(resultOfaddScore>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"上传分数成功", null);
		}else{
			return CommonUtil.constructResponse(0,"上传分数失败", null);
		}
	}
	
	@RequestMapping("/addAnswer")
	@ResponseBody
	public JSONObject addAnswer(Integer questionid,String answer) throws Exception {
		Question ques=new Question();
		ques.setQuestionid(questionid);
		ques.setAnswer(answer);
		Integer resultOfaddAnswer=adminService.updateQuestion(ques);
		if(resultOfaddAnswer>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"上传成功", null);
		}else{
			return CommonUtil.constructResponse(0,"上传失败", null);
		}
	}
	
	@RequestMapping("/showAllUser")
	@ResponseBody
	public JSONObject showAllUser(HttpSession session) throws Exception {
		User user=(User)session.getAttribute("user");
		Integer userId = user.getUid();
		List<Userinfo> userinfo=adminService.selectAllUser(userId);
		if(userinfo.isEmpty()||userinfo.size()<=0){
			return CommonUtil.constructResponse(0,"无学员信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"学员信息", userinfo);
		}
	}
	
	@RequestMapping("/showAllU")
	@ResponseBody
	public JSONObject showAll() throws Exception {
		List<Userinfo> userinfo=adminService.selectAllU();
		if(userinfo.isEmpty()||userinfo.size()<=0){
			return CommonUtil.constructResponse(0,"无学员信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"学员信息", userinfo);
		}
	}
	
	@RequestMapping("/showUserScoreByCid")
	@ResponseBody
	public JSONObject getUserScoreByCid(Integer cid) throws Exception {	
		List<Userinfo> userinfo=adminService.selectUserScore(cid);
		if(userinfo.isEmpty()||userinfo.size()==0){
			return CommonUtil.constructResponse(0,"该课程暂无成绩信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"成绩信息",userinfo);
		}
	}
	
}
