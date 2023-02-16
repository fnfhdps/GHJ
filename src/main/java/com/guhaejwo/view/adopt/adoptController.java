package com.guhaejwo.view.adopt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guhaejwo.biz.adopt.AdoptBlameDTO;
import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;
import com.guhaejwo.biz.adopt.AdoptReqDTO;
import com.guhaejwo.biz.adopt.AdoptService;
import com.guhaejwo.biz.paging.Criteria;
import com.guhaejwo.biz.paging.PageMakerDTO;
import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

@Controller
@RequestMapping("/adopt")
@SessionAttributes({"adoptDetail", "adoptList"})
public class adoptController {

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
		@PathVariable("userSeq") int userSeq, AdoptDTO adopt, ReplyDTO reply, AdoptHeartDTO heart, AdoptBlameDTO blame,  Model model) {
		
		// 게시글 상세 조회
		adopt.setBoardSeq(boardSeq);
		model.addAttribute("adoptDetail", adoptService.getAdoptDetail(adopt));
		
		// 댓글 목록 조회
		reply.setBoardCategory(category);
		reply.setBoardSeq(boardSeq);
		model.addAttribute("replyList", replyService.getReplyList(reply));

		// 좋아요 조회
		heart.setBoardSeq(boardSeq);
		heart.setUserSeq(userSeq);
		model.addAttribute("heart", adoptService.getHeart(heart));
		
	    // 신고 조회
	    blame.setBoardSeq(boardSeq);
		blame.setReq_userSeq(userSeq);
	    model.addAttribute("blame", adoptService.getBlame(blame));
		
		return "adopt/adopt_detail";
	}
	
	// 입양 글 작성 폼으로 이동
	@GetMapping(value = "/new")
	public String newAdopt() {
		return "/adopt/adopt_new";
	}
	
	// 입양 글 입력
	@PostMapping(value = "/new")
	public String insertAdopt(AdoptDTO adopt){
		
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
	@PostMapping(value = "/delete")
	public @ResponseBody Object deleteAdopt(@RequestBody AdoptDTO adopt) {
		try {
			adoptService.deleteBoard(adopt);
			return 0;
		} catch (Exception e) {
			return -1;
		}
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
		System.out.println(adopt);
		System.out.println(num);
		
		String state = null;
		// num이 1이면 wait -> success, 아니면 success -> wait
		try {
			if(num == 1) {
				state = "SUCCESS";
			}
			else {
				state = "WAIT";
			}
			adopt.setAdoptState(state);		
			adoptService.adoptStateUpdate(adopt);
			return 0;
		} catch (Exception e){
			return -1;
		}
	}
	
	// 좋아요 누름
	@PostMapping("/insert/heart")
	public @ResponseBody int insertHeart(@RequestBody AdoptHeartDTO heart) {
		System.out.println(heart);
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
		System.out.println("좋아요 취소");
      
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
	  
//		// 좋아요 조회
//		@GetMapping(value = "/getHeart/{seq1}/{seq2}")
//		public String getHeart(@PathVariable("seq1") int boardSeq, @PathVariable("seq2") int userSeq, AdoptHeartDTO heart, Model model) {
//			System.out.println("boardSeq : " + boardSeq + "userSeq : " + userSeq);
//				
//			heart.setBoardSeq(boardSeq);
//			heart.setUserSeq(userSeq);
////			model.addAttribute("heart", adoptService.getHeart(heart));
//			
//			int heartCnt = adoptService.getHeart(heart);
//			if (heartCnt == 1) {
//				
//			}
//			
//			
//			return "/adopt/adopt_detail";
//		}
	
}
