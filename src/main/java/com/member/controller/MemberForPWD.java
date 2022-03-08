package com.member.controller;

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
			MemberService memberService, MailService mailService) {
		String email = FGemail.trim();
		if ("forgotPWD".equals(FGaction)) {
			int expireTime = 3;

			// check email exit
			Integer memberid = memberService.checkEmail(email);
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
			String hostStr = "localhost:8094"; // 到時候要改!!

			String FGUrl = "請在" + expireTime + "天內點擊連結，否則失效! " + "\n" + "http://" + hostStr
					+ "/TFA105G1-MVC/MVC/MemberInfo/return?reAction=forgotPWD&mail=" + email + "&No=" + memberid
					+ "&temPWD=" + temPWD;

			String messageText = "Hello! " + email + " 請謹記此密碼: " + temPWD + "\n" + " (注意事項 !!)";

			mailService.sendMail(FGemail, "忘記密碼通知", messageText + "\n" + FGUrl);
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
					return "";
				} else {
					jedis.del(mail);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 更新舊密碼為新密碼
			if (receivePWD.equals(userTempPWD)) {

				Integer memberid = Integer.valueOf(No);
				memberService.changePWD(memberid, temPWD);

				return "redirect:/download/FS-login.jsp";
			}
		}
		return "";
	}

}
