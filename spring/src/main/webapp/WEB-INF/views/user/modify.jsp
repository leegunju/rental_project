<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/signup.css">
</head>
<body>
    <div class="a">
        <a href="/home.html">
            <img src="/img/rental.png" alt="">
        </a>
    </div>
    <form action="/user/modify" method="post">
		<input type="text" id="cid" name="cid" placeholder="아이디 입력"><br>
        <input type="text" id="cname" name="cname" placeholder="이름"><br>
        <input type="password" id="cpw" name="cpw" placeholder="비밀번호 입력"><br>
        <input type="text" id="cage" name="cage" placeholder="나이"><br>
        <div class="gender-selection">
            <label>
                <i id="maleIcon" class="fa-solid fa-mars fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="man" id="manRadio" style="display: none;">
                <span id="maleText" class="gender-text">남자</span>
            </label>
            <label>
                <i id="femaleIcon" class="fa-solid fa-venus fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="woman" id="womanRadio" style="display: none;">
                <span id="femaleText" class="gender-text">여자</span>
            </label>
        </div><br>
        <input type="text" id="cnick_name" name="cnick_name" placeholder="닉네임 입력"><br>
        <input type="email" id="cemail" name="cemail" placeholder="RENTAL@okRental.com"><br>
        <input type="text" id="ctel" name="ctel" placeholder="010-1234-5678"><br>
        <input type="text" id="cadd" name="cadd" placeholder="주소 입력"><br>
        <button type="submit">회원 정보 수정</button>
	</form>
	
	<script type="text/javascript">
	    const modifyFail = '<c:out value="${modifyFail}"/>';
	    console.log(modifyFail); 
		
	    if(modifyFail == 1){
	        alert("아이디 혹은 비밀번호를 확인해주세요")   
	    }
	</script>
</body>
</html>