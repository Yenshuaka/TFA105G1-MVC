package com.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.member.model.GenerateAlphaNumericString;
import com.member.model.MemberService;
import com.order.order.MailService;

import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("/MemberInfo")
public class MemberForPWD {

	@PostMapping("/PwdForget")
	public String PwdForget(String FGaction, String FGemail, GenerateAlphaNumericString AlphaNumericString,
			MemberService memberService, MailService mailService, HttpServletRequest req, HttpSession session) {
		String email = FGemail.trim();
		if ("forgotPWD".equals(FGaction)) {
			Map<String, String> errorCheck = new HashMap<String, String>();
			session.setAttribute("errorCheck", errorCheck);
			
			int expireTime = 1;

			// check email exit
			Integer memberid = null;
			try {
				memberid = memberService.checkEmail(email);
			} catch (Exception e1) {
				e1.printStackTrace();
				System.out.println("查無此email");
				errorCheck.put("checkEmail", "alert(\'查無此email 請重新輸入');");
			}
			
			if (errorCheck != null && !errorCheck.isEmpty()) {
				System.out.println(errorCheck);
				return "forward:/download/FS-login.jsp";
			}
			
			System.out.println("memberid : " + memberid);

			// Generate temp PWD
			String temPWD = AlphaNumericString.getRandomString(10);

			// Redis connection
			try (Jedis jedis = new Jedis("localhost", 6379);) {
				System.out.println("redis ping! ~ " + jedis.ping());

				jedis.setex(email, expireTime * 86400, temPWD);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// Email

			String messageText = 
					"Hello! " + email + " 請謹記此密碼: " + temPWD + "\n" 
				  + " (注意事項 !!)" + "\n" 
				  + "請在" + expireTime + "天內點擊連結，否則失效! " + "\n";
			
			String suffixUrl = "/TFA105G1-MVC/MVC/MemberInfo/return?reAction=forgotPWD&mail=" + email + 
					"&No=" + memberid + "&temPWD=" + temPWD;
			StringBuffer SBUrl = new StringBuffer(suffixUrl);			
			SBUrl.insert(0, req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort());
			
			String wholeUrl = SBUrl.toString();
			
			mailService.sendMail(FGemail, "忘記密碼通知", messageText + wholeUrl);
			System.out.println("驗證信已寄出!");
			return "redirect:/download/FS-login.jsp";
		}
		return "";
	}

	@GetMapping("/return")
	public String returnURL(String reAction, String No, String temPWD, String mail, MemberService memberService) {

		if ("forgotPWD".equals(reAction)) {
			System.out.println("驗證連結接收!");
			System.out.println("memberid :" + No);
			System.out.println("驗證碼 :" + temPWD);
			String receivePWD = temPWD.trim();
			String userTempPWD = null;

			// 驗證redis 驗證碼
			try (Jedis jedis = new Jedis("localhost", 6379);) {
				System.out.println("redis驗證 ping! ~ " + jedis.ping());

				userTempPWD = jedis.get(mail);

				if (userTempPWD == null) {
					System.out.println("Email驗證失敗!");
					return "";
				} else {
					jedis.del(mail);
					System.out.println("redis 清除Email!");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 更新舊密碼為新密碼
			if (receivePWD.equals(userTempPWD)) {
				System.out.println("驗證碼正確!");
				Integer memberid = Integer.valueOf(No);
				memberService.changePWD(memberid, temPWD);

				return "redirect:/download/FS-login.jsp";
			}
		}
		return "";
	}

}
