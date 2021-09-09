package com.yj.yeogiya.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.util.FileUploadUtil;


@RestController
public class FileController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	private static final String UPLOAD_PATH = "board";
	@Value("#{property['file.rootPath']}") 
	private String rootPath;
	@Inject
	private BoardService boardService;
	
	//이미지 출력
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> yeogiyaImage(String img) throws Exception {
		String fullFilePath = rootPath + "/" + img;
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
	public String uploadImg(@RequestParam List<MultipartFile> files) throws Exception {
		
		JsonArray jsonArr = new JsonArray();
		for (MultipartFile file : files) {
			String filePath = FileUploadUtil.uploadImage(file, rootPath, UPLOAD_PATH);
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("filePath", filePath);
			jsonArr.add(jsonObj);
		}
		
		return jsonArr.toString();
	}
	

}
