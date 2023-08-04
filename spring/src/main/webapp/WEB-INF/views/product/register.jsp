<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Register Page</title>
<link rel="stylesheet" href="/resources/css/product/register.css">
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h1>제품 등록 페이지</h1>
	 <form action="/product/register" method="post" id="registerForm" class="was-validated" enctype="multipart/form-data">
        <div id="productDiv">
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
       <input name="pname" placeholder="제품명을 입력해주세요"> <br><br>
       <p id="pnameError" class="error" style="color: red; display: none;">제품명을 입력해주세요.</p>
       <input id="priceInput" name="price" placeholder="가격을 입력해주세요"> <br><br>
       <p id="priceError" class="error" style="color: red; display: none;">숫자만 입력해주세요.</p>
       <textarea name="content" cols="50" rows="10">  검색 가능한 단어들을 넣어 상세정보를 입력해주세요.&#10;  예시) 2023년 다이슨 V7 무선청소기 SVC-D50PWS 
       </textarea> <br>
       <div id="allDiv">
	       <div class="fileDiv">   
	       	   <input type="file" id="files" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger">상품 메인 사진을 넣어주세요.</button> <br>      
		       <div id="fileZone">
		       
		       </div>
		   </div>
	   
		   <div class="fileDiv">	   	   
		   	   <input type="file" id="files1" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger1">상품 상세 정보 사진을 넣어주세요.</button> <br>
		   	   
		       <div id="fileZone1">
		       
		       </div>
	       </div>
       
	       <div class="fileDiv">
	       	   <input type="file" id="files2" name="files" style="display: none" class="form-control" aria-label="file example" required> <br>
		       <button type="button" id="trigger2">상품 스펙 사진을 넣어주세요.</button> <br>
	            
		       <div id="fileZone2">
		       
		       </div>
	       </div>
       </div>
       <button onclick="validateButton(event)" id="regBtn" class="btn btn-primary" type="submit" disabled>Submit</button>
    </form>

	<script type="text/javascript" src="/resources/js/product/productRegister.js"></script>
	<script type="text/javascript">
	    const thereis = `<c:out value="${thereis}"/>`;
	    console.log(thereis);
	    if (thereis === "1") {
	        alert("같은 상품명이 존재합니다. 다시 입력해주세요.");
	        document.getElementById("registerForm").addEventListener("submit", function(e) {    
	        });
	    }
</script>
</body>
</html>