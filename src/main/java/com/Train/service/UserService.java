package com.Train.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.Train.model.Course;
import com.Train.model.FileEntity;
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.User;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;


/**
 * 用户service
 * @author as PiscesTong
 *
 */
public interface UserService {
	int insertUserCourse(UserCourse usercourse);
	
	int insertQues(Question ques);
	
	List<UserCourse> checkUserCourse(UserCourse usercourse);
	
	int deleteUserCourse(UserCourse usercourse);
	
	Userinfo selectUserInfoByUserId(Integer uid);
	
	int updateUserInfoByUserId(Userinfo userinfo);
	
	User selectUserByUname(String cTeacher);
	
	Course selectCourseByCid(Integer cid);
	
	List<Course> selectAllCourses(Integer uid);
	
	List<Course> selectTeacherCourses(Integer uid);
	
	List<Course> selectAllC();
	
	List<Course> selectTeacher();
	
	List<Course> selectCourseByCteacher(Integer uid,String cTeacher);
	
	List<Course> selectCourseByCname(Integer uid,String cName);
	
	List<Course> selectMyCourses(Integer uid);
	
	List<FileEntity> selectCourses2(Integer cid);
	
	List<FileEntity> selectCourses3(Integer fileId);
	
	List<Course> selectMyExam(Integer uid);
	
	List<Course> selectMyScore(Integer uid);
	
	List<Title> selectTitleByCcid(Integer ccid);
	
	List<Title> selectTitleByCid(Integer cid);
	
	List<Question> selectQues(Integer uid);
	
	List<Question> selectQues2(Integer uid);
	
	Course selectDescriptionBycId(Integer cid);
}
