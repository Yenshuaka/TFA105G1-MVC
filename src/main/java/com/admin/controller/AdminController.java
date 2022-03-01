package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.model.AdminService;
import com.admin.model.AdminVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/adminManagement")
	public String name(String action, HttpSession session, AdminVO admin, Model model, String empno) {

		if (empno != null && empno != "") {

			AdminVO admin1 = new AdminVO();
			admin1.setEmpno(Integer.valueOf(empno));
			List<AdminVO> list = adminService.select(admin1);
			model.addAttribute("list", list);
			return "backstage/product/productmanage1";
		} else if (action == null) { // 這是select全部的狀況
			List<AdminVO> list = adminService.select(null);
			model.addAttribute("list", list);
			return "backstage/product/productmanage1";
		}

		return "";
	}
}
