package com.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@PostMapping("/login")
	public String login(String action, HttpSession session, AdminVO admin, Model model, String account, String password,
			HttpServletRequest req) {

		if ("login".equals(action)) {

			Map<String, String> errorMsgs = new HashMap<String, String>();
			model.addAttribute("errorMsgs", errorMsgs);

			String accountReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
			if (account == null || account.trim().length() == 0) {
				errorMsgs.put("account", "帳號: 請勿空白");
			} else if (!account.trim().matches(accountReg)) {
				errorMsgs.put("account", "帳號: 請輸入英文字母、數字 且1~10個字");
			}

			String pwdReg = "^([A-Za-z0-9]){1,20}$";
			if (password == null || password.trim().length() == 0) {
				errorMsgs.put("password", "密碼: 請勿空白");
			} else if (!password.trim().matches(pwdReg)) {
				errorMsgs.put("password", "密碼: 請輸入英文字母、數字 且1~20個字");
			}

			if (errorMsgs != null && !errorMsgs.isEmpty()) {
				System.out.println(errorMsgs);
				return "forward:/download/BS-login.jsp";
			}

			admin.setAccount(account);
			admin.setPassword(password);

			AdminVO adminVO = adminService.loginAdmin(admin);
			if (adminVO != null) {
				session.setAttribute("adminVO", adminVO);
				return "redirect:/MVC/adminManagement/Index";
			} else {
				errorMsgs.put("result", "帳號密碼錯誤! 請重新輸入");
				System.out.println("帳號密碼錯");
			}

			if (errorMsgs != null && !errorMsgs.isEmpty()) {
				System.out.println(errorMsgs);
				return "forward:/download/BS-login.jsp";
			}

		}
		return null;
	}

	@GetMapping("/Index")
	public String BSindex() {
		return "backstage/BS-index";
	}

	@GetMapping("/AdminManage")
	public String AdminManage(Model model) {
		List<AdminVO> list = adminService.selectAll();
		model.addAttribute("AdminList", list);
		return "backstage/admin/BS-admin_manage";
	}	
	
	@RequestMapping(method = { RequestMethod.GET })
	public String logout(String action, HttpSession session) {
		if ("logout".equals(action)) {
			session.removeAttribute("memberid");
			session.invalidate();
			System.out.println("Admin session 已清空");
			return "redirect:/download/BS-login.jsp";
		}
		return null;
	}

}
