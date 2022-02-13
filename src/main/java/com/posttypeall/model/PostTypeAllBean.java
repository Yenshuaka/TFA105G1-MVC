package com.posttypeall.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST_TYPE_ALL")
public class PostTypeAllBean implements Serializable {
	
	@Id
	@Column(name="POST_TYPE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer posttypeid;
	
	@Column(name="POST_TYPE_NAME")
	private String posttypename;
	
	@Column(name="TYPE_COUNT")
	private Integer typecount;

	public Integer getPosttypeid() {
		return posttypeid;
	}
	
	@Override
	public String toString() {
		return "PostTypeAllBean [posttypeid=" + posttypeid + ", posttypename=" + posttypename + ", typecount="
				+ typecount + "]";
	}




	public void setPosttypeid(Integer posttypeid) {
		this.posttypeid = posttypeid;
	}

	public String getPosttypename() {
		return posttypename;
	}

	public void setPosttypename(String posttypename) {
		this.posttypename = posttypename;
	}

	public Integer getTypecount() {
		return typecount;
	}

	public void setTypecount(Integer typecount) {
		this.typecount = typecount;
	}
	

	
	

}
