package com.tag.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TAG")
public class TagBean implements Serializable {

	@Id
	@Column(name="TAG_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tagid;
	
	@Column(name="TAG_NAME")
	private String tagname;
	
	
	@Override
	public String toString() {
		return "TagBean [tagid=" + tagid + ", tagname=" + tagname + "]";
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
}
