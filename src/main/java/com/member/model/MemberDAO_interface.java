package com.member.model;

import java.util.List;

public interface MemberDAO_interface {	
	// insert
	public void insert(MemberVO memberVO);	
	
	// delete
	public void delete(Integer memberid);
	
	// update	
	public void update(MemberVO memberVO);
	
	public void uploadPic(MemberVO memberVO);	
	
	// query	
	public MemberVO findByPrimaryKey(Integer memberid);
	
	public List<MemberVO> getAll();
	
	public MemberVO login(String email, String password);
}
