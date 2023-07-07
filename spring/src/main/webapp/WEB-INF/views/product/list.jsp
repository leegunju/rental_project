<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link rel="stylesheet" href="/resources/css/list.css">
</head>
<body>
<c:set var="firstDto" value="${dtoList[0]}" />
<h1>${firstDto.pvo.type_a} List</h1>

	<div id="dtoListDiv">
		<ul>
			<c:forEach items="${dtoList}" var="dto">
				<li>
				<a href="#"> 
				<span class="img-wrapper">
                    <span class="img-container">
				 		    <c:forEach items="${dto.flist}" var="file">
							    <img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">
						    </c:forEach>
                    </span>
				</span>
				<span class="badge-container"> 
						<img src="/resources/img/pc_best.png" alt="Best" class="badge">
						<img src="/resources/img/pc_new.png" alt="New" class="badge">
				</span>
					<span class="info-1">${dto.pvo.pname}</span>
					<span class="info-2">${dto.pvo.price}</span>
					<span class="info-3">${dto.pvo.content}</span>
				</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
