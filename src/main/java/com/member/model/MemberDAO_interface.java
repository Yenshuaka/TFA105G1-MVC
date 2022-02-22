package com.member.model;

import java.io.BufferedInputStream;
import java.util.List;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);

	public void update(MemberVO memberVO);

	public void delete(Integer memberid);

	public MemberVO findByPrimaryKey(Integer memberid);

	public List<MemberVO> getAll();
	
	public void upload(MemberVO memberVO);
	
	public byte[] read(Integer memberid);
	
	public Integer login(MemberVO memberVO);
	//萬用複合查詢(傳入參數型態Map)(回傳 List)
//	public List<EmpVO> getAll(Map<String, String[]> map); 
}
