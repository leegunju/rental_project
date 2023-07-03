package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	int insert(ProductVO pvo);

	List<ProductVO> getList(String type_a);

	int selectPno();

}