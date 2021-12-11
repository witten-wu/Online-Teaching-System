package com.Train.dao;

import com.Train.model.Course;
import com.Train.model.UserCourse;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserCourseDao {

    int deleteByPrimaryKey(Integer ucid);

    int insert(UserCourse record);
    
    int insertUserCourse(UserCourse usercourse);
    
    List<UserCourse> checkUserCourse(UserCourse usercourse);
    
    int deleteUserCourse(UserCourse usercourse);

    int insertSelective(UserCourse record);
    
    int updateUserCourse(UserCourse usercourse);

    UserCourse selectByPrimaryKey(Integer ucid);

}