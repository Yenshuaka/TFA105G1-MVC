package com.postbejudged.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST_BE_JUDGED")
public class PostBeJudgedBean implements Serializable {
	
	@Id
	@Column(name="POST_BE_JUDGED_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postbejudgedid;
	
	@Column(name="POST_ID")
	private Integer postid;
	
	@Column(name="MEMBER_ID")
	private Integer memberid;
	
	@Column(name="POST_BE_JUDGED_REASON")
	private String postbejudgedreason;
	
	@Override
	public String toString() {
		return "PostBeJudgedBean [postbejudgedid=" + postbejudgedid + ", postid=" + postid + ", memberid=" + memberid
				+ ", postbejudgedreason=" + postbejudgedreason + "]";
	}

	public Integer getPostbejudgedid() {
		return postbejudgedid;
	}

	public void setPostbejudgedid(Integer postbejudgedid) {
		this.postbejudgedid = postbejudgedid;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getPostbejudgedreason() {
		return postbejudgedreason;
	}

	public void setPostbejudgedreason(String postbejudgedreason) {
		this.postbejudgedreason = postbejudgedreason;
	}
	
	

}
