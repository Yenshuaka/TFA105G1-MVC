package com.postgoodrecord.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST_GOOD_RECORD")
public class PostGoodRecordBean implements Serializable {
	
	@Id
	@Column(name="RECORD_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer recordid;
	
	@Column(name="MEMBER_ID")
	private Integer memberid;
	
	@Column(name="POST_ID")
	private Integer postid;
	
	@Column(name="GOOD_STATUS")
	private Boolean goodstatus;
	
	@Override
	public String toString() {
		return "PostGoodRecordBean [recordid=" + recordid + ", memberid=" + memberid + ", postid=" + postid
				+ ", goodstatus=" + goodstatus + "]";
	}

	public Integer getRecordid() {
		return recordid;
	}

	public void setRecordid(Integer recordid) {
		this.recordid = recordid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public Boolean getGoodstatus() {
		return goodstatus;
	}

	public void setGoodstatus(Boolean goodstatus) {
		this.goodstatus = goodstatus;
	}

	

	
	
}
