package com.Train.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Train.dao.FileDao;
import com.Train.model.FileEntity;
import com.Train.service.FileService;

@Service("FileService")  
public class FileServiceImpl implements FileService {

	@Resource
	private FileDao fileMapper;
	@Override
	public void saveFile(FileEntity fileEntity) {
		// TODO Auto-generated method stub
        fileMapper.saveFile(fileEntity);
	}

	@Override
	public void updateFile(FileEntity fileEntity) {
		// TODO Auto-generated method stub
        fileMapper.updateFile(fileEntity);
	}
	
	@Override
	public FileEntity findByid(long id) {
		// TODO Auto-generated method stub
		return fileMapper.findByid(id);
	}

}
