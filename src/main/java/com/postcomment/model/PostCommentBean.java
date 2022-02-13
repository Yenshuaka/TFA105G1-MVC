package com.postcomment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "POST_COMMENT")
public class PostCommentBean implements Serializable {
	
	@Id
	@Column(name="COMMENT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentid;
	
	@Column(name="MEMBER_ID")
	private Integer memberid;
	
	@Column(name="POST_ID")
	private Integer postid;
	
	@Column(name="COMMENT_CONTENT")
	private String commentcontent;
	
	@Column(name="COMMENT_TIME", insertable = false)
	private java.sql.Timestamp commenttime;
	
	

	@Override
	public String toString() {
		return "PostCommentBean [commentid=" + commentid + ", memberid=" + memberid + ", postid=" + postid
				+ ", commentcontent=" + commentcontent + ", commenttime=" + commenttime + "]";
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

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public java.sql.Timestamp getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(java.sql.Timestamp commenttime) {
		this.commenttime = commenttime;
	}
	
	

}
