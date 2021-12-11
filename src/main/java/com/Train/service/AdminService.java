package com.Train.service;

import java.util.List;
import java.util.Map;
import com.Train.model.Course;
import com.Train.model.Question;
import com.Train.model.Title;
import com.Train.model.UserCourse;
import com.Train.model.Userinfo;

/**
 * 管理员service
 * @author as PiscesTong
 *
 */
public interface AdminService {
	
	int insertCourse(Course course);
	
	int insertTitle(Title title);
	
	List<Title> checkTitle(Integer cid);
	
	int deleteCourseByCid(Integer cid);
	
	int deleteCourseByfileId(Integer fileId);
	
	int updateTitle(Title title);
	
	int updateQuestion(Question ques);
	
	int updateUserCourse(UserCourse usercourse);
	
	int updateCourseByCid(Course course);
	
	List<Userinfo> selectAllUser(Integer uid);
	
	List<Userinfo> selectAllU();
	
	List<Userinfo> selectUserScore(Integer cid);
	
}
