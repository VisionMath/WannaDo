package com.pgm.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgm.board.model.User;
import com.pgm.board.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private UserService userService;

	@GetMapping(value = {"", "index"})
	public String index() {
		return "index";
	}

	@GetMapping("join")
	public String joinForm() {
		return "member/join";
	}

	// 아이디 중복 검사 작업중 checkId
	@PostMapping("checkId")
	@ResponseBody
	public String checkId(String userid) {
		// 입력란에 가져오는 username 예시 : lsy
		User user = userService.findByUserid(userid);
		// boolean usernameYes = userService.existsByUserid(userid);
		String result = "success";

		if (user != null) { // 중복된 아이디임.
			return "fail";
		} else if (user == null && "".equals(userid)) {
			return "no";
		}
		return result;
	}

	@PostMapping("join")
	@ResponseBody
	public String register(@RequestBody User user) {

		if (userService.findByUserid(user.getUserid()) != null) {
			return "fail";
		}
		userService.register(user);
		return "success";
	}

	@GetMapping("login")
	public String loginForm() {
		return "member/login";
	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sUser");
		return "redirect:/";

	}

	@GetMapping("findmine")
	public String findmine(HttpSession session) {
	    session.getAttribute("sUser");
	    return "member/findmine";
	}

	@PostMapping("login")
	@ResponseBody
	public String loginPro(String userid, String password,
			HttpSession session) {
		User user = userService.findByUserid(userid);
		String result = "no";
		if (user != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("sUser", user);
				result = "success";
			} else {
				result = "fail";
			}
		}
		return result;
	}

}
