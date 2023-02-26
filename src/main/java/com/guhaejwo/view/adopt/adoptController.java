package com.guhaejwo.view.adopt;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.guhaejwo.biz.adopt.AdoptBlameDTO;
import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;
import com.guhaejwo.biz.adopt.AdoptReqDTO;
import com.guhaejwo.biz.adopt.AdoptService;
import com.guhaejwo.biz.paging.Criteria;
import com.guhaejwo.biz.paging.PageMakerDTO;
import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

import oracle.net.aso.h;

@Controller
@RequestMapping("/adopt")
@SessionAttributes({"adoptDetail", "adoptList"})
public class adoptController {
	
	@Autowired
	private ServletContext ctx;
	
	private AdoptService adoptService;
	private ReplyService replyService;
	
	@Autowired
	public adoptController(AdoptService adoptService, ReplyService replyService) {
		this.adoptService = adoptService; 
		this.replyService = replyService;
	}
	
	
	// 입양 목록 조회
	/*
	 * @GetMapping(value = "/list") public String getAdoptList(AdoptDTO adopt, Model
	 * model) { model.addAttribute("adoptList", adoptService.getAdoptList(adopt));
	 * return "/adopt/adopt_list"; }
	 */
	
	/* 입양 목록 게시판 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public String getAdoptList(Model model, Criteria cri) {
        System.out.println("getAdoptList");
        
        model.addAttribute("list", adoptService.getAdoptListPaging(cri));
        int total = adoptService.getAdoptTotalCount(cri);
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        System.out.println(pageMake);
        model.addAttribute("pageMaker", pageMake);
        return "/adopt/adopt_list";
    }    
	
	// 입양 목록 상세 조회
	@GetMapping(value = "/detail/{boardCategory}/{boardSeq}/{userSeq}")
	public String getAdoptDetail(@PathVariable("boardCategory") String category, @PathVariable("boardSeq") int boardSeq,
		@PathVariable("userSeq") int userSeq, AdoptDTO adopt, ReplyDTO reply, AdoptHeartDTO heart, AdoptBlameDTO blame,  Model model,
		HttpServletRequest req) {
		
		
		// 게시글 상세 조회
		adopt.setBoardSeq(boardSeq);
		AdoptDTO adoptDetail = adoptService.getAdoptDetail(adopt);
		
		model.addAttribute("adoptDetail", adoptDetail);
		
		// 댓글 목록 조회
		reply.setBoardCategory(category);
		reply.setBoardSeq(boardSeq);
		model.addAttribute("replyList", replyService.getReplyList(reply));

		// 좋아요 조회
//		heart.setBoardSeq(boardSeq);
//		heart.setUserSeq(userSeq);
//		model.addAttribute("heart", adoptService.getHeart(heart));
		
	    // 신고 조회
	    blame.setBoardSeq(boardSeq);
		blame.setReq_userSeq(userSeq);
	    model.addAttribute("blame", adoptService.getBlame(blame));
	    
	    // 조회수 카운트
	    int boardCnt = adoptDetail.getBoardCnt();
	    adopt.setBoardCnt(boardCnt);
	    adoptService.updateBoardCnt(adopt);
		
		return "adopt/adopt_detail";
	}
	
	// 입양 글 작성 폼으로 이동
	@GetMapping(value = "/new")
	public String newAdopt() {
		return "/adopt/adopt_new";
	}
	
	// 입양 글 입력
	@PostMapping(value = "/new")
	public String insertAdopt(@RequestParam MultipartFile[] adoptFiles, AdoptDTO adopt, HttpServletRequest req) throws IllegalStateException, IOException, Exception{
		
		// 파일 업로드 
		for (MultipartFile adoptFile : adoptFiles) {
			
//			String fileName = FilenameUtils.getBaseName(adoptFile.getOriginalFilename()); // 파일이름(확장자명 제외)
			String fileName = adoptFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
			long fileSize = adoptFile.getSize();				// 파일 용량
		
			//서버에 저장할 파일이름의 확장자 명을 구함 (.png 등)
			String fileExtension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
			
			// fileName + fileExtension = 파일명.확장자명
			
			String webPath ="/resources/image/adopt";
			String realPath = ctx.getRealPath(webPath);
			System.out.println("realPath : " + realPath);
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);
			
			String realSaveFileName = uniqueName + fileName;
			System.out.println("realSaveFileName:"+realSaveFileName);
			
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
		        System.out.println(e.getMessage());
		    }
			        
			System.out.println("saveFile : " + saveFile);
			System.out.println("고유 fileName : " + realSaveFileName); // 고유 이름
			System.out.println("저장 경로 + fileName : " + realPath);
			System.out.println("fileSize : " + fileSize);	
			
			adopt.setAdoptImg(realSaveFileName);	// 파일 이름으로 adoptImg set
			}

		adoptService.insertBoard(adopt);
		adoptService.insertAdopt(adopt);
		
		return "redirect:/adopt/list";
	}
	

	// 입양 글 수정
	@GetMapping(value = "/update")
	public String updateAdopt() {
		System.out.println("입양글수정 이동");
		return "/adopt/adopt_update";
	}

	// 입양 글 수정
	@PostMapping(value = "/update")
	public String updateAdopt(AdoptDTO adopt, Model model) {
		int boardSeq = adopt.getBoardSeq();
		int userSeq = adopt.getUserSeq();
		
		adoptService.updateBoard(adopt);
		adoptService.updateAdopt(adopt);
		return "redirect:/adopt/detail/ADOPT/"+boardSeq+"/"+userSeq;
	}
	
	// 입양 글 삭제
	@GetMapping(value = "/delete/{seq}")
	public String deleteAdopt(@PathVariable("seq") int boardSeq) {
		System.out.println("잘 가져옴??"+boardSeq);
		AdoptDTO adopt = new AdoptDTO();
		adopt.setBoardSeq(boardSeq);
		adoptService.deleteBoard(adopt);
		return "redirect:/adopt/list";
	}
	
	// 입양 희망자 신청
	@PostMapping(value = "/hope")
	public String insertAdoptReq(AdoptReqDTO adopt, HttpServletRequest request) {
		adoptService.insertAdoptReq(adopt);
		
		// 이전 주소로 이동
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	// 입양 희망자 중복 체크
	@PostMapping(value = "/hope/check")
	public @ResponseBody Object hopeCheck(@RequestBody AdoptReqDTO adopt) {
		AdoptReqDTO existAdopt;
		existAdopt = adoptService.hopeCheck(adopt);
		try {
			if(existAdopt == null) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			return 9;
		}
	}
	
	// 입양 상태 변경
	@PostMapping(value = "/detail/state/{num}")
	public @ResponseBody Object adoptStateUpdate(@PathVariable("num") int num, @RequestBody AdoptDTO adopt) {
		String state = null;

		// num이 0이면 wait -> success, 1이면 success -> wait
		try {
			if(num == 1) {
				state = "WAIT";
			}
			else if(num == 0){
				state = "SUCCESS";
			}
			adopt.setAdoptState(state);		
			adoptService.adoptStateUpdate(adopt);
			return num;
		} catch (Exception e){
			return -1;
		}
	}
	
	// 좋아요 조회
	@GetMapping("/heart")
	public @ResponseBody int heart(AdoptHeartDTO heart, Model model) {
		int heartCnt = -1;
		
		try {
			heartCnt = adoptService.getHeart(heart);
			System.out.println("하트 카운드 : "+heartCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return heartCnt;
	}
	
	// 좋아요 누름
	@PostMapping("/insert/heart")
	public @ResponseBody int insertHeart(@RequestBody AdoptHeartDTO heart) {
		try {
	         adoptService.insertHeart(heart);
	         return 0;
	      } catch (Exception e) {
	         return -1;
	      }
	   }

	// 좋아요 취소
	@PostMapping("/delete/heart")
	public @ResponseBody int deleteHeart(@RequestBody AdoptHeartDTO heart) {
		try {
			adoptService.deleteHeart(heart);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	   
	// 신고 내용 작성 창으로 이동
	@GetMapping(value = "/insert/blaContent/{boardSeq}/{res_userSeq}/{req_userSeq}")
	public String newBlame(@PathVariable("boardSeq") int boardSeq, @PathVariable("res_userSeq") int res_userSeq, @PathVariable("req_userSeq") int req_userSeq, Model model) {

		AdoptBlameDTO blame = new AdoptBlameDTO();

		blame.setBoardSeq(boardSeq);
		blame.setRes_userSeq(res_userSeq);
		blame.setReq_userSeq(req_userSeq);
		model.addAttribute("blaSeq", blame);
		return "/adopt/adoptBlameAction";

	}

	// 신고 글 입력
	@PostMapping("/insert/blaContent")
	public String insertBlaContent(AdoptBlameDTO blame) {
		adoptService.insertBlame(blame);

		int boardSeq = blame.getBoardSeq();
		int userSeq = blame.getReq_userSeq();

		return "redirect:/adopt/detail/ADOPT/" + boardSeq + "/" + userSeq;
	}

	// 신고 삭제 (관리자 페이지)
	@PostMapping("/delete/blame")
	public @ResponseBody int deleteBlame(@RequestBody AdoptBlameDTO blame) {
		System.out.println("신고 취소");
		
		try {
			adoptService.deleteBlame(blame);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
}
