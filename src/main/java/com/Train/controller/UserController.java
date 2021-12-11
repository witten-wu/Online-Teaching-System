package com.Train.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.Train.model.Course;
import com.Train.model.FileEntity;
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.User;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;
import com.Train.service.CommonService;
import com.Train.service.UserService;
import com.Train.util.CommonUtil;
import com.Train.util.EnumUtil;
import com.alibaba.fastjson.JSONObject;
import com.jcraft.jsch.Logger;
import com.jcraft.jsch.UserInfo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	CommonService commonService;
	
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public JSONObject getUserInfo(HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//获得用户id
		Userinfo userinfo=userService.selectUserInfoByUserId(userId);
		if(userinfo==null){
			return CommonUtil.constructResponse(0,"此用户个人信息为空", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"用户个人信息", userinfo);
		}
	}
	
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public JSONObject updateUserInfo(HttpSession session,@RequestParam(value = "headImg", 
			required = false) MultipartFile headImg,Userinfo userinfo) throws Exception {
		/**
		 * 如果没修改头像headImg为null需要修改代码
		 */
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//获得用户id
		/**
		 * 上传文件到headImg,并得到路径修改数据库
		 */
		if(headImg!=null){
	        	 String filename = headImg.getOriginalFilename();  
	 	         if(filename!=null && !filename.isEmpty()){
	 	        	String root =session.getServletContext().getRealPath("/headImg/");
	 	        	int index = filename.lastIndexOf("\\");
	 	    		if(index != -1) {
	 	    			filename = filename.substring(index+1);
	 	    		}
	 	    		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	 	            String time=sdf.format(new Date());
	 	            filename=time+"_"+filename;
	 	            File destFile = new File(root,filename);
	 	            if(!destFile.exists()){
	 	            	destFile.mkdirs();
	 	            }  
	 	            headImg.transferTo(destFile); 
	 	            userinfo.setHeadimgurl(filename);
	 	        }
	        }
         userinfo.setUid(userId);
         Integer resultOfUpdateUserInfo=userService.updateUserInfoByUserId(userinfo);
         if(resultOfUpdateUserInfo>0){
         	return CommonUtil.constructResponse(EnumUtil.OK,"更新个人信息成功", null);
         }else{
         	return CommonUtil.constructResponse(0,"更新个人信息失败", null);
         }
	}
	
	
	@RequestMapping("/showCourses")
	@ResponseBody
	public JSONObject showCourses(HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//获得用户id
		List<Course> courses=userService.selectAllCourses(userId);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", courses);
		}
	}
	
	@RequestMapping("/showTeacher")
	@ResponseBody
	public JSONObject showTeacher() throws Exception {
		List<Course> courses=userService.selectTeacher();
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无老师信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"老师信息", courses);
		}
	}
	
	@RequestMapping("/showCoursesByCteacher")
	@ResponseBody
	public JSONObject showCoursesByCteacher(HttpSession session,String cTeacher) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();
		List<Course> courses=userService.selectCourseByCteacher(userId,cTeacher);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无老师信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"老师信息", courses);
		}
	}
	
	@RequestMapping("/showCoursesByCname")
	@ResponseBody
	public JSONObject showCoursesByCname(HttpSession session,String cName) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();
		List<Course> courses=userService.selectCourseByCname(userId,cName);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无老师信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"老师信息", courses);
		}
	}
	
	@RequestMapping("/showTeacherCourses")
	@ResponseBody
	public JSONObject showTeacherCourses(HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//获得用户id		
		List<Course> courses=userService.selectTeacherCourses(userId);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", courses);
		}
	}
	
	@RequestMapping("/showAllCourses")
	@ResponseBody
	public JSONObject showAllCourses() throws Exception {	
		List<Course> courses=userService.selectAllC();
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", courses);
		}
	}
	
	@RequestMapping("/showMyCourses")
	@ResponseBody
	public JSONObject showMyCourses(Integer uid) throws Exception {
		List<Course> courses=userService.selectMyCourses(uid);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", courses);
		}
	}
	
	@RequestMapping("/showQuestion")
	@ResponseBody
	public JSONObject showQuestion(HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		List<Question> question=userService.selectQues(userId);
		if(question.isEmpty()||question.size()==0){
			return CommonUtil.constructResponse(0,"无提问信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"提问信息", question);
		}
	}
	
	@RequestMapping("/showQuestion2")
	@ResponseBody
	public JSONObject showQuestion2(HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		List<Question> question=userService.selectQues2(userId);
		if(question.isEmpty()||question.size()==0){
			return CommonUtil.constructResponse(0,"无待处理提问", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"提问信息", question);
		}
	}
	
	@RequestMapping("/showCourses2")
	@ResponseBody
	public JSONObject showCourses2(Integer cid) throws Exception {
		List<FileEntity> file=userService.selectCourses2(cid);
		if(file.isEmpty()||file.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", file);
		}
	}
	
	@RequestMapping("/showCourses3")
	@ResponseBody
	public JSONObject showCourses3(Integer fileId) throws Exception {
		List<FileEntity> file=userService.selectCourses3(fileId);
		if(file.isEmpty()||file.size()==0){
			return CommonUtil.constructResponse(0,"无课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"课程信息", file);
		}
	}
		
	@RequestMapping("/judgeUserIdisExist")
	@ResponseBody
	public JSONObject judgeUserIdisExist(Integer userId) throws Exception {		
		User user=commonService.selectUserByUid(userId);
		if(user==null){
			return CommonUtil.constructResponse(0,"此用户没有注册", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"此用户可用",null);
		}
	}
		
	
	@RequestMapping("/getMyExam")
	@ResponseBody
	public JSONObject getMyExam(HttpSession session) throws Exception {	
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		List<Course> courses=userService.selectMyExam(userId);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"暂无可考试课程", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"考试课程信息",courses);
		}
	}
	
	@RequestMapping("/getMyScore")
	@ResponseBody
	public JSONObject getMyScore(HttpSession session) throws Exception {	
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		List<Course> courses=userService.selectMyScore(userId);
		if(courses.isEmpty()||courses.size()==0){
			return CommonUtil.constructResponse(0,"暂无成绩信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"成绩信息",courses);
		}
	}
	
	@RequestMapping("/addQuestion")
	@ResponseBody
	public JSONObject addQuestion(HttpSession session,String question,String cTeacher) throws Exception {	
		User user=(User) session.getAttribute("user");
		Integer userId=user.getUid();//得到用户id
		Question ques=new Question();
		ques.setStuid(userId);
		ques.setQuestion(question);
		User teacher =new User();
		teacher =userService.selectUserByUname(cTeacher);
		Integer tecid = teacher.getUid();
		ques.setTecid(tecid);
		Integer resultOfInsertQues=userService.insertQues(ques);
		if(resultOfInsertQues>0){
			return CommonUtil.constructResponse(EnumUtil.OK,"提问成功", null);
		}else{
			return CommonUtil.constructResponse(0,"提问失败",null);
		}
	}
	
	@RequestMapping("/addUserCourse")
	@ResponseBody
	public JSONObject addUserCourse(Integer uid,Integer cid) throws Exception {
		/*User user=(User)session.getAttribute("user");
		Integer uid=user.getUid();//获得用户id*/		
		UserCourse usercourse=new UserCourse();
		usercourse.setCid(cid);
		usercourse.setUid(uid);
		List<UserCourse> userC=userService.checkUserCourse(usercourse);
		if(userC.isEmpty()||userC.size()<=0){
			Integer resultOfInsertCourse=userService.insertUserCourse(usercourse);
			if(resultOfInsertCourse>0){ 
				return CommonUtil.constructResponse(EnumUtil.OK,"选课成功", null);
			}else{
				return CommonUtil.constructResponse(0,"选课失败", null);
			}
		}else{
			return CommonUtil.constructResponse(0,"你已经选过该课", null);
		}
	}
	
	@RequestMapping("/deleteUserCourse")
	@ResponseBody
	public JSONObject deleteUserCourse(Integer uid,Integer cid) throws Exception {
		UserCourse usercourse=new UserCourse();
		usercourse.setCid(cid);
		usercourse.setUid(uid);
		Integer resultOfInsertCourse=userService.deleteUserCourse(usercourse);
		if(resultOfInsertCourse>0){ 
			return CommonUtil.constructResponse(EnumUtil.OK,"退课成功", null);
		}else{
			return CommonUtil.constructResponse(0,"退课失败", null);
		}
	}
	
	@RequestMapping("/showCourseByCid")
	@ResponseBody
	public JSONObject showCourseByCid(Integer cid) throws Exception {			
		Course course=userService.selectCourseByCid(cid);
		if(course==null){
			return CommonUtil.constructResponse(0,"没有此课程信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"此课程信息", course);
		}
	}
	
	@RequestMapping("/showExamByCcid")
	@ResponseBody
	public JSONObject showExamByCcid(Integer ccid) throws Exception {			
		List<Title> title=userService.selectTitleByCcid(ccid);
		if(title.isEmpty()||title.size()==0){
			return CommonUtil.constructResponse(0,"没有此试卷信息，请先上传", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"试卷信息", title);
		}
	}
	
	@RequestMapping("/showExamByCid")
	@ResponseBody
	public JSONObject showExamByCid(Integer cid) throws Exception {			
		List<Title> title=userService.selectTitleByCid(cid);
		if(title.isEmpty()||title.size()==0){
			return CommonUtil.constructResponse(0,"没有此试卷信息，请先上传", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"试卷信息", title);
		}
	}
	
	@RequestMapping("/showDescriptionBycId")
	@ResponseBody
	public JSONObject showDescriptionBycId(Integer cid) throws Exception {
		Course course=userService.selectDescriptionBycId(cid);
		if(course == null){
			return CommonUtil.constructResponse(0,"该课程无学员信息", null);
		}else{
			return CommonUtil.constructResponse(EnumUtil.OK,"学员信息", course);
		}
	}
}
