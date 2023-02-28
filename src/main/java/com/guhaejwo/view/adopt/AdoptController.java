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
import com.guhaejwo.biz.board.Category;
import com.guhaejwo.biz.paging.Criteria;
import com.guhaejwo.biz.paging.PageMakerDTO;
import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

import oracle.net.aso.h;

@Controller
@RequestMapping("/adopt")
@SessionAttributes({"adoptDetail", "adoptList"})
public class AdoptController {
	
	private final AdoptService adoptService;
	private final ReplyService replyService;
	private final ServletContext ctx;
	
	@Autowired
	public AdoptController(AdoptService adoptService, ReplyService replyService, ServletContext ctx) {
		this.adoptService = adoptService; 
		this.replyService = replyService;
		this.ctx = ctx;
	}

	/* 입양 목록 게시판 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public String getAdoptList(Model model, Criteria cri) throws Exception {
    	
    	model.addAttribute("list", adoptService.getAdoptListPaging(cri));

        int total = adoptService.getAdoptTotalCount(cri);
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
        return "/adopt/adopt_list";
    }    
	
	// 입양 목록 상세 조회
	@GetMapping(value = "/detail/{boardCategory}/{boardSeq}/{userSeq}")
	public String getAdoptDetail(@PathVariable("boardCategory") String category, @PathVariable("boardSeq") int boardSeq,
		@PathVariable("userSeq") int userSeq, AdoptDTO adopt, ReplyDTO reply, AdoptHeartDTO heart, AdoptBlameDTO blame,  Model model,
		HttpServletRequest req) throws Exception {
		
		// 게시글 상세 조회
		adopt.setBoardSeq(boardSeq);
		AdoptDTO adoptDetail = adoptService.getAdoptDetail(adopt);
		
		model.addAttribute("adoptDetail", adoptDetail);
		
		// 댓글 목록 조회
		reply.setBoardCategory(category);
		reply.setBoardSeq(boardSeq);
		model.addAttribute("replyList", replyService.getReplyList(reply));

	    // 신고 조회
	    blame.setBoardSeq(boardSeq);
		blame.setReq_userSeq(userSeq);
	    model.addAttribute("blame", adoptService.getBlame(blame));
	    
	    // 조회수 카운트
//	    int boardCnt = adoptDetail.getBoardCnt();
//	    adopt.setBoardCnt(boardCnt);
	    adoptService.updateBoardCnt(adoptDetail);
		
		return "adopt/adopt_detail";
	}
	
	// 입양 글 작성 폼으로 이동
	@GetMapping(value = "/new")
	public String newAdopt() {
		return "/adopt/adopt_new";
	}
	
	// 입양 글 입력
	@PostMapping(value = "/new")
	public String insertAdopt(@RequestParam MultipartFile[] adoptFiles, AdoptDTO adopt) throws IllegalStateException, IOException, Exception{
		
		// 파일 업로드 
		for (MultipartFile adoptFile : adoptFiles) {
			
			String fileName = adoptFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
			//long fileSize = adoptFile.getSize();				// 파일 용량
			//서버에 저장할 파일이름의 확장자 명을 구함 (.png 등)
			String fileExtension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
			String webPath ="/resources/image/adopt";
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
			adopt.setAdoptImg(realSaveFileName);	// 파일 이름으로 adoptImg set
		}

		adopt.setAdoptState("WAIT");
		adopt.setBoardCategory("ADOPT");
		
		adoptService.insertBoard(adopt);
		adoptService.insertAdopt(adopt);
		
		return "redirect:/adopt/list";
	}

	// 입양 글 수정
	@GetMapping(value = "/update")
	public String updateAdopt() {
		return "/adopt/adopt_update";
	}

	// 입양 글 수정
	@PostMapping(value = "/update")
	public String updateAdopt(@RequestParam MultipartFile[] adoptFiles, AdoptDTO adopt, Model model) throws IllegalStateException, IOException, Exception {
		
		// 파일 업로드 
		for (MultipartFile adoptFile : adoptFiles) {
			
			String fileName = adoptFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
			//long fileSize = adoptFile.getSize();				// 파일 용량
			//서버에 저장할 파일이름의 확장자 명을 구함 (.png 등)
			String fileExtension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
			String webPath ="/resources/image/adopt";
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
			adopt.setAdoptImg(realSaveFileName);	// 파일 이름으로 adoptImg set
		}
		
		adoptService.updateBoard(adopt);
		adoptService.updateAdopt(adopt);

		int boardSeq = adopt.getBoardSeq();
		int userSeq = adopt.getUserSeq();
		return "redirect:/adopt/detail/ADOPT/"+boardSeq+"/"+userSeq;
	}
	
	// 입양 글 삭제
	@GetMapping(value = "/delete/{seq}")
	public String deleteAdopt(@PathVariable("seq") int boardSeq) throws Exception {
		System.out.println("잘 가져옴??"+boardSeq);
		AdoptDTO adopt = new AdoptDTO();
		adopt.setBoardSeq(boardSeq);
		adoptService.deleteBoard(adopt);
		return "redirect:/adopt/list";
	}
	
	// 입양 신청 중복 체크
	@PostMapping(value = "/hope/check")
	public @ResponseBody Object hopeCheck(@RequestBody AdoptReqDTO adopt) throws Exception {
		AdoptReqDTO existAdopt;
		existAdopt = adoptService.hopeCheck(adopt);
		try {
			if(existAdopt == null) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// 입양 신청
	@PostMapping(value = "/hope")
	public @ResponseBody int insertAdoptReq(@RequestBody AdoptReqDTO adopt, HttpServletRequest request) throws Exception {
		try {
			adoptService.insertAdoptReq(adopt);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		// 이전 주소로 이동
//		String referer = request.getHeader("Referer");
//		return "redirect:"+referer;
	}
	
	// 입양 상태 변경
	@PostMapping(value = "/detail/state/{num}")
	public @ResponseBody Object adoptStateUpdate(@PathVariable("num") int num, @RequestBody AdoptDTO adopt) throws Exception {
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
			e.printStackTrace();
			return -1;
		}
	}
	
	// 좋아요 조회
	@GetMapping("/heart")
	public @ResponseBody int heart(AdoptHeartDTO heart, Model model) throws Exception {
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
	public @ResponseBody int insertHeart(@RequestBody AdoptHeartDTO heart) throws Exception {
		try {
	         adoptService.insertHeart(heart);
	         return 0;
	      } catch (Exception e) {
	         return -1;
	      }
	   }

	// 좋아요 취소
	@PostMapping("/delete/heart")
	public @ResponseBody int deleteHeart(@RequestBody AdoptHeartDTO heart) throws Exception {
		try {
			adoptService.deleteHeart(heart);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	   
	// 신고 내용 작성 창으로 이동
	@GetMapping(value = "/insert/blaContent/{boardSeq}/{res_userSeq}/{req_userSeq}")
	public String newBlame(@PathVariable("boardSeq") int boardSeq, @PathVariable("res_userSeq") int res_userSeq,
			@PathVariable("req_userSeq") int req_userSeq, Model model) throws Exception {

		AdoptBlameDTO blame = new AdoptBlameDTO();

		blame.setBoardSeq(boardSeq);
		blame.setRes_userSeq(res_userSeq);
		blame.setReq_userSeq(req_userSeq);
		model.addAttribute("blaSeq", blame);
		return "/adopt/adoptBlameAction";

	}

	// 신고 글 입력
	@PostMapping("/insert/blaContent")
	public String insertBlaContent(AdoptBlameDTO blame) throws Exception {
		adoptService.insertBlame(blame);

		int boardSeq = blame.getBoardSeq();
		int userSeq = blame.getReq_userSeq();

		return "redirect:/adopt/detail/ADOPT/" + boardSeq + "/" + userSeq;
	}

	// 신고 삭제 (관리자 페이지)
	@PostMapping("/delete/blame")
	public @ResponseBody int deleteBlame(@RequestBody AdoptBlameDTO blame) throws Exception {
		System.out.println("신고 취소");
		
		try {
			adoptService.deleteBlame(blame);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
}
