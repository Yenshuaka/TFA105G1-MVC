package com.member.model;

import java.io.BufferedInputStream;
import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVO addMember(String email, String password, String firstname, String lastname, String idno,
			String gender, java.sql.Date dateofbirth, String country, String phone, String nickname, String selfintro) {

		MemberVO memberVO = new MemberVO();

		memberVO.setEmail(email);
		memberVO.setPassword(password);
		memberVO.setFirstname(firstname);
		memberVO.setLastname(lastname);
		memberVO.setIdno(idno);
		memberVO.setGender(gender);
		memberVO.setDateofbirth(dateofbirth);
		memberVO.setCountry(country);
		memberVO.setPhone(phone);
		memberVO.setNickname(nickname);
		memberVO.setSelfintro(selfintro);
		dao.insert(memberVO);

		return memberVO;
	}

	public MemberVO updateMember(Integer memberid, String lastname, String firstname, String idno, String gender,
			java.sql.Date dateofbirth, String country, String phone) {

		MemberVO memberVO = new MemberVO();
		memberVO.setMemberid(memberid);
		memberVO.setLastname(lastname);
		memberVO.setFirstname(firstname);
		memberVO.setIdno(idno);
		memberVO.setGender(gender);
		memberVO.setDateofbirth(dateofbirth);
		memberVO.setCountry(country);
		memberVO.setPhone(phone);
		dao.update(memberVO);

		return memberVO;
	}

	public void deleteMember(Integer memberid) {
		dao.delete(memberid);
	}

	public MemberVO getOneMember(Integer memberid) {
		return dao.findByPrimaryKey(memberid);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}

	public MemberVO uploadPic(Integer memberid, byte[] buf) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberid(memberid);
		memberVO.setAvatar(buf);
		dao.upload(memberVO);

		return memberVO;
	}
	public byte[] readPic(Integer memberid) {
		return dao.read(memberid);
	}
}
