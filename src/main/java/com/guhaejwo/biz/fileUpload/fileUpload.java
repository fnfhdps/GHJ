package com.guhaejwo.biz.fileUpload;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public class fileUpload {
	
	//private static ServletContext ctx;
	//private static MultipartFile multpartFile;
	
	@Autowired
	public fileUpload() {}
	
	// multpartFile : input에서 넘긴 파일, webPath : 프로젝트 내 저장될 위치
	public static String file(MultipartFile multpartFile, ServletContext ctx, String webPath) throws Exception{
		String realSaveFileName = null;
		String fileName = multpartFile.getOriginalFilename();	// 파일 이름(확장자명 포함)

		if(fileName != "") {
			//String webPath ="/resources/image/sponsor";
			String realPath = ctx.getRealPath(webPath);
			
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			realSaveFileName = uniqueName + fileName;
			
			File savePath = new File(realPath);		// 파일명이 포함되지 않은 경로
			// 업로드하기 위한 경로가 없을 경우
			if(!savePath.exists())	// savePath의 경로가 존재하는지 존재하지 않는지 boolean 체크
				savePath.mkdirs();	// make Directory : 경로 만들어줌
			
			realPath += File.separator + realSaveFileName;	// File.separator : 구분자 ("\" 또는 "/" 자동으로 지정해서 경로 뒤에 붙여준다.)
			File saveFile = new File(realPath);		// 파일명이 포함된 경로
			
			try {
				multpartFile.transferTo(saveFile);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realSaveFileName;
	}
}
