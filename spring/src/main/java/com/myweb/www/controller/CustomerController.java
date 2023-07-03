package com.myweb.www.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.www.domain.AdminVO;
import com.myweb.www.domain.CustomerVO;
import com.myweb.www.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class CustomerController {
	
	@Inject
	private CustomerService csv;
	
	@GetMapping("/signup")
	public String joinGet(Model m) {
		log.info("회원가입 페이지 진입");
		return "/user/signup";
	}
	
	@PostMapping("/signup")
	public String joinPost(Model m, CustomerVO cvo) {
		log.info("회원가입 시작");
		log.info("나옴?"+cvo.getCadd());
	        int isOk = csv.join(cvo);
	        if (isOk > 0) {
	            m.addAttribute("msg_signup", 1);
	        } else {
	            m.addAttribute("msg_signup", 0);
	        }
	        return "home";
	    }

	@GetMapping("/login")
	public String loginGet() {
		return "/user/login";
	}
	
	@PostMapping("/login")		
	public String loginPost(Model m, CustomerVO cvo, HttpServletRequest request) {		
		CustomerVO isUser = csv.login(cvo); 
		AdminVO isAdmin = csv.getAdmin();
		if(isUser != null) {
			HttpSession ses = request.getSession();
			ses.setAttribute("ses", isUser);
			m.addAttribute("user", isUser);
		}
//		로그인 계정이 admin일 경우 관리자 페이지 이동
		if(isAdmin.getAid().equals(cvo.getCid()) ) {
			return "/product/register";
		}else {			
			return "home";
		}
	}
	
	@GetMapping("/modify")
	public String modifyGet() {
		return "/user/modify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(Model m, CustomerVO cvo) {
		log.info("회원 정보 수정 진입");
		
		int isUser = csv.modify(cvo);
		
		return "home";
	}
	
	@GetMapping("/delete")
	public String deleteGet() {
		return "/user/delete";
	}
	
	@PostMapping("/delete")
	public String deletePost(CustomerVO cvo) {
		log.info("회원 정보 삭제 진입");
		int isOk = csv.delete(cvo);
		return "home";
	}
	
}
