package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.domain.RentalsVO;
import com.myweb.www.repository.FileDAO;
import com.myweb.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	public ProductDAO pdao;
	
	@Inject
	private FileDAO fdao;

	@Override
	public int register(ProductVO pvo) {
		log.info(">>> product register in");
		return pdao.insert(pvo);
	}

	@Override
	public int register(ProductDTO pdto) {
		log.info("pvo + fList register in");
		int isOk = pdao.insert(pdto.getPvo());
		if(pdto.getFlist() == null) {
			isOk*=1;
		} else {
			if(isOk > 0 && pdto.getFlist().size()>0) {
				int pno = pdao.selectPno();
				for(FileVO fvo : pdto.getFlist()) {
					fvo.setPno(pno);
					log.info(">>> insert file > " + fvo.toString());
					isOk *= fdao.insertFile(fvo);
				}
			}
		}
		return isOk;
	}

	@Override
	public List<ProductDTO> getDTOList(String type_a) {
		log.info(">>> product list in");
		List<ProductVO> productList = pdao.getList(type_a);
		List<ProductDTO> dtoList = new ArrayList<>();
		for(ProductVO product : productList) {
			List<FileVO> fileList = fdao.getFileList(product.getPno());
			ProductDTO dto = new ProductDTO(product, fileList);
			dtoList.add(dto);
		}
		return dtoList;
	}

}
