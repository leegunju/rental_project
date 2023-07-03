<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:forEach items="${dtoList}" var="dto">
        <div>
        <c:forEach items="${dto.flist}" var="file">
            <img alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}"><br>
        </c:forEach>
        <p>${dto.pvo.pname}</p>
        <p>${dto.pvo.price}</p>
        <p>${dto.pvo.content}</p>
        </div>
    </c:forEach>
</div>       

</body>
</html>