package com.guhaejwo.view.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@SessionAttributes("login")
public class UserMyPageController {
	
	private final UserServiceImpl userService;
	private final ServletContext ctx;
	
	@Autowired
	public UserMyPageController(UserServiceImpl userService, ServletContext ctx) {
		this.userService = userService;
		this.ctx = ctx;
	}
	
	// 내 정보 이동 (마이페이지)
	@GetMapping("/mypage/info/{seq}")
	public String info(@PathVariable("seq") int userSeq, Model model) throws Exception {
		UserDTO user = new UserDTO();
		user.setUserSeq(userSeq);
		
		// 각 컨텐츠별 회원의 총 갯수
		Map<String, Integer> totalCnt = new HashMap<String, Integer>();
		totalCnt.put("adopt", userService.userAdoptCnt(user));
		totalCnt.put("sponsor", userService.userSponsorCnt(user));
		totalCnt.put("heart", userService.userHeartCnt(user));
		
		model.addAttribute("totalCnt", totalCnt);
		return "/myPage/user_update";
	}
	
	// 내 정보 수정 이동 (마이페이지)
	@GetMapping("/mypage/info/update")
	public String update() {
		return "/myPage/user_update_form";
	}
	
	// 내 정보 수정 (마이페이지)
	@PostMapping("/mypage/info/update")
	public String update(@RequestParam MultipartFile adoptFile, UserDTO user , Model model, HttpServletRequest req) throws IllegalStateException, IOException, Exception {
		String fileName = adoptFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
		String webPath ="/resources/image/profile";
		String realPath = ctx.getRealPath(webPath);
		
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		String realSaveFileName = uniqueName + fileName;
		
		File savePath = new File(realPath);		// 파일명이 포함되지 않은 경로
		// 업로드하기 위한 경로가 없을 경우
		if(!savePath.exists())	// savePath의 경로가 존재하는지 존재하지 않는지 boolean 체크
			savePath.mkdirs();	// make Directory : 경로 만들어줌
		
		realPath += File.separator + realSaveFileName;	// File.separator : 구분자 ("\" 또는 "/" 자동으로 지정해서 경로 뒤에 붙여준다.)
		File saveFile = new File(realPath);		// 파일명이 포함된 경로
		
		 try {
			adoptFile.transferTo(saveFile);
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
		user.setUserImg(realSaveFileName);	// 파일 이름으로 adoptImg set
		
		userService.update(user);
		HttpSession session = req.getSession();

		// 기존 login 세션을 데이터 user2에 저장 후 비밀번호만 바꾸고 다시 세션에 저장함
		UserDTO user2 = (UserDTO) session.getAttribute("login");
		System.out.println();
		user2.setUserEmail(user.getUserEmail());			
		user2.setUserPhone(user.getUserPhone());			
		user2.setUserImg(user.getUserImg());			
		user2.setUserAddr1(user.getUserAddr1());			
		user2.setUserAddr2(user.getUserAddr2());	
		user2.setUserAddr3(user.getUserAddr3());	
		
		session.setAttribute("login", user2);
		
		return "myPage/user_update";
	}
	
	// 최근 접속일시
	@PostMapping("/lastTime")
	public @ResponseBody int updateLastTime(@RequestBody UserDTO user) throws Exception {
		try {
			System.out.println("도입"+user);
			userService.updateLastTime(user);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// 회원 탈퇴 이동 (마이페이지)
	@GetMapping(value = "/mypage/delete")
	public String delete() {
	return "/myPage/user_delete";
	}

	// 회원 탈퇴 (마이페이지)
	// 여기서 invalidate하면 세션은 해제됐음에도 index로 돌아갈때 로그인 정보가 남아있음
	@PostMapping("/mypage/delete")
	public String withdraw(UserDTO user, HttpSession session) throws Exception {
		session.removeAttribute("login");
//		session.invalidate();
		userService.withdraw(user);
		return "redirect: /logout";
	}

	// 비밀번호 변경 (마이페이지)
	@PostMapping("/change_pw")
	public @ResponseBody int changePw(@RequestBody UserDTO user, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		
		try {
			userService.changePw(user);
			// 기존 login 세션을 데이터 user2에 저장 후 비밀번호만 바꾸고 다시 세션에 저장함
			UserDTO user2 = (UserDTO) session.getAttribute("login");
			user2.setUserPw(user.getUserPw());
			session.setAttribute("login", user2);
			
			return 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}
}
