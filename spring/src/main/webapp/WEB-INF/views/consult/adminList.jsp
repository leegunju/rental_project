<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리지 상담신청 리스트</title>
</head>
<body>
	<div class="content">
        <h1>상담신청 목록 페이지</h1>
        <table class="table table-striped" data-aos="fade-up">
            <thead class="thead-dark">
                <tr>
                    <th>상담신청번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>핸드폰번호</th>
                    <th>상담내용</th>
                    <th>상품이름</th>
                    <th>등록일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${adminList }" var="csvo">
                    <tr>
                        <td>${csvo.csno }</td>
                        <td>${csvo.csid }</td>
                        <td>${csvo.csname }</td>
                        <td>${csvo.cstel }</td>
                        <td>${csvo.cscontent }</td>
                        <td>${csvo.cstype }</td>
                        <td>${csvo.csdate }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>