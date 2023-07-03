package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;

public interface ProductService {

	int register(ProductVO pvo);

	int register(ProductDTO pdto);

	List<ProductDTO> getDTOList(String type_a);

}
