package com.myweb.www.controller;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.domain.ConsultVO;
import com.myweb.www.domain.CustomerVO;
import com.myweb.www.domain.ProductVO;
=======

import com.myweb.www.domain.ConsultVO;
import com.myweb.www.domain.CustomerVO;
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
import com.myweb.www.service.ConsultService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/consult/*")
@Controller
public class ConsultController {
	
	@Inject
	private ConsultService cssv;
	
	@GetMapping("/register")
	public String registerGet() {
		log.info("상담신청 페이지 진입");
		return "/consult/register";
	}
	
	@PostMapping("/register")
	public String registerPost(Model m, CustomerVO cvo, ConsultVO csvo, HttpServletRequest request) {
		log.info("상담신청 폼 시작");
<<<<<<< HEAD
		log.info(">>>>>>>>>> "+csvo);
		int isOk = cssv.register(csvo);
		log.info(">>>>>>>>>> "+ (isOk > 0 ? "성공" : "실패"));
		if (isOk > 0) {
            m.addAttribute("isThere", 0);
            
        } else {
            m.addAttribute("isThere", 1);
        }
=======
		int isOk = cssv.register(csvo);
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
		HttpSession ses = request.getSession();
		CustomerVO sesUser = (CustomerVO)ses.getAttribute("ses");
		log.info(">>>>>>>>>> "+sesUser.toString());
		return "home";
	}
	
<<<<<<< HEAD
	@GetMapping("adminList")
	public String adminList(Model m) {
		List<ProductVO> list = cssv.isThere();
		m.addAttribute("adminList", list);
		return "/consult/adminList";
	}
	
=======
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
}
