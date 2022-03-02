package com.admin.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.model.AdminService;
import com.admin.model.AdminVO;

@Controller
@Scope("session")
@RequestMapping("/adminManagement")
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping(method = { RequestMethod.POST })
	public String login(String action, HttpSession session, AdminVO admin, Model model, String account,
			String password) {

		if ("login".equals(action)) {

			Map<String, String> errorMsgs = new HashMap<String, String>();
			model.addAttribute("errorMsgs", errorMsgs);

			String accountReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{1,20}$";
			if (account == null || account.trim().length() == 0) {
				errorMsgs.put("account", "帳號: 請勿空白");
			} else if (!account.trim().matches(accountReg)) {
				errorMsgs.put("account", "帳號: 請輸入英文字母、數字");
			}

			String pwdReg = "^([A-Za-z0-9]){1,20}$";
			if (password == null || password.trim().length() == 0) {
				errorMsgs.put("account", "密碼: 請勿空白");
			} else if (!password.trim().matches(pwdReg)) {
				errorMsgs.put("account", "密碼: 請輸入英文字母、數字 且1~20個字");
			}

//			if (errorMsgs != null && !!errorMsgs.isEmpty()) {
//				System.out.println(errorMsgs);
//				return "/download/BS-login.jsp";
//			}

			admin.setAccount(account);
			admin.setPassword(password);

			AdminVO adminVO = adminService.loginAdmin(admin);
			session.setAttribute("adminVO", adminVO);
			return "backstage/BS-index";
		}
		return null;
	}

	@RequestMapping(method = { RequestMethod.GET })
	public String logout(String action, HttpSession session) {
		if ("logout".equals(action)) {
			session.removeAttribute("memberid");
			session.invalidate();
			System.out.println("Admin session 已清空!");
			return "redirect:/download/BS-login.jsp";
		}
		return null;
	}
	
}
