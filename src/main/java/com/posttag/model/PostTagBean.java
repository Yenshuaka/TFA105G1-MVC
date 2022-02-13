package com.posttag.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST_TAG")
public class PostTagBean implements Serializable {
	
	@Id
	@Column(name="POST_TAG_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer posttagid;
	
	@Column(name="POST_ID")
	private Integer postid;
	
	@Column(name="TAG_ID")
	private Integer tagid;
	

	@Override
	public String toString() {
		return "PostTagBean [posttagid=" + posttagid + ", postid=" + postid + ", tagid=" + tagid + "]";
	}

	public Integer getPosttagid() {
		return posttagid;
	}

	public void setPosttagid(Integer posttagid) {
		this.posttagid = posttagid;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}
	
	
	

}
