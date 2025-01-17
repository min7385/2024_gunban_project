package com.proj.my.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;

@Mapper
public interface IBoardDAO {
	
	public List<BoardVO> getBoardList();
	public int writeBoard(BoardVO board);
	public BoardVO getBoard(int boardNo);
	
	public int updateBoard(BoardVO board);
	public int deleteBoard(int boardNo);
	
	// 댓글 작성
	public int writeReply(ReplyVO reply);
	// 댓글 조회
	public ReplyVO getReply(String replyNo);
	// 댓글 전체 조회
	public List<ReplyVO> getReplyList(int boardNo);
	// 댓글 삭제
	public int delReply(String replyNo);
	
}
