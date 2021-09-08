package com.yj.yeogiya.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.yj.yeogiya.model.service.TestService;
import com.yj.yeogiya.util.FileUploadUtil;


@RestController
public class FileController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	private static final String UPLOAD_PATH = "yeogiya/board";
	@Value("#{property['file.rootPath']}") 
	private String rootPath;
	@Inject
	private TestService testService;
	
	//이미지 출력
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> yeogiyaImage(/* @RequestParam("img") */ String img) throws Exception {
		String fullFilePath = rootPath + "/" + img;
		System.out.println(fullFilePath);
		FileInputStream fis = new FileInputStream(fullFilePath);
		HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(
        		 IOUtils.toByteArray(fis), 
        		 header,
        		 HttpStatus.CREATED);
        fis.close();
		return entity;
	}
	
	//이미지 파일 업로드
	// filePath <- 루트경로 제외한 서버에 저장된 파일경로 리턴 
	@RequestMapping(value="/uploadImage", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public String uploadImg(MultipartFile file) throws Exception {
		System.out.println(file);
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = rootPath + "/test/";
		
		String originalFileName = file.getOriginalFilename();	//오리지날 파일명
		System.out.println("originalFileName:" + originalFileName);
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		System.out.println("savedFileName:" + savedFileName);
		
		File targetFile = new File(fileRoot + savedFileName);	
		System.out.println("targetFile:" + targetFile);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("filePath", "test/" + savedFileName); 
			jsonObject.addProperty("returnCode", "200");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println("a:" + a);
		return a;
	}
	
	//첨부파일 서버에서 삭제
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	public String deleteFile(String filePath) throws Exception {
		if (FileUploadUtil.deleteFile(rootPath, filePath)) {
			return "success";
		};
		return "fail";
	}
	
//	//*수정작업 (db에 있는 사진인지 판단하는 부분)
//	@RequestMapping(value="/selectCompleteImgName", method=RequestMethod.POST, produces="application/text;charset=utf-8") 
//	@ResponseBody
//	public String selectCompleteImgName(@RequestBody CompleteImgVo completeImgVo){
//		System.out.println("완성사진: " + completeImgVo);
//		return hobbyService.selectCompleteImgName(completeImgVo);
//	}
//	
//	@RequestMapping(value="/selectMainImg", method=RequestMethod.GET, produces="application/text;charset=utf-8") 
//	@ResponseBody
//	public String selectMainImg(int hobby_no){
//		return hobbyService.selectMainImg(hobby_no);
//	}
//	

}
