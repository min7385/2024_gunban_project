package com.proj.my.board.vo;

public class ReplyVO {
	private String replyNo;
	private int boardNo;
	private String replyContent;
	private String memId;
	private String memNm;
	private String replyDate;
	
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyContent=" + replyContent + ", memId="
				+ memId + ", memNm=" + memNm + ", replyDate=" + replyDate + "]";
	}

	
	
}
