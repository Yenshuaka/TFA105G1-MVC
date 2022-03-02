package com.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/MemberDispacher")
public class MemberBSDispacher {

	@RequestMapping("/MemberManage")
	public String memberManage() {
		return "backstage/member/BS-member_manage";
	}
	
	@RequestMapping("/AddMember")
	public String AddMember() {
		return "backstage/member/BS-add-member";
	}
	
	@RequestMapping("/EditMember")
	public String EditMember() {
		return "backstage/member/BS-edit-member";
	}
	
	@RequestMapping("/ListOneMember")
	public String ListOneMember() {
		return "backstage/member/BS-listOneMember";
	}
	
	@RequestMapping(value = "/MemberUpdatePic", method=RequestMethod.GET)
	public String MemberUpdatePic(HttpServletRequest req , Model model) {
		String action = req.getParameter("action");
		Integer memberid = Integer.valueOf(req.getParameter("memberid"));
		model.addAttribute("action", action);
		model.addAttribute("memberid", memberid);
		
		return "backstage/member/BS-update-image";
	}
	
}
