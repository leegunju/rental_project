package com.myweb.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.www.service.ChatbotService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ChatbotController {
	
	@Inject
    private ChatbotService chatbotService;

	@PostMapping(value="/chatbotSend2", produces="text/plain;charset=UTF-8")
    public String chat(@RequestParam("message") String message, HttpServletRequest req, HttpServletResponse res) throws Exception {
        // message를 ChatbotService의 main() 메서드에 전달하여 응답을 받아 반환
       req.setCharacterEncoding("UTF-8");
       log.info("message >>>>>>" + message);
        return chatbotService.main(message);
    }

}

