<<<<<<< HEAD
package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	int insert(ProductVO pvo);

	List<ProductVO> getList(String type_a);

	int selectPno();

	List<ProductVO> isThere();

	ProductVO getDetail(int pno);

	int getTotalCount(PagingVO pgvo);

	List<ProductVO> getAdminList(PagingVO pgvo);

	int updateProduct(ProductVO pvo);

}
=======
package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	int insert(ProductVO pvo);

	List<ProductVO> getList(String type_a);

	int selectPno();

	List<ProductVO> isThere();

	ProductVO getDetail(int pno);

}
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
