package com.jxust.svsh.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jxust.svsh.entity.Vn_Post;
import com.jxust.svsh.entity.Vn_Post_Image;
import com.jxust.svsh.entity.Vn_Post_Video;
import com.jxust.svsh.service.VnPostImageService;
import com.jxust.svsh.service.VnPostService;
import com.jxust.svsh.service.VnPostVideoService;

@Controller
/*@RequestMapping(value = "/uploadfactory")*/
public class UploadController {
	
	@Autowired public VnPostVideoService vnPostVideoService;
	@Autowired public VnPostImageService vnPostImageService;
	@Autowired public VnPostService vnPostService;
	
	@RequestMapping(value = "upload")
	public String upload(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {

		System.out.println("开始");
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		String fileName = file.getOriginalFilename();
		// String fileName = new Date().getTime()+".jpg";
		System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}

		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("fileUrl", request.getContextPath() + "/upload/"
				+ fileName);
		System.out.println("检测：" + request.getContextPath() + "/upload/"
				+ fileName);

		return "upload";
	}

	@RequestMapping(value="uploaderr")
	@ResponseBody
	public String upload(String user_id,HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("能传进user_id吗？"+user_id);
		int id=Integer.parseInt(user_id);
		System.out.println("收到视频!");
		MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = Murequest.getFileMap();// 得到文件map对象
		String upaloadUrl = request.getSession().getServletContext()
				.getRealPath("/")
				+ "upload/";// 得到当前工程路径拼接上文件名
		File dir = new File(upaloadUrl);
		int counter=0;
		System.out.println(upaloadUrl);
		if (!dir.exists())// 目录不存在则创建
			dir.mkdirs();
		for (MultipartFile file : files.values()) {
			counter++;
			String fileName = file.getOriginalFilename();
			System.out.println("检查文件名"+fileName);
			
			Vn_Post_Video vpv=new Vn_Post_Video();
			vpv.setVideo_url(fileName);
			System.out.println("确认不变问号:"+vpv.getVideo_url());
			/*获取vn_post表中的最大主键值*/
			Vn_Post vp=vnPostService.getmaxpost();
			System.out.println("最大的vn_id:"+vp.getVn_id());
			int maxvn_id=vp.getVn_id()+1;
			System.out.println("备用的vn_id:"+maxvn_id);
			vpv.setV_connect_id(maxvn_id);
			vnPostVideoService.addVideo(vpv);
			/*获取vn_post表中的最大主键值*/
			
			File tagetFile = new File(upaloadUrl + fileName);// 创建文件对象
			if (!tagetFile.exists()) {// 文件名不存在 则新建文件，并将文件复制到新建文件中
				try {
					tagetFile.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					file.transferTo(tagetFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		System.out.println("接收完毕");
		return "uploadpost";
	}
	
	@RequestMapping(value="uploader")
	public void uploadd(String user_id,HttpServletRequest request, HttpServletResponse response) {

		System.out.println("ID:"+user_id);
		int id=Integer.parseInt(user_id);
		System.out.println("收到图片!");
		MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = Murequest.getFileMap();// 得到文件map对象
		String upaloadUrl = request.getSession().getServletContext()
				.getRealPath("/")
				+ "upload/";// 得到当前工程路径拼接上文件名
		File dir = new File(upaloadUrl);
		int counter=0;
		System.out.println(upaloadUrl);
		if (!dir.exists())// 目录不存在则创建
			dir.mkdirs();
		for (MultipartFile file : files.values()) {
			counter++;
			String fileName = file.getOriginalFilename();
			File tagetFile = new File(upaloadUrl + fileName);// 创建文件对象
			
			Vn_Post_Image vpi=new Vn_Post_Image();
			vpi.setImage_url(fileName);
			/*获取vn_post表中的最大主键值*/
			Vn_Post vp=vnPostService.getmaxpost();
			System.out.println("最大的vn_id:"+vp.getVn_id());
			int maxvn_id=vp.getVn_id()+1;
			System.out.println("备用的vn_id:"+maxvn_id);
			/*获取vn_post表中的最大主键值*/
			vpi.setConnect_id(maxvn_id);
			vnPostImageService.addImage(vpi);
			System.out.println("成功加入数据库");
			
			if (!tagetFile.exists()) {// 文件名不存在 则新建文件，并将文件复制到新建文件中
				try {
					tagetFile.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					file.transferTo(tagetFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		System.out.println("接收完毕");
	}

}
