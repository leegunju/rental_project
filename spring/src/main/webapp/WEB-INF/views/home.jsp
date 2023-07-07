<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
    <script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="/path/to/your/local/jquery.js"><\/script>')</script>
    <link rel="stylesheet" href="/resources/css/home.css">
</head>
<style>
</style>
<body>
    <header>
        <div class="container">
            <!-- class logo는 좌측에 위치 사이즈는 작게 -->
            <div class="logo">
                <a href="">
                    <img src="/resources/img/rental.png" alt="XXX">
                </a>
            </div>
            <!-- id container는 화면 중앙 상단에 위치  -->
            <div id="container"> <a href="home"><h1 class="style-3">Web_Site_Name</h1></a></div>
            <div class="nav">
                <div class="center-items">
                    <a href="/product/list?type_a=정수기"><p>정수기</p></a>
                    <a href="/product/list?type_a=공기청정기"><p>공기청정기</p></a>
                    <a href="/product/list?type_a=제습기"><p>제습기</p></a>
                    <a href="/product/list?type_a=에어컨"><p>에어컨</p></a>
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
               <a href="/user/logout">로그아웃</a><br>
               <a href="/user/modify">회원수정</a><br>
               <a href="/user/delete">회원삭제</a><br>
               <a href="/consult/register">상담신청</a><br>
               <a href="/consult/adminList">상담리스트</a>
            </c:if>        
            </div>
        </div>
    </header>
    <!-- 영상orCF광고 -->
    <main>
        <div class="video-box">
            <video src="/resources/video/production_id_4069110 (2160p).mp4" muted autoplay loop>
                <source src="/resources/video/production_id_4069110 (2160p).mp4" type="video/mp4">
            </video>
            <div class="video-box-btn">
              <a href="">CLICK ME</a>
            </div>
        </div>
    </main>
<!-- 이제부터 그냥 홈페이지 -->
    <section>
    <article>
        <div class="section1">
            <div class="inner">
                <div class="title_area"><h2>고객렌탈서비스</h2></div>
                    <div class="desc">
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/달력.png" alt="">
                                </div>
                                <div class="icon_tit">신규 설치일정 조회/변경</div>
                                <div class="link">
                                    <span> 바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/셋팅.png" alt="">
                                </div>
                                <div class="icon_tit">이전설치 신청/조회</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/머니.png" alt="">
                                </div>
                                <div class="icon_tit">렌탈료/만료일 잔여 조회</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/요금.png" alt="">
                                </div>
                                <div class="icon_tit">미납요금 조회/결제</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/요금변경.png" alt="">
                                </div>
                                <div class="icon_tit">결제 카드 변경</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/입금확인.png" alt="">
                                </div>
                                <div class="icon_tit">입금 확인증 조회</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/동영상조회.png" alt="">
                                </div>
                                <div class="icon_tit">동영상 조회</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <div class="icon">
                                    <img src="/resources/img/포인트조회.png" alt="">
                                </div>
                                <div class="icon_tit">렌탈료 포인트 납부</div>
                                <div class="link">
                                    <span>바로가기</span>
                                </div>
                            </a>
                        </div>
                    </div>
            </div>
        </div>
    </article>
    </section>

    <!-- 플로팅 메뉴 or 퀵메뉴 -->
    <div class="floating">
        <button id="info-button">
            <i class="fa-solid fa-question" style="color: white;"></i>
        </button>
        <div id="info-modal" class="modal">
            <span id="close-button">&times;</span>
            <p>Some information...</p>
        </div>
    </div>

    <!-- 관리자만 보이는 버튼 좌측 하단에 작게 표시 마우스 호버있음 -->
    <div class="floating-admin">
        <button id="admin-button-left">
            <i class="fa-solid fa-cogs" style="color: white;"></i>
        </button>
    </div>
    
    <div id="admin-modal-left" class="modal-left">
        <div class="modal-content-left">
            <span id="close-button-admin-left">&times;</span>
            <div class="modal-buttons-left">
                <a href="/product/register"><button class="modal-btn-left">register temporary</button></a>
                <a href="/product/adminList"><button class="modal-btn-left">adminList temporary</button></a>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="footer">
            <div class="ft-logo">
                <img src="/resources/img/images.png" alt="" width="50px" height="50px">
            </div>
            <div class="footinfo">
                <h6>©2023 Ok RENTAL. All Rights Reserved.</h6>
                <a href="#"><h6>RETURN POLICY</h6></a>
            <a href="#"><h6>TERMS & LEGAL</h6></a>
            <a href="#"><h6>PRIVACY NOTICE</h6></a>
            </div>
            <div class="footsns">
               <a href="https://www.facebook.com/login/?locale=ko_KR"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
               <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i class="fa-brands fa-twitter" style="color: #000000;"></i></a>
                <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
                <a href="https://github.com/login"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
                <a href="https://discord.com/login"><i class="fa-brands fa-discord" style="color: #000000;"></i></a>
            </div>
        </div>
    </footer>
    <script src="/resources/js/home.js"></script>
</body>
</html>