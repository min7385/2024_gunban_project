package com.proj.my.board.vo;

public class ReplyVO {
	
    private int boardNo;
    private String replyNo;
    private String memId;
    private String memName;
    private String replyContent;
    private String useYn;
    private String replyDate;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [boardNo=" + boardNo + ", replyNo=" + replyNo + ", memId=" + memId + ", memName=" + memName
				+ ", replyContent=" + replyContent + ", useYn=" + useYn + ", replyDate=" + replyDate + "]";
	}
    
    
    
   
}
