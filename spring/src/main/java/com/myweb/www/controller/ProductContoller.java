package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/product/*")
@Controller
public class ProductContoller {
	
	@Inject
	private ProductService psv;
	
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/register")
	public String getRegister() {
		return "/product/register";
	}
	
	@PostMapping("/register")
	public String postRegister(ProductVO pvo, RedirectAttributes ra,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		log.info(">>> pvo > " + pvo.toString());
		log.info(">>> files > " + files.toString());
		List<FileVO> flist = null;
		
		if(files[0].getSize()>0) {
			flist = fhd.uploadFiles(files);
		} else {
			log.info("file null");
		}
		ProductDTO pdto = new ProductDTO(pvo, flist);
		int isOk = psv.register(pdto);
		log.info("제품 등록" + (isOk > 0 ? "성공" : "실패"));
		ra.addFlashAttribute("isOk", isOk);
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String getList(Model m, @RequestParam("type_a") String type_a) {
		List<ProductDTO> dtoList = psv.getDTOList(type_a);
		m.addAttribute("dtoList", dtoList);
		log.info("toString: " + dtoList.toString());
		return "/product/list";
	}
	
}
