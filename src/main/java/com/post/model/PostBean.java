package com.post.model;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST")
public class PostBean implements Serializable{
	
	@Id
	@Column(name="POST_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postid;
	
	@Column(name="MEMBER_ID")
	private Integer memberid;
	
	@Column(name="POST_TITLE")
	private String posttitle;
	
	@Column(name="POST_TYPE_ID")
	private Integer posttypeid;
	
	@Column(name="POST_CONTENT", columnDefinition = "LONGTEXT")
	private String postcontent;
	
	@Column(name="POST_TIME")
	private java.sql.Timestamp posttime;
	
	@Column(name="POST_STATUS", insertable = false, updatable = false)
	private Integer poststatus;
	
	@Column(name="POST_REWARD_POINTS", insertable = false, updatable = false)
	private Integer postrewardpoints;
	
	@Column(name="POST_PICTURE", insertable = false, updatable = false, columnDefinition="longblob")
	private byte[] postpicture;
	

	@Override
	public String toString() {
		return "PostBean [postid=" + postid + ", memberid=" + memberid + ", posttitle=" + posttitle + ", posttypeid="
				+ posttypeid + ", postcontent=" + postcontent + ", posttime=" + posttime + ", poststatus=" + poststatus
				+ ", postrewardpoints=" + postrewardpoints +  "]";
		//", postpicture=" + Arrays.toString(postpicture) +
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

	public String getPosttitle() {
		return posttitle;
	}

	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}

	public Integer getPosttypeid() {
		return posttypeid;
	}

	public void setPosttypeid(Integer posttypeid) {
		this.posttypeid = posttypeid;
	}

	public String getPostcontent() {
		return postcontent;
	}

	public void setPostcontent(String postcontent) {
		this.postcontent = postcontent;
	}

	public java.sql.Timestamp getPosttime() {
		return posttime;
	}

	public void setPosttime(java.sql.Timestamp posttime) {
		this.posttime = posttime;
	}

	public Integer getPoststatus() {
		return poststatus;
	}

	public void setPoststatus(Integer poststatus) {
		this.poststatus = poststatus;
	}

	public Integer getPostrewardpoints() {
		return postrewardpoints;
	}

	public void setPostrewardpoints(Integer postrewardpoints) {
		this.postrewardpoints = postrewardpoints;
	}

	public byte[] getPostpicture() {
		return postpicture;
	}

	public void setPostpicture(byte[] postpicture) {
		this.postpicture = postpicture;
	}
	
	
	
	
	
}
