<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담 신청</title>
<script src="https://kit.fontawesome.com/e927512ef5.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/resources/css/consult/consult.css">
<link rel="stylesheet" href="/resources/css/HF.css">
</head>
<body>
<!-- 헤더 -->
	<header style="width: 100%;">
		<div class="container">
			<div class="header">
				<a href="/home"> 
					<div class="logo-title">
						<img src="/resources/img/logo2.svg" alt="">
						<h1 class="title" style="color: #555;">OK Rental</h1>
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
								<br>
							</c:if>

							<!-- 로그인해야 수정 삭제가 보이게 -->
							<c:if test="${ses.cid != null }">
								<a href="/user/logout">로그아웃</a>
								<br>
								<a href="/user/modify">회원수정</a>
								<br>
								<a href="/user/delete">회원삭제</a>
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
				<form action="/product/search" method="get" style="margin: 0 auto;">
					<div class="search-container">
						<h1 style="color: white; text-align: center;">Quickly Search Site</h1>							
						<div class="search-box" style="text-align: center;">
							<input type="text" placeholder="Search.." name="search"
									class="search-input">
							<button type="submit" style="color: #555;">Search</button>
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
	<div>
		<h1 style="margin-top: 88px;">상담 신청</h1>
	</div>
	<form style="padding: 20px;" action="/consult/register" method="post" id="registerForm">
		<table>
			<tbody>
				<tr>
					<th>아이디 <span data-tooltip="필수항목"><i
							class="fa-solid fa-circle-exclamation fa-2xs"
							style="color: #ff0000;"></i></span>
					</th>
					<td><input type="text" name="csid" value="${ses.cid }" readonly="readonly"></td>
				</tr>
				<!-- 추가 -->
				<tr>
					<th>이름 <span data-tooltip="필수항목"><i
							class="fa-solid fa-circle-exclamation fa-2xs"
							style="color: #ff0000;"></i></span>
					</th>
					<td><input type="text" name="csname">
						<p id="csnameError" style="color: red; display: none;">이름을 입력해주세요.</p>
					</td>
				</tr>
				<tr>
					<th>핸드폰번호 <span data-tooltip="필수항목"><i
							class="fa-solid fa-circle-exclamation fa-2xs"
							style="color: #ff0000;"></i></span>
					</th>
					<td><input type="text" name="cstel">
						<p id="cstelError" style="color: red; display: none;">핸드폰번호를 입력해주세요.</p>
					</td>
				</tr>
				<!-- 추가 -->
				<tr>
					<th>상품이름 <span data-tooltip="필수항목"><i
							class="fa-solid fa-circle-exclamation fa-2xs"
							style="color: #ff0000;"></i></span>
					</th>
					<td>
						<select name="cstype" id="">
								<option value="" selected>선택</option>
								<option value="정수기">정수기</option>
								<option value="공기청정기">공기청정기</option>
								<option value="제습기">제습기</option>
								<option value="에어컨">에어컨</option>
								<option value="텔레비전">텔레비전</option>
						</select>
						<p id="cstypeError" style="color: red; display: none;">상품이름을 입력해주세요.</p>
					</td>
				</tr>
				<tr>
					<th>상담내용</th>
					<td><textarea name="cscontent" id="" cols="30" rows="10"></textarea>
						<p id="cscontentError" style="color: red; display: none;">상담내용을 입력해주세요.</p>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="subtitle">개인정보의 수집 및 이용에 대한 안내</div>
		개인정보의 처리 <span data-tooltip="필수항목"><i class="fa-solid fa-circle-exclamation fa-2xs"
			style="color: #ff0000;"></i></span> <span id="privacy-policy"
			style="cursor: pointer;" class="detail">자세히보기</span>
		<!-- ***************************************************************************************************************************************************************************************************** -->
		<div id="policy-modal" class="modal">
			<span id="close-button-policy" class="close">&times;</span>
			<div class="modal-content">
				<p>※ "개인정보"란 살아 있는 개인에 관한 정보로서 다음의 어느 하나에 해당하는 정보를 말합니다(「개인정보
					보호법」 제2조제1호). 1. 성명, 주민등록번호 및 영상 등을 통하여 개인을 알아볼 수 있는 정보 2. 해당
					정보만으로는 특정 개인을 알아볼 수 없더라도 다른 정보와 쉽게 결합하여 알아볼 수 있는 정보(이 경우 쉽게 결합할 수
					있는지 여부는 다른 정보의 입수 가능성 등 개인을 알아보는 데 소요되는 시간, 비용, 기술 등을 합리적으로 고려하여야
					함) 3. 가명처리함으로써 원래의 상태로 복원하기 위한 추가 정보의 사용·결합 없이는 특정 개인을 알아볼 수 없는 정보
					※ "가명처리"란 개인정보의 일부를 삭제하거나 일부 또는 전부를 대체하는 등의 방법으로 추가 정보가 없이는 특정 개인을
					알아볼 수 없도록 처리하는 것을 말합니다((「개인정보 보호법」 제2조제1호의2).</p>
			</div>
		</div>
		개인정보의 수집·이용 방법 <span data-tooltip="필수항목"><i class="fa-solid fa-circle-exclamation fa-2xs"
			style="color: #ff0000;"></i></span> <span id="privacy-policy1"
			style="cursor: pointer;" class="detail">자세히보기</span>

		<div id="policy-modal1" class="modal">
			<span id="close-button-policy1" class="close">&times;</span>
			<div class="modal-content">
				<p>개인정보의 수집·이용 개인정보처리자
				※ "개인정보"란 살아 있는 개인에 관한 정보로서 다음의 어느 하나에 해당하는 정보를 말합니다(「개인정보
					보호법」 제2조제1호). 1. 성명, 주민등록번호 및 영상 등을 통하여 개인을 알아볼 수 있는 정보 2. 해당
					정보만으로는 특정 개인을 알아볼 수 없더라도 다른 정보와 쉽게 결합하여 알아볼 수 있는 정보(이 경우 쉽게 결합할 수
					있는지 여부는 다른 정보의 입수 가능성 등 개인을 알아보는 데 소요되는 시간, 비용, 기술 등을 합리적으로 고려하여야
					함) 3. 가명처리함으로써 원래의 상태로 복원하기 위한 추가 정보의 사용·결합 없이는 특정 개인을 알아볼 수 없는 정보
					※ "가명처리"란 개인정보의 일부를 삭제하거나 일부 또는 전부를 대체하는 등의 방법으로 추가 정보가 없이는 특정 개인을
					알아볼 수 없도록 처리하는 것을 말합니다((「개인정보 보호법」 제2조제1호의2).</p>
			</div>
		</div>
		<div>
			<input type="checkbox">상담진행을 위해 개인정보 수집 및 이용에 동의 합니다.
		</div>

		<button onclick="validateButton(event)" type="submit"  style="margin-bottom: 108px;">상담신청</button>
	</form>
		<!-- 푸터 -->
	<footer>
		<div class="footer">
			<div class="ft-logo">
				<img src="/resources/img/images.png" alt="" width="50px"
					height="50px">
			</div>
			<div class="footinfo">
				<span><h6>©2023 Ok RENTAL. All Rights Reserved.</h6></span> <span><h6>RETURN
						POLICY</h6></span> <span><h6>TERMS & LEGAL</h6></span> <span><h6>PRIVACY
						NOTICE</h6></span>
			</div>
			<div class="footsns">
				<a href="https://www.facebook.com/login/?locale=ko_KR"><i
					class="fa-brands fa-facebook" style="color: #000000;"></i></a> <a
					href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i
					class="fa-brands fa-twitter" style="color: #000000;"></i></a> <a
					href="https://www.instagram.com/"><i
					class="fa-brands fa-instagram" style="color: #000000;"></i></a> <a
					href="https://github.com/login"><i class="fa-brands fa-github"
					style="color: #000000;"></i></a> <a href="https://discord.com/login"><i
					class="fa-brands fa-discord" style="color: #000000;"></i></a>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		console.log(registerForm);
		if (thereis === "1") {
			document.getElementById("registerForm").addEventListener("submit", function(e) {
		        e.preventDefault();
		    });
		}
	</script>
	<script type="text/javascript">
    document.getElementById("registerForm").addEventListener("submit", function(e) {
        var checkbox = document.querySelector('input[type="checkbox"]');
        if (!checkbox.checked) {
            e.preventDefault();
            alert("개인정보 수집에 동의해야 합니다.");
        }
    });
	</script>
	<script src="/resources/js/HF.js"></script>
	<script src="/resources/js/consult/consult.js"></script>
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