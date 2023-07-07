package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String postRegister(Model m, ProductVO pvo, RedirectAttributes ra,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		log.info(">>> pvo > " + pvo.toString());
		log.info(">>> files > " + files.toString());
		
		List<ProductVO> isThere = psv.isThere();
		for(ProductVO p : isThere) {
			String existingName = p.getPname();
			if(existingName.equals(pvo.getPname())) {
				m.addAttribute("thereis", 1);
				return "/product/register";
			}
		}
		
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
	
	@GetMapping("/adminList")
	public String getAdminList(Model m) {
		List<ProductVO> list = psv.isThere();
		m.addAttribute("adminList", list);
		return "/product/adminList";
	}
	
	@GetMapping("/modify")
	public void detail(Model m, @RequestParam("pno")int pno) {
		log.info(">>> pno > " + pno);
		ProductDTO pdto = psv.getDetail(pno);
		m.addAttribute("product", pdto);
	}
	
//	@PostMapping("/modify")
//	public String modify(RedirectAttributes ra, ProductDTO pdto) {
//		log.info(">>> pdto > " + pdto.toString());
//		int isOk = psv.modify(pdto);
//		log.info(">>> Product Modify > " + (isOk > 0 ? "Success" : "Fail"));
//		return "redirect:/product/adminList";
//	}
	
//	@DeleteMapping(value="/file/{uuid}", produces= {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid) {
//		log.info(">>> uuid > " + uuid);
//		return psv.removeFile(uuid) > 0 ?
//				new ResponseEntity<String>("1", HttpStatus.OK)
//				 : new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
}
	

