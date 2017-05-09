package com.mashirong.domain;

import java.util.Date;
import java.util.List;

public class CommentVo {
	private Integer commid;
	
	private Integer shopid;
	
	private Integer userid;
	
	private Integer commParentid;
	
	private Integer score;
	
	private String commcontent;
	
	private String email;
	
	private Date commtime;
	
	public Date getCommtime() {
		return commtime;
	}

	public void setCommtime(Date commtime) {
		this.commtime = commtime;
	}

	private List<CommentVo> list;

	public Integer getCommid() {
		return commid;
	}

	public void setCommid(Integer commid) {
		this.commid = commid;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getCommParentid() {
		return commParentid;
	}

	public void setCommParentid(Integer commParentid) {
		this.commParentid = commParentid;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getCommcontent() {
		return commcontent;
	}

	public void setCommcontent(String commcontent) {
		this.commcontent = commcontent;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<CommentVo> getList() {
		return list;
	}

	public void setList(List<CommentVo> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "CommentVo [commid=" + commid + ", shopid=" + shopid + ", userid=" + userid + ", commParentid="
				+ commParentid + ", score=" + score + ", commcontent=" + commcontent + ", email=" + email + ", list="
				+ list + "]";
	}
}
