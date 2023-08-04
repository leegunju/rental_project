<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/e927512ef5.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />

    <link rel="stylesheet" href="/resources/css/consult/csCenter.css" />
    <link rel="stylesheet" href="/resources/css/HF.css">
    <title>이용안내</title>
  </head>
  <body>
    <!-- 헤더 -->
	<header>
		<div class="container" style="min-width: 100vw !important;">
			<div class="header">
				<a href="/home"> 
					<div class="logo-title">
						<img src="/resources/img/logo2.svg" alt="">
						<h1 class="title" style="color: #555; margin: 0">OK Rental</h1>
					</div>
				</a>
				<!-- 우측에 위치 -->
				<div class="header-right">
					<div class="info">
						<i class="fa-sharp fa-solid fa-user fa-xl" style="color: #555;"
							onclick="toggleTooltip();"></i>
						<div id="tooltip" class="speech-bubble">
							<c:if test="${ses.cid == null }">
								<a href="/user/signup">회원가입</a>
								<br>
								<a href="/user/login">로그인</a>
							</c:if>
							<c:if test="${ses.cid != null }">
								<a href="/user/modify">회원정보수정</a>
								<br>
								<a href="/user/logout">로그아웃</a>
							</c:if>
						</div>
					</div>

					<!-- 230710 서치 -->
					<div class="search">
						<span id="search"> <i
							class="fa-solid fa-magnifying-glass fa-xl" style="color: #555;"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div id="myOverlay" class="overlay">
			<span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
			<div class="overlay-content">
				<form action="/product/search" method="get">
					<div class="search-container">
						<h1 style="color: white;">Quickly Search Site</h1>
						<div class="search-box">							
							<input type="text" placeholder="Search.." name="search"
								class="search-input">
							<button class="search-box-btn" type="submit" style="color: #555;">Search</button>					
						</div>
					</div>
				</form>
				<div class="quickly">
					<ul>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=다이슨"> dyson</a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=엘지"> lg </a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=쿠쿠"> cuckoo </a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=코웨이"> coway </a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="blurryPart" class="blurry-part"></div>
		<!-- 230710 서치 -->
	</header>
	<!-- 헤더시마이 -->
    <!-- 분리 -->
     <div id="main">
      <h1>이용안내</h1>
      <div id="sBox">
        <div id="leftBox">
          <span class="material-symbols-outlined" id="telephone">
            phone_in_talk
          </span>
          <h3>고객센터</h3>
          <p>전화문의 : 1544-1234</p>
          <p>이용시간 : 평일 09:00 ~ 18:00 / 토요일 09:00 ~ 17:00</p>
          <p>(점심시간 : 12:00 ~ 13:00 / 일요일, 공휴일 휴무)</p>
        </div>
        <div id="rightBox">
          <span class="material-symbols-outlined" id="pen"> stylus </span>
          <h3>1:1문의</h3>
          <button type="button" id="ask">문의하기</button>
          <p>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</p>
          <p>
            토, 일요일 / 공휴일 문의는 운영시간 내 순차적으로 답변 드리겠습니다.
          </p>
          <p>(점심시간 : 12:00 ~ 13:00 / 일요일, 공휴일 휴무)</p>
        </div>
      </div>
      <div id="list">
        <a href="#" id="smallBox1">TV</a>
        <a href="#" id="smallBox2">자주 묻는 질문</a>
        <a href="#" id="smallBox3">렌탈</a>
        <a href="#" id="smallBox4">전화/기타</a>
      </div>

      <div id="tvBox" style="display: none">
        <hr>
          <h1>셀프해결 가이드</h1>
          <p>TV가 안나오고 "방송신호가 없습니다" 메시지가 보여요</p>
          <p>
            <span style="color: red">TV가 안나오고 "방송신호가 없습니다"메시지가 뜰 경우, 아래 순서로 확인하시면 해결할 수 있습니다</span><br>
            <span style="color: red">1. 셋톱박스 전원상태 확인</span><br>
            <span style="color: red">2. TV와 셋톱박스의 연결선 확인</span><br>
            <span style="color: red">3. 셋톱박스 리모컨으로 외부입력 전환</span><br>
            <span style="color: red">현재 사용하시는 리모컨 이미지를 누르시면, 자세한 안내 페이지로 이동합니다.</span><br>
          </p>
          <div class="remoteBox">
          <a class="remote">
          <img src="/resources/img/리모컨1.png">
          </a>
          <a class="remote">
          <img src="/resources/img/리모컨2.png">
          </a>
          <a class="remote">
          <img src="/resources/img/리모컨3.png">
          </a>
          </div>
       </div>
       
       
    <div id="internetBox" style="display: none">
    <hr>
    <h1>자주 묻는 질문</h1>
      <div class="accordion accordion-flush" id="accordionFlushExample">
     <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        <strong>결제 계좌 및 결제 방법을 변경하려면 어떻게 해야 하나요?</strong>
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><span>＊ 자동이체 계좌를 변경할 경우 고객센터를 통해 변경가능합니다.</span><br>
            <span>＊ 카드결제변경의 경우 고객센터 또는 오케이렌탈 홈페이지 >> 렌탈서비스 신청 >> 결제카드변경에서 변경 가능합니다.</span></div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        <strong>설치점 또는 관리점 연락처를 어떻게 확인 가능한가요?</strong><br>
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><span>＊ 설치점/관리점은 고객센터를 통해 연락처 확인 가능합니다.</span><br>
            <span>＊ 또는 오케이렌탈 홈페이지 >> 렌탈서비스 신청 >> 설치점/관리점 연락처 조회에서 확인가능합니다.</span></div>
  </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        <strong>이전 설치 접수는 어떻게 해야 하나요?</strong><br>
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"> <span>＊ 이전설치 접수할경우 고객센터를 통해 접수 가능합니다.</span><br>
            <span>＊ 또는 오케이렌탈 홈페이지 >> 렌탈서비스 신청 >> 이전설치 신청/조회에서 접수가능합니다</span></div>
  </div>
</div>
       </div>
                 </div>
                 </div>
                 
     <div id="rentalBox" style="display: none">
        <hr>
          <h1>셀프해결 가이드</h1>
          <p>오케이렌탈 AS는 어떻게 진행되나요?</p>
          <p>
            <strong style="color: red">오케이렌탈 제품의 A/S는 기본적으로 각 제조사별 품질 보장 기간에 의거해 제조사 A/S센터를 통해 무상 A/S 서비스가 진행됩니다. </strong><br>
            <span>다만, 개인가입고객들은 제품별 청약내용에 따라 당사 계약체결 시점 후 13~36개월차까지 LG헬로비전을 통해 공급사 유상수리 후 </span><br>
            <span>수리내역과 영수증, 고장수리 보험 신청서 (당사 청약 명의자)를 제출하시면 기준에 의해 수리비용을 보상 받을 수 있습니다.</span><br>
            <span>(단, 고객 과실이나 천재지변에 의한 A/S는 공급사 정책에 따라 유상수리입니다)</span><br>
          </p><br>
          <p>
             <span>■ 대상상품 : 일부 상품군 (품목확인은 렌탈전담센터 1855-1020 문의)</span><br>
             <span>■ 보험혜택 : 1회 한도 50만원, 연간 한도 200만원 (회선당)</span><br>
          </p><br>
          <p>
             <span>※ 청약 제품별 고장수리비 적용 여부가 다르니 확인 부탁드립니다.</span><br>
          </p><br>
          <p>
             <span>■ 19년 8/29이후 가입자 대상 신청절차 : ①대상상품 확인(홈페이지) → ②가전사 유상수리 진행 → ③판정서 및 영수증 구비 → </span><br>
             <span>    ④렌탈전담센터 전화(1855-1020) → ⑤납부서류 제출 → ⑥보상처리(심사완료 후 최대 30일 이내 입금 완료</span><br>
             <span>■ 19년 8/28이전 가입자 대상 신청절차 : ①대상상품 확인(홈페이지) → ②가전사 유상수리 진행 → ③판정서 및 영수증 구비 → </span><br>
             <span>    ④AIG손해보험 전화(1588-1794) → ⑤납부서류 제출 → ⑥보상처리(심사완료 후 최대 30일 이내 입금 완료</span><br>
          </p><br>
       </div>
       
       <div id="telBox" style="display: none">
        <hr>
          <h1>셀프해결 가이드</h1>
          <p>통화가 끊기거나 잡음이 들리는 경우</p>
          <p>
            <span style="color: red">01 전화기의 무선신호 속도를 측정해보세요.</span><br>
            <span>전화기 화면 상단에 그림과 같이 통화불가 표시가 계속 된다면 무선랜 재설정을 통해 간단하게 해결이 가능합니다.</span><br>
          </p>
          <div class="remoteBox">
          <a class="remote">
          <img src="/resources/img/전화1.png" class="remoteImg">
          </a>
          </div>
          <p>
            <span style="color: red">02 공유기 위치 및 상태를 확인해보세요.</span><br>
            <span>※ 램프에 문제가 있다면 공유기 전원을 뽑았다가 다시 꽂아보세요.</span><br>
          </p>
          <div class="remoteBox">
          <a class="remote">
          <img src="/resources/img/전화2.png" class="remoteImg">
          </a>
          </div>
       </div>
    <script src="/resources/js/HF.js"></script>
    <script type="text/javascript" src="/resources/js/consult/csCenter.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		var navBar = document.getElementById('nav-bar');
		var navBtn = document.getElementById('nav-btn');

		navBtn.addEventListener('mouseenter', function() {
			navBar.style.width = '300px';
		});

		navBar.addEventListener('mouseleave', function() {
			navBar.style.width = '0';
		});
	</script>
  </body>
</html>