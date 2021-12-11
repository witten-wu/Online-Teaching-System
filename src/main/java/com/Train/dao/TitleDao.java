package com.Train.dao;

import com.Train.model.Title;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TitleDao {
    int deleteByPrimaryKey(Integer titleid);

    int insert(Title record);

    int insertSelective(Title record);
    
    int updateTitle(Title title);
    
    int insertTitle(Title title);
    
    List<Title> checkTitle(Integer cid);

    Title selectByPrimaryKey(Integer titleid);

    int updateByPrimaryKeySelective(Title record);

    int updateByPrimaryKey(Title record);
    
    List<Title> selectTitleByCcid(Integer ccid);
    
    List<Title> selectTitleByCid(Integer cid);
}