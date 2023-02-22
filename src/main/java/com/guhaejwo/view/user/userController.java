package com.guhaejwo.view.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("login")
public class userController {
	
	private final UserServiceImpl userService;
	
	@Autowired
	public userController(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	// 내 정보 이동 (마이페이지)
	@GetMapping("/mypage/info")
	public String info() {
		return "/myPage/user_update";
	}
	
	// 내 정보 수정 이동 (마이페이지)
	@GetMapping("/mypage/info/update")
	public String update() {
		return "/myPage/user_update_form";
	}
	
	// 내 정보 수정 (마이페이지)
	@PostMapping("/mypage/info/update")
	public String update(UserDTO user , Model model, HttpServletRequest req) throws Exception{
		System.out.println(user);
		//System.out.println("파일업로드"+user.getUserImg());
		// 파일 업로드 처리
//		MultipartFile uploadFile = user.getUserImg();
//		
//		String path = "D:\\DevSpace\\SpringSpace\\Guhaejwo\\src\\main\\webapp\\resources\\image\\profile\\";
//
//		if (!uploadFile.isEmpty()) {
//			try {
//				
//				// 업로드한 파일명을 문자열로 리턴
//				String filename = uploadFile.getOriginalFilename();
//				System.out.println(filename);
//				
//				user.setUserImg(path+filename);
//				
//				uploadFile.transferTo(new File(path+filename));
//			
//			} catch (IllegalStateException e) {
//				System.out.println("파일업로드 에러 : "+e.getMessage());
//				e.printStackTrace();
//			} catch (IOException e) {
//				System.out.println("파일업로드 에러 : "+e.getMessage());
//				e.printStackTrace();
//			}
//		}
		
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
	
	
	// 회원 탈퇴 이동 (마이페이지)
	@GetMapping(value = "/mypage/delete")
	public String delete() {
	return "/myPage/user_delete";
	}
	
	// 회원 탈퇴 (에러있음)
//	@PostMapping("/mypage/delete")
//	public int drop(@RequestBody UserDTO user, HttpServletRequest req) {
//		HttpSession session = req.getSession();
//		System.out.println("유저 확인"+user);
//		try {
//			userService.withdraw(user);
//
//			session.removeAttribute("login");
//			System.out.println("1"); 
//			session.invalidate();
//			System.out.println("2");
//			return 0;
//		} catch (Exception e) { // 통신오류
//			return -1;
//		}
//	}
	
	@PostMapping("/mypage/delete")
	public String withdraw(UserDTO user, HttpSession session) {
		System.out.println("id, pw 확인 : "+user);
		
		UserDTO findPw = new UserDTO();
		findPw = userService.getUserByPw(user);
		
		if (findPw != null) {
			userService.withdraw(user);
			session.removeAttribute("login");
			session.invalidate();
			return "redirect: /index";
		} else {
			return "redirect: /test.jsp";
		}
	}
	
	// 비밀번호 변경
	@PostMapping("/change_pw")
	public @ResponseBody int changePw(@RequestBody UserDTO user, HttpServletRequest req) {
		System.out.println("비번 번경:"+user);
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
