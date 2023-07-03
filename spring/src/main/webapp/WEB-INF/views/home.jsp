<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Document</title>
    <script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/home.css">
</head>
<body>
    <header>
        <div class="container">
            <!-- class logo는 좌측에 위치 사이즈는 작게 -->
            <div class="logo">
                <a href="">
                    <img src="/img/rental.png" alt="XXX">
                </a>
            </div>
            <!-- id container는 화면 중앙 상단에 위치  -->
            <div id="container"> <a href=""><h1 class="style-3">Web_Site_Name</h1></a></div>
            <div class="nav">
                <div class="center-items">
                    <a href=""><p name="cname" id="cname">정수기</p></a>
                    <a href=""><p name="cname" id="cname">비데</p></a>
                    <a href=""><p name="cname" id="cname">공기청정기</p></a>
                    <a href=""><p name="cname" id="cname">매트리스</p></a>
                </div>                
            </div>
        </div>
        <br>
        <div class="info">
            <i class="fa-sharp fa-solid fa-user fa-xl" style="color: black;" onclick="toggleTooltip();"></i>
            <div id="tooltip" class="speech-bubble">
            
            <!-- 미 로그인 시 보이고 로그인 시 안보이게 -->
            <c:if test="${ses.cid == null }">
               <a href="/user/signup">회원가입</a> <br>
               <a href="/user/login">로그인</a> <br> 
            </c:if>
            
               <!-- 로그인해야 수정 삭제가 보이게 -->
               <c:if test="${ses.cid != null }">
               <a href="/user/modify">회원수정</a><br>
               <a href="/user/delete">회원삭제</a>
               </c:if>
               
            </div>
        </div>
        <div class="search">
            <span id="search">
                <i class="fa-solid fa-magnifying-glass fa-xl" style="color: black;"></i>
            </span>
            <input id="search-input" type="text" placeholder="Search...">
        </div>
    </header>
    <main>
        <div class="video-box">
            <video src="/resources/video/production_id_4069110 (2160p).mp4" muted autoplay loop>
                <source src="/video/production_id_4069110 (2160p).mp4" type="video/mp4">

                <source src="/resources/video/production_id_4069110 (2160p).mp4" type="video/mp4">

            </video>
            <div class="video-box-btn">
              <a href="">CLICK ME</a>
            </div>
        </div>
    </main>
    <footer>
        <div class="footer">

            <div class="ft-logo">
                <img src="/resources/img/images.png" alt="" width="50px" height="50px">
            </div>
            <div class="footinfo">
                <span><h6>©2023 Ok RENTAL. All Rights Reserved.</h6></span>
                <span><h6>RETURN POLICY</h6></span>
                <span><h6>TERMS & LEGAL</h6></span>
                <span><h6>PRIVACY NOTICE</h6></span>
            </div>
        </div>
        <div class="footsns">
           <a href="https://www.facebook.com/login/?locale=ko_KR"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
           <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i class="fa-brands fa-twitter" style="color: #000000;"></i></a>
            <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
            <a href="https://github.com/login"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
            <a href="https://discord.com/login"><i class="fa-brands fa-discord" style="color: #000000;"></i></a>

			<a href="/product/register"><button>register temporary</button></a>

        </div>
    </footer>
    <script src="/resources/js/home.js"></script>
</body>
</html>