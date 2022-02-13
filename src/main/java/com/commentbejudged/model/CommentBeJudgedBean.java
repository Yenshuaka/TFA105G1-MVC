package com.commentbejudged.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "COMMENT_BE_JUDGED")
public class CommentBeJudgedBean implements Serializable {

	@Id
	@Column(name="COMMENT_BE_JUDGED_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentbejudgedid;
	
	@Column(name="COMMENT_ID")
	private Integer commentid;
	
	@Column(name="MEMBER_ID")
	private Integer memberid;
	
	@Column(name="COMMENT_BE_JUDGED_REASON")
	private String commentbejudgedreason;

	@Override
	public String toString() {
		return "CommentBeJudgedBean [commentbejudgedid=" + commentbejudgedid + ", commentid=" + commentid
				+ ", memberid=" + memberid + ", commentbejudgedreason=" + commentbejudgedreason + "]";
	}

	public Integer getCommentbejudgedid() {
		return commentbejudgedid;
	}

	public void setCommentbejudgedid(Integer commentbejudgedid) {
		this.commentbejudgedid = commentbejudgedid;
	}

	public Integer getCommentid() {
		return commentid;
	}

	public void setCommentid(Integer commentid) {
		this.commentid = commentid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getCommentbejudgedreason() {
		return commentbejudgedreason;
	}

	public void setCommentbejudgedreason(String commentbejudgedreason) {
		this.commentbejudgedreason = commentbejudgedreason;
	}
	
	
	
	
}
