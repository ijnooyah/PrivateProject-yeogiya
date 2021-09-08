package com.yj.yeogiya.util;

import java.io.File;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;



public class FileUploadUtil {
	
	
	public static String uploadImage (MultipartFile file, String rootPath, String uploadPath) throws Exception {
		String datePath = getDatePath();
		// -> 2021/09/08
	
		String dateDirPath = makeDateDir(rootPath, uploadPath, datePath);
		// -> rootPath/uploadPath/2021/09/08 폴더 생성
		
		String savedFileName = getUUIDFileName(file); 
		// -> uuid_파일명.jpg
		
		File target = new File(dateDirPath + "/" + savedFileName);
		// -> rootPath/uploadPath/2021/09/08 + "/" + uuid_파일명.jpg

		InputStream fileStream = file.getInputStream();
		FileUtils.copyInputStreamToFile(fileStream, target);	//파일 저장
		
		String filePath = uploadPath + "/" + datePath + "/" + savedFileName;
		// -> rootPath 제외한 파일 전체 경로
		return filePath;
	}

	private static String makeDateDir(String rootPath, String uploadPath, String datePath) {
		String dateDirPath = rootPath + "/" + uploadPath + "/" + datePath;
		
		//날짜별 폴더 생성
		File f = new File(dateDirPath);
		if (!f.exists()) {
			f.mkdirs();
		} 
		return dateDirPath;
	}

	private static String getDatePath() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String month = new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String date = new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String datePath = year + "/" + month + "/" + date; 
		return datePath;
	}

	private static String getUUIDFileName(MultipartFile file) {
		String originalFileName = file.getOriginalFilename();	
		UUID uuid = UUID.randomUUID(); 
		String uuidFileName = uuid + "_" + originalFileName;
		return uuidFileName;
	}
	
	// 첨부파일 삭제
	public static boolean deleteFile(String rootPath, String filePath) throws Exception {
		String fullFilePath = rootPath + "/" + filePath;
		System.out.println(fullFilePath);
		File file = new File(fullFilePath);
		if(file.exists()) {
			if (file.delete()) {
				return true;
			}
		}
		return false;
	}
	
}
