package com.with.community.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.vo.BoardVO;
import com.with.community.vo.NoticeVO;

@Component
public class FileUtils {

	@Autowired
	private ServletContext servletContext;
	
//	private static final String filePath = "C:\\Users\\lee\\git\\WithComm-FRONT\\WithCommunity\\src\\main\\webapp\\resources\\upload";
	private static final String filePath = "/resources/upload/mem_Image";
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception
	{
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int board_no = boardVO.getBoard_no();
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			
			System.out.println("multipartFile :" + multipartFile);
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String,Object>();
				listMap.put("BOARD_NO", board_no);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
			
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public String updateImg(MultipartHttpServletRequest mpRequest) throws Exception
	{
	Iterator<String> iterator = mpRequest.getFileNames();
			
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			
			String me_image = "";
			
			File file = new File(filePath);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			while(iterator.hasNext()) {
				multipartFile = mpRequest.getFile(iterator.next());
				
				System.out.println("multipartFile :" + multipartFile);
				
				if(multipartFile.isEmpty() == false) {
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					storedFileName = getRandomString() + originalFileExtension;
					file = new File(filePath + storedFileName);
					multipartFile.transferTo(file);
					me_image = storedFileName;
				}
			}
			
			return me_image;
		}

	public List<Map<String, Object>> parseInsertFileInfo(NoticeVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int notice_no = vo.getNotice_no();
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			
			System.out.println("multipartFile :" + multipartFile);
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String,Object>();
				listMap.put("NOTICE_NO", notice_no);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
}
