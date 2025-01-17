package com.proj.my.member.vo;

public class MemberVO {
	
	private String memId;
	private String memPw;
	private String memName;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemNm(String memName) {
		this.memName = memName;
	}

	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memName + "]";
	}
	
	

}
