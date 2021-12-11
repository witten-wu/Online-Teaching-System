package com.Train.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Train.model.FileEntity;
import com.Train.service.FileService;
import com.Train.util.CommonUtil;
import com.Train.util.EnumUtil;
import com.Train.util.FileUploadTool;
import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 上传文件
 * 
 * @author fengying
 *
 */
@Controller
@RequestMapping(value="/file")
public class UploadController {
	@Resource
	private FileService service;
	

	@RequestMapping("/default")
	public String show() {
		return "upload";
	}

	@RequestMapping(value="/upload")
	@ResponseBody
	public JSONObject upload(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
			@RequestParam(value = "cid", required = false) Integer cid,
			@RequestParam(value = "cName", required = false) String cName,
			@RequestParam(value = "cDes", required = false) String cDes,
			HttpServletRequest request) {
		FileEntity entity = new FileEntity();
		FileUploadTool fileUploadTool = new FileUploadTool();
		// JSONObject getObj = new JSONObject();
		entity = fileUploadTool.createFile(multipartFile, request);
		if (entity != null) {
			entity.setCid(cid);
			entity.setCname(cName);
			entity.setCdescription(cDes);
			service.saveFile(entity);
			return CommonUtil.constructResponse(EnumUtil.OK,"上传成功", entity);
		} else {
			return CommonUtil.constructResponse(0,"上传失败", null);
		}		
	}
	
	@RequestMapping(value="/update")
	@ResponseBody
	public JSONObject update(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
			@RequestParam(value = "fileId", required = false) Integer fileId,
			@RequestParam(value = "cid", required = false) Integer cid,
			@RequestParam(value = "cName", required = false) String cName,
			@RequestParam(value = "cDes", required = false) String cDes,
			HttpServletRequest request) {
		FileEntity entity = new FileEntity();
		FileUploadTool fileUploadTool = new FileUploadTool();
		// JSONObject getObj = new JSONObject();
		entity = fileUploadTool.createFile(multipartFile, request);
		if (entity != null) {
			entity.setFileId(fileId);
			entity.setCid(cid);
			entity.setCname(cName);
			entity.setCdescription(cDes);
			service.updateFile(entity);
			return CommonUtil.constructResponse(EnumUtil.OK,"修改成功", entity);
		} else {
			return CommonUtil.constructResponse(0,"修改失败", null);
		}		
	}

	@RequestMapping(value = "/{id}/play")
	@ResponseBody
	public ModelAndView playVideo(@PathVariable("id") long id, ModelMap model) {

		// CharterDto charterDto_ = charterFacade.getCharterById(id);
		FileEntity entity = service.findByid(id);
		model.put("entity", entity.getPath());
		ModelAndView view = new ModelAndView("index", model);
		return view;
	}

	@RequestMapping("/show")
	@ResponseBody
	public ModelAndView showList(HttpServletRequest request, ModelMap map) {
		// 获取上传文件目录
		String logoPathDir = "/video/";
		String uploadFilePath =request.getSession().getServletContext().getRealPath(logoPathDir);
		// 存储要下载的文件名
		List<String> fileNameMap = new ArrayList<String>();
		this.listFile(new File(uploadFilePath), fileNameMap);
		map.put("list", fileNameMap);
		return new ModelAndView("listFile", map);

	}

	/**
	 * @Description: 递归遍历指定目录下的所有文件
	 * @param file：即代表一个文件，也代表一个文件目录
	 * @param map：存储文件名的Map集合
	 */
	public void listFile(File file, List<String> map) {
		// 如果file代表的不是一个文件，而是一个目录
		if (!file.isFile()) {
			// 列出该目录下的所有文件和目录
			File files[] = file.listFiles();
			// 遍历files[]数组
			for (File f : files) {
				// 递归
				listFile(f, map);
			}
		} else {
			map.add(file.getName());
		}
	}

	@RequestMapping(value = "/download")
	@ResponseBody
	public void download(@RequestParam(value = "filename", required = false) String fileName,
			HttpServletRequest request, ModelMap map, HttpServletResponse response) {
		try {
			fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// 获取上传文件目录
		String logoPathDir = "/video/";
		String fileSaveRootPath = request.getSession().getServletContext().getRealPath(logoPathDir);
		// 文件路径
		String fileDir = fileSaveRootPath + File.separator + fileName;
		File file = new File(fileDir);
		if (!file.exists()) {
			System.out.println("下载的文件不存在");
			return;
		}
		// 设置响应头，控制浏览器下载该文件
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = null;
		try {
			in = new FileInputStream(fileDir);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 创建输出流
		OutputStream out;
		try {
			out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
