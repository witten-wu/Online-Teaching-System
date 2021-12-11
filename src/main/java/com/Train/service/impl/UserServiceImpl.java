package com.Train.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.Train.dao.CourseDao;
import com.Train.dao.FileDao;
import com.Train.dao.QuestionDao;
import com.Train.dao.TitleDao;
import com.Train.dao.UserCourseDao;
import com.Train.dao.UserDao;
import com.Train.dao.UserinfoDao;
import com.Train.model.Course;
import com.Train.model.FileEntity;
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.User;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;
import com.Train.service.UserService;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{

	@Resource
	private CourseDao courseDao;
	@Resource
	private QuestionDao questionDao;
	@Resource
	private FileDao fileDao;
	@Resource
	private UserDao userDao;
	@Resource
	private UserinfoDao userinfoDao;
	@Resource
	private UserCourseDao usercourseDao;
	@Resource
	private TitleDao titleDao;
	
	public User selectUserByUname(String cTeacher){
		return userDao.selectUserByUname(cTeacher);
	}
	
	public int insertQues(Question ques){
		return questionDao.insertQues(ques);
	}
	
	public int insertUserCourse(UserCourse usercourse){
		return usercourseDao.insertUserCourse(usercourse);
	}
	
	public List<UserCourse> checkUserCourse(UserCourse usercourse){
		return usercourseDao.checkUserCourse(usercourse);
	}
	
	public int deleteUserCourse(UserCourse usercourse){
		return usercourseDao.deleteUserCourse(usercourse);
	}
	
	public Userinfo selectUserInfoByUserId(Integer uid) {
		return userinfoDao.selectUserInfoByUserId(uid);
	}

	public int updateUserInfoByUserId(Userinfo userinfo) {
		return userinfoDao.updateUserInfoByUserId(userinfo);
	}
	
	public Course selectCourseByCid(Integer cid) {
		return courseDao.selectCourseByCid(cid);
	}
	
	public Course selectDescriptionBycId(Integer cid) {
		return courseDao.selectDescriptionBycId(cid);
	}
	
	public List<Course> selectAllCourses(Integer uid) {
		return courseDao.selectAllCourses(uid);
	}
	
	public List<Course> selectTeacherCourses(Integer uid) {
		return courseDao.selectTeacherCourses(uid);
	}
	
	public List<Course> selectAllC() {
		return courseDao.selectAllC();
	}
	
	public List<Course> selectTeacher() {
		return courseDao.selectTeacher();
	}
	
	public List<Course> selectCourseByCteacher(Integer uid,String cTeacher) {
		return courseDao.selectCourseByCteacher(uid,cTeacher);
	}
	
	public List<Course> selectCourseByCname(Integer uid,String cName) {
		return courseDao.selectCourseByCname(uid,cName);
	}
	
	public List<Course> selectMyCourses(Integer uid) {
		return courseDao.selectMyCourses(uid);
	}
	
	public List<FileEntity> selectCourses2(Integer cid) {
		return fileDao.selectCourses2(cid);
	}
	
	public List<FileEntity> selectCourses3(Integer fileId) {
		return fileDao.selectCourses3(fileId);
	}
	
	public List<Course> selectMyExam(Integer uid) {
		return courseDao.selectMyExam(uid);
	}
	
	public List<Title> selectTitleByCcid(Integer ccid) {
		return titleDao.selectTitleByCcid(ccid);
	}
	
	public List<Title> selectTitleByCid(Integer cid) {
		return titleDao.selectTitleByCid(cid);
	}
	
	public List<Course> selectMyScore(Integer uid){
		return courseDao.selectMyScore(uid);
	}
	
	public List<Question> selectQues(Integer uid){
		return questionDao.selectQues(uid);
	}
	
	public List<Question> selectQues2(Integer uid){
		return questionDao.selectQues2(uid);
	}
}
