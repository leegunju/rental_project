<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<<<<<<< HEAD
<link rel="stylesheet" href="/resources/css/user/signup.css">
</head>
<body>
    <div class="a">
        <a href="/home.html">
            <img src="/img/rental.png" alt="">
        </a>
    </div>
    <form action="/user/signup" method="post">
		<input type="text" id="cid" name="cid" placeholder="아이디 입력">
        <input type="text" id="cname" name="cname" placeholder="이름">
        <input type="password" id="cpw" name="cpw" placeholder="비밀번호 입력">
        <input type="text" id="cage" name="cage" placeholder="나이">
=======
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/user/signup.css">
<link rel="stylesheet" href="/resources/css/HF.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header">
                <div class="logo-title">
                    <a href="#">
                        <img src="/resources/img/images.png" alt="">
                    </a>
                    <h1 class="title" style="color: #555;">OK Rental</h1>
                </div>
                <!-- 우측에 위치 -->
                <div class="header-right">
                    <div class="info">
                        <i class="fa-sharp fa-solid fa-user fa-xl" style="color: #555;" onclick="toggleTooltip();"></i>
                        <div id="tooltip" class="speech-bubble">
                        <a href="/signup.html">회원가입</a> <br> <a href="/login.html">로그인</a> <br> <a href="">회원정보수정</a>
                        </div>
                    </div>
                    <!-- 230710 서치 -->
                <div class="search">
                    <span id="search">
                      <i class="fa-solid fa-magnifying-glass fa-xl" style="color: #555;"></i>
                    </span>
                  </div>
                </div>
            </div>
        </div>
          <div id="myOverlay" class="overlay">
              <span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
              <div class="overlay-content">
                <form action="#">
                  <div class="search-container">
                    <h1 style="color: white;">Quickly Search Site</h1>
                    <div class="search-box">
                      <input type="text" placeholder="Search.." name="search" class="search-input">
                      <button type="submit" style="color: #555;">Search</button>
                    </div>
                  </div>
                </form>
                  <div class="quickly">
                    <ul>
                      <li>
                        <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">dyson</a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  lg </a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  cuckoo </a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  coway </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            
            <div id="blurryPart" class="blurry-part"></div>
          <!-- 230710 서치 -->
                </div>
            </div>
        </div>
    </header>
    
    <form action="/user/signup" method="post" class="from">
		<input class="input" type="text" id="cid" name="cid" placeholder="아이디 입력">
        <input class="input" type="text" id="cname" name="cname" placeholder="이름">
        <input class="input" type="password" id="cpw" name="cpw" placeholder="비밀번호 입력">
        <input class="input" type="text" id="cage" name="cage" placeholder="나이">
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
        <div class="gender-selection">
            <label>
                <i id="maleIcon" class="fa-solid fa-mars fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="man" id="manRadio" style="display: none;">
<<<<<<< HEAD
=======
                <br>
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
                <span id="maleText" class="gender-text">남자</span>
            </label>
            <label>
                <i id="femaleIcon" class="fa-solid fa-venus fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="woman" id="womanRadio" style="display: none;">
<<<<<<< HEAD
                <span id="femaleText" class="gender-text">여자</span>
            </label>
        </div>
        <input type="text" id="cnick_name" name="cnick_name" placeholder="닉네임 입력">
        <input type="email" id="cemail" name="cemail" placeholder="RENTAL@okRental.com">
        <input type="text" id="ctel" name="ctel" placeholder="010-1234-5678">
        <input type="text" id="cadd" name="cadd" placeholder="주소 입력">
        <button type="submit">회원가입</button>
	</form>
    <footer>
        <div class="footer">
            <div class="ft-logo">
                <img src="/img/images.png" alt="" width="50px" height="50px">
=======
                <br>
                <span id="femaleText" class="gender-text">여자</span>
            </label>
        </div>
        <input class="input" type="text" id="cnick_name" name="cnick_name" placeholder="닉네임 입력">
        <input class="input" type="email" id="cemail" name="cemail" placeholder="RENTAL@okRental.com">
        <input class="input" type="text" id="ctel" name="ctel" placeholder="010-1234-5678">
        <input class="input" type="text" id="cadd" name="cadd" placeholder="주소 입력">
        <button class="sign-btn" type="submit">회원가입</button>
	</form>
	
    <footer>
        <div class="footer">
            <div class="ft-logo">
                <img src="/resources/img/images.png" alt="" width="50px" height="50px">
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
            </div>
            <div class="footinfo">
                <span><h6>©2023 Ok RENTAL. All Rights Reserved.</h6></span>
                <span><h6>RETURN POLICY</h6></span>
                <span><h6>TERMS & LEGAL</h6></span>
                <span><h6>PRIVACY NOTICE</h6></span>
            </div>
<<<<<<< HEAD
        </div>
        <div class="footsns">
           <a href="https://www.facebook.com/login/?locale=ko_KR"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
           <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i class="fa-brands fa-twitter" style="color: #000000;"></i></a>
            <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
            <a href="https://github.com/login"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
            <a href="https://discord.com/login"><i class="fa-brands fa-discord" style="color: #000000;"></i></a>
        </div>
    </footer>
    <script src="/resources/js/user/signup.js"></script>
=======
            <div class="footsns">
               <a href="https://www.facebook.com/login/?locale=ko_KR"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
               <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i class="fa-brands fa-twitter" style="color: #000000;"></i></a>
                <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
                <a href="https://github.com/login"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
                <a href="https://discord.com/login"><i class="fa-brands fa-discord" style="color: #000000;"></i></a>
            </div>
        </div>
    </footer>
    <script src="/resources/js/user/signup.js"></script>
    <script src="/resources/js/HF.js"></script>
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
</body>
</html>