<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div class="section_login">
						<h3 class="tit_login">비밀번호 찾기</h3>
						<div class="write_form find_view">
							<form method="post" id="form" name="fm" action="" onsubmit="return chkForm( this );">
								<input type="hidden" name="act" value="Y">
								<input type="hidden" name="rncheck" value="none">
								<input type="hidden" name="dupeinfo" value="">
								<strong class="tit_label">이름</strong>
								<input name="srch_name" type="text" size="29" required="" label="이름" tabindex="2">
								<strong class="tit_label">아이디</strong>
								<input name="srch_id" value="" type="text" size="29" required="" label="아이디" tabindex="2">
								<p></p>
								<strong class="tit_label">이메일</strong> <input name="srch_mail" type="text" size="29" required="" label="메일주소" tabindex="5">
								<p></p>
								<button type="submit" class="btn_type1">
									<span class="txt_type">찾기</span>
								</button>
							</form>
						</div>
					</div>
					
					
					<!-- 비번찾기 성공↓↓↓↓↓↓↓ -->
					<!-- <div class="section_login">
						<h3 class="tit_login">비밀번호 찾기</h3>
						<div class="layer_parent">
							<div id="certPopLayer">
								<div id="certFrameLayer">
									<iframe id="certFrame" name="certFrame" src="about:blank" scrolling="no" frameborder="0"></iframe>
								</div>
								<div id="certPopLayerBG"></div>
							</div>
						</div>
						<div class="write_form find_view">
							<form name="certForm" method="post" action="">
								<input type="hidden" name="token" value="98d88ac8307d97ba84464a50ba23c576a5ccfc1ec002c58e5152162a18d903b8">
								<input type="hidden" name="m_id" value="dorres777">
								<input type="hidden" name="otp" value="">
								<img class="thumb" src="https://res.kurly.com/mobile/service/member/1908/img_pw_find_email.png" alt="이메일 찾기">
								<p class="desc">
									이메일로 인증 완료후 <br> 비밀번호를 재발급 받으세요!
								</p>
								<p class="info">입력하신 test********@daum.net 으로 인증번호가 발송되며, 인증
									후 비밀번호가 재발급됩니다. 전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>
								<a href="#none" class="btn_type1"><span class="txt_type">인증번호 받기</span></a>
							</form>
						</div>
					</div> -->
					
					<!-- 비번찾기 실패↓↓↓↓↓↓↓ -->
					<!-- alert사용! ('해당정보가 존재하지않습니다.')  -->

				</div>
			</div>
		</div>	
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>