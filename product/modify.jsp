<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Modify Page</title>
<<<<<<< HEAD
<link rel="stylesheet" href="/resources/css/product/register.css">
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Product Modify Page</h1>
=======
<link rel="stylesheet" href="/resources/css/register.css">
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>product Modify Page</h1>
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
	 <form action="/product/modify" method="post" id="registerForm" enctype="multipart/form-data">
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
<<<<<<< HEAD
        <p id="type_aError" style="color: red; display: none;">제품 카테고리를 입력해주세요.</p>
       <br>
       <input name="pno" value="${product.pvo.pno }" type="hidden">
=======
       <br>
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
       <input name="pname" value="${product.pvo.pname }" readonly="readonly"> <br>
       <p id="pnameError" style="color: red; display: none;">제품명을 입력해주세요.</p>
       <input id="priceInput" name="price" value="${product.pvo.price }"> <br>
       <p id="priceError" style="color: red; display: none;">숫자만 입력해주세요.</p>
       <textarea name="content" cols="50" rows="10">${product.pvo.content }</textarea> <br>
       <input name="count" value="${product.pvo.count }"> <br>
       <p id="countError" style="color: red; display: none;">숫자만 입력해주세요.</p>
       대표 사진을 한장 넣어주세요.<input type="file" id="files" name="files" style="display: none"> <br>
       <button type="button" id="trigger">File Upload</button> <br>
       <div id="fileZone">
        <c:forEach items="${product.flist}" var="file">
<<<<<<< HEAD
        <li>    	
			<img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
			<button type="button" class="file-x" data-uuid="${file.uuid }">X</button>
		</li>
		</c:forEach>
		
       </div>
       <button onclick="validateButton(event)" id="modBtn" type="submit">수정</button>
       <button id="delBtn" type="submit">삭제</button>
    </form>

	<script type="text/javascript" src="/resources/js/product/productModify.js"></script>
=======
			<img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
		</c:forEach>
       </div>
       <button onclick="validateButton(event)" id="modBtn" type="submit">수정</button>
       <button id="delBtn" type="button" data-uuid="${file.uuid }">삭제</button>
    </form>

	<script type="text/javascript" src="/resources/js/productModify.js"></script>
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
</body>
</html>