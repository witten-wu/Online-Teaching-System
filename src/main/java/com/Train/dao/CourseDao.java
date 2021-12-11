package com.Train.dao;

import com.Train.model.Course;
import com.Train.model.UserCourse;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CourseDao {
    int deleteByPrimaryKey(Integer cid);

    int insert(Course record);
    
    int insertCourse(Course course);

    int insertSelective(Course record);
    
    int deleteCourseByCid(Integer cid);

    Course selectByPrimaryKey(Integer cid);
    
    List<Course> selectAllCourses(Integer uid);
    
    List<Course> selectTeacherCourses(Integer uid);
    
    List<Course> selectAllC();
    
    List<Course> selectTeacher();
    
    List<Course> selectCourseByCteacher(Integer uid,String cTeacher);
    
    List<Course> selectCourseByCname(Integer uid,String cName);
    
    List<Course> selectMyCourses(Integer uid);
    
    List<Course> selectMyExam(Integer uid);
    
    List<Course> selectMyScore(Integer uid); 
    
    Course selectCourseByCid(Integer cid);
    
    Course selectDescriptionBycId(Integer cid);
    
    int updateCourseByCid(Course course);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}