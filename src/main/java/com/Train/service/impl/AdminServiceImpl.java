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
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;
import com.Train.service.AdminService;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private CourseDao courseDao;
	@Resource
	private QuestionDao questionDao;
	@Resource
	private TitleDao titleDao;
	@Resource
	private UserDao userDao;
	@Resource
	private FileDao fileDao;
	@Resource
	private UserCourseDao usercourseDao;
	@Resource
	private UserinfoDao userinfoDao;
	
	public int insertCourse(Course course) {
		return courseDao.insertCourse(course);
	}
	
	public int updateQuestion(Question ques){
		return questionDao.updateQuestion(ques);
	}

	public int insertTitle(Title title){
		return titleDao.insertTitle(title);
	}
	
	public List<Title> checkTitle(Integer cid){
		return titleDao.checkTitle(cid);
	}
	
	public int deleteCourseByCid(Integer cid) {
		return courseDao.deleteCourseByCid(cid);
	}
	
	public int deleteCourseByfileId(Integer fileID) {
		return fileDao.deleteCourseByfileId(fileID);
	}

	
	public int updateCourseByCid(Course course) {
		return courseDao.updateCourseByCid(course);
	}

	public int updateTitle(Title title) {
		return titleDao.updateTitle(title);
	}
	
	public int updateUserCourse(UserCourse usercourse) {
		return usercourseDao.updateUserCourse(usercourse);
	}

	public List<Userinfo> selectAllUser(Integer uid){
		return userinfoDao.selectAllUser(uid);
	}
	
	public List<Userinfo> selectAllU(){
		return userinfoDao.selectAllU();
	}
	
	public List<Userinfo> selectUserScore(Integer cid){
		return userinfoDao.selectUserScore(cid);
	}

}
