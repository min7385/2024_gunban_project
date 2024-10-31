package com.proj.my.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.board.dao.IBoardDAO;
import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;

@Service
public class BoardService {
	
	@Autowired
	IBoardDAO dao;
	
	public List<BoardVO> getBoardList(){
		
		List<BoardVO> result = dao.getBoardList();
		
		return result;
		
	}
	
	public void writeBoard(BoardVO board) throws Exception{
		int result = dao.writeBoard(board);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	public BoardVO getBoard(int boardNo) throws Exception{
		BoardVO result = dao.getBoard(boardNo);
		
		if(result == null) {
			throw new Exception("게시물이 존재하지 않습니다");
		}
		
		return result;
	}
	
	// 게시판 업데이트
	public void updateBoard(BoardVO board) throws Exception{
		int result = dao.updateBoard(board);
		
		if(result == 0) {
			throw new Exception();
		}
	}
	
	
	// 게시판 삭제
	public void deleteBoard(int boardNo) throws Exception{
		int result = dao.deleteBoard(boardNo);
		
		if(result == 0) {
			throw new Exception();
		}
	}
	
	// 댓글 작성
	public int writeReply(ReplyVO reply) throws Exception{
		int result = dao.writeReply(reply);
		
		if(result == 0) {
			throw new Exception();
		}
		return result;
	}
	// 댓글 조회
	public ReplyVO getReply(String replyNo) throws Exception{
		ReplyVO result = dao.getReply(replyNo);
		
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	
	// 댓글 전체 조회
	public List<ReplyVO> getReplyList(int boardNo){
		List<ReplyVO> result = dao.getReplyList(boardNo);
		return result;
	}
	
	// 댓글 삭제
	public void delReply(String replyNo) throws Exception{
		int result = dao.delReply(replyNo);
		
		if(result == 0) {
			throw new Exception();
		}
	}
	
	
}
