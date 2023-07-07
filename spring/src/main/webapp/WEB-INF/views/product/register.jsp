<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Register Page</title>
<link rel="stylesheet" href="/resources/css/register.css">
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Product Register Page</h1>
	 <form action="/product/register" method="post" id="registerForm" enctype="multipart/form-data">
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
            </ul>
        </div>
        <input type="hidden" name="type_a" id="mySelection">
       <br>
       <input name="pname" placeholder="제품명을 입력해주세요"> <br>
       <p id="pnameError" style="color: red; display: none;">제품명을 입력해주세요.</p>
       <input id="priceInput" name="price" placeholder="가격을 입력해주세요"> <br>
       <p id="priceError" style="color: red; display: none;">숫자만 입력해주세요.</p>
       <textarea name="content" cols="50" rows="10">상세정보를 입력해주세요</textarea> <br>
       <input name="count" placeholder="재고수량을 입력해주세요"> <br>
       <p id="countError" style="color: red; display: none;">숫자만 입력해주세요.</p>
       대표 사진을 한장 넣어주세요.<input type="file" id="files" name="files" style="display: none"> <br>
       <button type="button" id="trigger">File Upload</button> <br>
       <div id="fileZone">
       
       </div>
       <button onclick="validateButton(event)" id="regBtn" type="submit">Submit</button>
    </form>

	<script type="text/javascript" src="/resources/js/productRegister.js"></script>
	<script type="text/javascript">
	    const thereis = `<c:out value="${thereis}"/>`;
	    console.log(thereis);
	    if (thereis === "1") {
	        alert("같은 상품명이 존재합니다. 다시 입력해주세요.");
	        document.getElementById("registerForm").addEventListener("submit", function(e) {
	            e.preventDefault();
	        });
	    }
</script>
</body>
</html>