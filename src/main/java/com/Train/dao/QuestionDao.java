package com.Train.dao;

import com.Train.model.Question;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer questionid);

    int insert(Question record);

    int insertSelective(Question record);
    
    int updateQuestion(Question ques);

    Question selectByPrimaryKey(Integer questionid);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
    
    int insertQues(Question ques);
    
    List<Question> selectQues(Integer uid);
    
    List<Question> selectQues2(Integer uid);
}