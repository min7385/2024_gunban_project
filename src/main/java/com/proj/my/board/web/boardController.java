package com.proj.my.board.web;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.my.board.service.BoardService;
import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;
import com.proj.my.member.vo.MemberVO;


@Controller
public class boardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardView")
	public String boardView(Model model, HttpSession session) {
		
		List<BoardVO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "board/boardView";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		if(session.getAttribute("login") == null) {
			return "member/loginView";
		}
		return "board/boardWriteView";
	}
	
	@RequestMapping("/boardWriteDo")
	public String boardWriteDo(BoardVO board, HttpSession session) throws Exception{
		MemberVO login = (MemberVO) session.getAttribute("login");
		board.setMemId(login.getMemId());
		
		boardService.writeBoard(board);
		
		return "redirect:/boardView";
	}
	
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) throws Exception {
		
		BoardVO board = boardService.getBoard(boardNo);
		List<ReplyVO> replyList = boardService.getReplyList(boardNo);
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
//		model.addAttribute("replyList", null);
		
		return "board/boardDetailView";
	}
	
	// 글 수정 화면을 요청하는 URL에 대한 메소드
	@RequestMapping(value="/boardEditView", method=RequestMethod.POST)
	public String boardEditView(int boardNo, Model model) throws Exception{
		
		BoardVO board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		
		System.out.println("보드 컨트롤러" + board);
		
		return "board/boardEditView";
	}
	
	// 글 수정(update)을 요청하는 URL에 대한 메소드
	
	@PostMapping("/boardEditDo")
	public String boardEditDo(BoardVO board) throws Exception{
		
		boardService.updateBoard(board);
		
		return "redirect:/boardView";
	}
	
	// 글 삭제
	@PostMapping("/boardDelDo")
	public String boardDelDo(int boardNo) throws Exception{
		
		boardService.deleteBoard(boardNo);
		
		return "redirect:/boardView";
	}
	
	@ResponseBody
	@PostMapping("/writeRepleDo")
	public ReplyVO boardRepleDo(@RequestBody ReplyVO reply) throws Exception{
		System.out.println(reply);
		// 유니크 아이디 생성
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqueId = sdf.format(date);
		for(int i=0; i<3; i++) {
			int randNum = (int)(Math.random()*10);
			uniqueId += randNum;
		}
		System.out.println(uniqueId);
		reply.setReplyNo(uniqueId);
		boardService.writeReply(reply);
		ReplyVO result = boardService.getReply(uniqueId);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delRepleDo")
	public String delRepleDo(@RequestBody ReplyVO reply) throws Exception{
		System.out.println(reply);
		String result = "fail";
		
		boardService.delReply(reply.getReplyNo());
		
		result = "success";
		
		return result;
	}
	
	
	

}
