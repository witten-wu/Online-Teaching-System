package com.Train.service;

import com.Train.model.FileEntity;

public interface FileService {
	  void saveFile(FileEntity fileEntity);
	  void updateFile(FileEntity fileEntity);
	   FileEntity findByid(long id);
}
