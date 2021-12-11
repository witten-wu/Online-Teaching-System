package com.Train.dao;


import java.util.List;

import com.Train.model.FileEntity;


/**
 * Created by Administrator on 2017/1/10.
 */

public interface FileDao {
   void saveFile(FileEntity fileEntity);
   void updateFile(FileEntity fileEntity);
   FileEntity findByid(long id);
   
   List<FileEntity> selectCourses2(Integer cid);
   List<FileEntity> selectCourses3(Integer fileId);
   int deleteCourseByfileId(Integer fileId);
}
