<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Modify Page</title>
<link rel="stylesheet" href="/resources/css/product/register.css">
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Product Modify Page</h1>
	 <form action="/product/modify" method="post" id="registerForm" class="was-validated" enctype="multipart/form-data">
        <div>
            <ul>
                <li class="product" data-value="정수기">
                    <div>
                        <i class="fa-solid fa-glass-water" style="color: #000000;"></i>
                        <div class="product-name">정수기</div>
                    </div>
                </li>
                <li class="product" data-value="공기청정기">
                    <div>
                        <i class="fa-solid fa-fan" style="color: #000000;"></i>
                        <div class="product-name">공기청정기</div>
                    </div>
                </li>
                <li class="product" data-value="제습기">
                    <div>
                        <i class="fa-solid fa-droplet-slash" style="color: #000000;"></i>
                        <div class="product-name">제습기</div>
                    </div>
                </li>
                <li class="product" data-value="에어컨">
                    <div>
                        <i class="fa-solid fa-wind" style="color: #000000;"></i>
                        <div class="product-name">에어컨</div>
                    </div>
                </li>
                <li class="product" data-value="텔레비전">
                    <div>
                        <i class="fa-solid fa-tv" style="color: #000000;"></i>
                        <div class="product-name">텔레비전</div>
                    </div>
                </li>
            </ul>
        </div>
        <input type="hidden" name="type_a" id="mySelection">
        <p id="type_aError" class="error" style="color: red; display: none;">제품 카테고리를 입력해주세요.</p>
       <br>
       <input name="pno" value="${product.pvo.pno }" type="hidden">
       <input name="pname" value="${product.pvo.pname }" readonly="readonly"> <br><br>
       <p id="pnameError" class="error" style="color: red; display: none;">제품명을 입력해주세요.</p>
       <input id="priceInput" name="price" value="${product.pvo.price }"> <br><br>
       <p id="priceError" class="error" style="color: red; display: none;">숫자만 입력해주세요.</p>
       <textarea name="content" cols="50" rows="10">${product.pvo.content }</textarea> <br>
       <div id="allDiv">
	       <div class="fileDiv">
		       <input type="file" id="files" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger">상품 메인 사진을 넣어주세요.</button> <br>
		   	   <c:set value="${product.flist}" var="flist"/>	 
		       <div id="fileZone">
		    		<li>
		    			<c:forEach items="${flist }" var="file">
		    				<c:if test="${file.fileCategoryNum == 0}">     		 	
		        				<img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
		        				<button type="button" class="file-x" data-uuid="${file.uuid }">X</button>
		        			</c:if>
		    			</c:forEach> 
		    		</li>
				</div>
	    	</div>
		   <div id="fileDiv">
			   <input type="file" id="files1" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger1">상품 상세 정보 사진을 넣어주세요.</button> <br>
				 <div id="fileZone1"> 	
		    		<li>    	
		        		<c:forEach items="${flist }" var="file">
		    				<c:if test="${file.fileCategoryNum == 1}">     		 	
		        				<img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
		        				<button type="button" class="file-x" data-uuid="${file.uuid }">X</button>
		        			</c:if>
		    			</c:forEach> 
		    		</li>
				</div>
			</div>
			<div id="fileDiv">
			   <input type="file" id="files2" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger2">상품 스펙 사진을 넣어주세요.</button> <br>
				 <div id="fileZone2">	
		    		<li>    	
		        		<c:forEach items="${flist }" var="file">
		    				<c:if test="${file.fileCategoryNum == 2}">     		 	
		        				<img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
		        				<button type="button" class="file-x" data-uuid="${file.uuid }">X</button>
		        			</c:if>
		    			</c:forEach> 				
		    		</li>
				</div>
			</div>
		</div>
       <button onclick="validateButton(event)" id="modBtn" class="btn btn-primary" type="submit" disabled>수정</button>
    </form>
    <div id="delDiv">
		<form action="/product/delete" method="post">
		   <input name="pno" value="${product.pvo.pno }" type="hidden">
	       <button id="delBtn" type="submit">삭제</button>
		</form>
	</div>
	<script type="text/javascript" src="/resources/js/product/productModify.js"></script>
</body>
</html>