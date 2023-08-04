<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/HF.css">
<link rel="stylesheet" href="/resources/css/product/detail.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="/resources/css/slide.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body style="scroll-padding-bottom: 100px;">
	<header>
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
								<br>
								<a href="/consult/register">상담신청</a>
								
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
		
		<!-- id container는 화면 중앙 상단에 위치  -->
		<div class="nav">
			<div class="center-items">
				<a href="/product/list?type_a=정수기"><p>Water purifier</p></a> 
				<a href="/product/list?type_a=공기청정기"><p>Air purifier</p></a> 
				<a href="/product/list?type_a=제습기"><p>Dehumidifier</p></a> 
				<a href="/product/list?type_a=에어컨"><p>Air Conditioner</p></a>
				<a href="/product/list?type_a=텔레비전"><p>Television</p></a>
			</div>
		</div>
		<br>

	</header>
	
	<c:set var="pvo" value="${product.pvo }"></c:set>
	<c:set var="comment" value="${list }"></c:set>
	<c:set var="flist" value="${product.flist }"></c:set>
	<!-- 파일 관련 c:set -->
	<div class="outBox">
	<div id="productImage">
	
	</div>
	<div class="productName" id="productName">
	<div class="productInnerBox">
		<div class="productBox">		
			<c:forEach items="${flist }" var="file">
				<c:if test="${file.fileCategoryNum == 0}">  
					<img class="productMainImg" alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_th_${file.file_name}">   		
				</c:if>
			</c:forEach>
		</div>
	<div id="productOption" class="productOption">
		<div class="productOptionBox">
		<span class="productTitle">상품정보</span>
		<div class="product">
		<span class="productNo">상품 번호 : ${pvo.pno }</span><br>
<%-- 		<span id="productBrand">${product.pmade }</span>
		<span id="productUuid">${product.uuid }</span> --%>
		<strong class="productName1">상품 이름 : ${pvo.pname }</strong><br>
		<span class="productPrice">상품 가격 : ${pvo.price }원</span>
		</div>		
		</div>
		<!-- 납부기간 -->
		<div class="optionPayment" id="optionPayment">
			<div class="paymentPlan">
				<span class="paymentPlanTitle">납부기간</span>
				<div class="paymentBox">
				<button type="button" id="paymentOption01" class="paymentOption" value="${pvo.price }">36개월</button>
				<button type="button" id="paymentOption02" class="paymentOption" value="${pvo.price }">48개월</button>
				<button type="button" id="paymentOption03" class="paymentOption" value="${pvo.price }">60개월</button>
				</div>
			</div>
		</div>
		<!-- 할인 -->
		<div id="optionDiscount">
			<span id="discountSelect"></span>
		</div>
		<!-- 최종 가격 -->
	<div class="priceBox">
			<span class="priceTitle">최종가격</span>
		<div class="optionTotalSum">
			<div class="sumTop">
				<span id="sumText1">상품가격</span>
				<div class="rightText">
				<span id="productPrice">${pvo.price }</span>
				<span id="sumText2">원</span><br>
				</div>
			</div><hr>
			<div class="sumBottom">
				<b id="finalSumText">최종 혜택가</b>
				<div class="rightText">
				<span id="month">월</span>
				<span id="finalPrice"></span>
				</div>
			</div>
	</div>
		</div>
	</div>
	</div>
	</div>
		<!-- 할인 광고 -->
		<img src="/resources/img/discountCardImg.png" class="discountCardImage" id="discountCard">
	<div class="bottomMain">
			<ul class="bottomUl">
				<li class="active"><a href="#" id="detailBox" class="activeBox">상세 정보</a></li>
				<li class="active"><a href="#" id="specBox" class="activeBox">상품 스펙</a></li>
				<li class="active"><a href="#" id="cardBox" class="activeBox">할인 카드</a></li>
			</ul>
	</div>
	
	<!-- 상세정보(안에 리뷰도 같이 들어있음) -->
	<!-- 사이트 캡쳐 이미지 사용 -->
	<div id="detailContent">
		<c:forEach items="${flist }" var="file">
			<c:if test="${file.fileCategoryNum == 1}">  
				<img class="productImg" alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_${file.file_name}">   		
			</c:if>
		</c:forEach>
		
<%-- 		<!-- 상세정보 안에 추천 상품(넣어도 되고 빼도 됨) -->
		<div id="addDiscount">
			<span>함께 비교하면 좋은 상품이에요</span>
			<ul>
				<li>
					<a href="/product/detail?pno=${product.pno }">
						<div id="addDiscountListBottom">
							<strong id="brandName">${product.pmade }</strong>
							<div id="productName">${product.pname }</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div id="addDiscount">
			<span>지금 가장 주목 받는 상품이에요</span>
			<ul>
				<li>
					<a href="/product/detail?pno=${product.pno }">
						<div id="addDiscountListBottom">
							<strong id="brandName">${product.pmade }</strong>
							<div id="productName">${product.pname }</div>
						</div>
					</a>
				</li>
			</ul>
		</div> --%>
		
		<!-- 리뷰 -->
		<div id="reviewList" class="reviewList">
			<div id="topWrap">
				<h6>사용자 총 평점</h6>
				<div id="scoreWrap">
					<div id="totalRating"></div>
				</div>
			</div>
			<br>
			<div class="listUpWrap">
				<div id="leftWrap">전체 리뷰 수</div>
				<span id="highlightTxt">
					<b id="countPrint"></b>
				</span>
			</div>
			<div class="userReview">
				<ul id="cmtListArea">
					<li id="listPagingShow">
					<span id="averageRateSpan"></span>
					</li>
				</ul>
			</div>
			
			<!-- 리뷰(댓글)작성 부분 -->
			<c:if  test="${ses.cid != null }">
			<form action="/comment/post" method="post">
			<div id="reviewWrite">
				<span id=cmtWriter>${ses.cid }</span>
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <span class="star">
  					★★★★★
  					<span>★★★★★</span>
 					<input type="range" oninput="Star(this)" id="targetRatingInput" value="1" step="2" min="0" max="10">
				</span>
                <div class="warningMsg">5자 이상으로 작성해 주세요.</div><br>
				<input type="text" id="cmtText" class="textArea">
				<button type="button" id="cmtPostBtn">리뷰 작성하기</button>
			</div>
			</form>
			</c:if>
			
		</div>
	</div>
	
	<!-- 상품 스펙 -->
	<!-- 사이트 캡쳐 이미지 사용 -->
	<div id="specContent" style="display: none">
		<c:forEach items="${flist }" var="file">
			<c:if test="${file.fileCategoryNum == 2}">  
				<img class="productSpec" alt="image" src="/upload/${fn:replace(file.save_dir, '\\','/') }/${file.uuid}_${file.file_name}">   		
			</c:if>
		</c:forEach>
	</div>
	
	<!-- 할인카드 -->
	<div class="cardNotice" id="cardNotice" style="display: none">
		<div class="cardNoticeBox" id="discountCover">
			<h4>헬로렌탈 할인카드란?</h4>
				<ul>
					<li>신용카드 이용 실적에 따라 매월 내는 렌탈료를 할인받는 혜택이예요.</li>
					<li>할인카드 발급한 다음 달 말일까지는 실적 없이도 할인이 적용됩니다.</li>
						<div id="coverData">
							<p>예)3/10 카드 발급 후 결제 수단으로 등록>실적 없이도 3/20자동
							이체, 4/20 자동이체 총 2회 할인 적용</p>
							<p>3/30 카드 발급 후 결제 수단으로 등록>실적 없이도 4/20 자동
							이체, 1회 할인 적용</p>
						</div>
					<li>3개월차 부터는 실적을 달성한 달은 할인이 자동 적용되지만, 실적이 없는 달은 할인이 되지 않아요.</li>
						<div id="coverData">
							<p>예)월 렌탈료 29,000원 상품 렌탈 후 하나 Simple Life 카드 발급 시</p>
							<p>30만원 이용한 달은 총 렌탈료에서 18,000원 자동 할인 >
							11,900원</p>
							<p>70만원 이용한 달은 총 렌탈료에서 20,000원 자동 할인>
							9,900원</p>
							<p>30만원 미만 이용한 달은 할인 없음 > 29,000원</p>
						</div>
				</ul>
		</div>
		<div id="discountIssou">
			<h4>할인카드 발급 방법이 궁금해요</h4>
				<ul>
					<li>LG헬로렌탈 할인카드 중 하나롷 신규 발급받으셔야 매월 할인 받으실 수 있어요!</li>
					<li>잊지 마세요! 카드를 발급받고 상품을 받으신 후에 LG헬로렌탈 할인카드를 납부 카드로 등록해주세요.</li>
				</ul>
		</div>
		<div id="discountPayment">
			<h4>결제 수단 변경 방법이 궁금해요</h4>
				<ul>
					<li>직접 변경 : LG 헬로비전 사이트(http://www.lghellovision.net/)접속 > 마이 헬로 > 요금조회/납부관리 > 납부방법 변경</li>
						<div class="btn">요금조회/납부관리 바로가기</div>
					<li>전화 요청 : 1855-1020 전화 > 헬로렌탈 > 요금 문의 후 상담원 통해 변경 요청</li>
				</ul>
		</div>
		<div id="discountRecommend">
			<h4>혜택이 가장 큰 할인카드로 추천해주세요</h4>
				<h5>하나 Simple Life</h5>
				<div id="cardContent">
					<img src="/resources/img/saleCard1.png" class="saleCard">
					<div id="textWrap">
						<div id="textWrap01">
							<span></span>
							<span></span>
						</div>
						<div id="textWrap02">
							<span id="text01"></span>
							<span id="text02"></span>
						</div>
						<div id="bottom-text">※ 30만원 이상 사용 시 1~24개월 18,000원 / 25개월부터 11,000원 할인 적용</div>
					</div>
				</div>
		</div>
	</div>
	</div>
	
	<!-- 하단 고정 -->
	<div class="skichyBar">
		<div class="total">
			<div class="totalTitle">최종 혜택가</div>
			<div class="totalPrice">
				<span class="month">월 </span>
				<span class="realFinalPrice" id="realFinalPrice"></span>
				<span class="won"></span>
			</div>
		</div>
		<div class="buttonWrap">
			<a href="/consult/register"><button class="blackBtn">상담신청</button></a>
			<a href="/reservation/calender"><button class="redBtn">예약 날짜 조회</button></a>
		</div>
	</div>
	<div class="pageUpBtn">
		<a href="#">
		<span class="material-symbols-outlined">north</span>
		</a>
	</div>
	
	<footer>
		<div class="footer">
			<div class="ft-logo">
				<img src="/resources/img/logo2.svg" alt="" width="50px"
					height="50px">
			</div>
			<div class="footinfo">
				<h6>©2023 Ok RENTAL. All Rights Reserved.</h6>
				<a href="#"><h6>RETURN POLICY</h6></a> <a href="#"><h6>TERMS
						& LEGAL</h6></a> <a href="#"><h6>PRIVACY NOTICE</h6></a>
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
	
	<script src="/resources/js/home.js"></script>
	<!-- ************************************************* -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>
		var TrandingSlider = new Swiper('.tranding-slider', {
			effect : 'coverflow',
			grabCursor : true,
			centeredSlides : true,
			loop : true,
			slidesPerView : 'auto',
			coverflowEffect : {
				rotate : 0,
				stretch : 0,
				depth : 100,
				modifier : 2.5,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}
		});
	</script>
	<script type="text/javascript">
    const pnoVal = `<c:out value="${pvo.pno}"/>`;
	console.log("pnoVal : "+pnoVal);
	</script>
	
	<script type="text/javascript" src="/resources/js/product/productDetail.js">
	</script>
	<script type="text/javascript">
	getCommentList(pnoVal);
	</script>
	<script src="/resources/js/HF.js"></script>
</body>
</html>