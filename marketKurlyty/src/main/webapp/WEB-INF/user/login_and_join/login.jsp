<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/coupon.css">
<script>
	window.onload = function() {
		document.form.m_id.focus();
	}

	function checkReCaptcha() {
		var $captcha = $("input[name=captcha]");
		if ($captcha.length > 0) {
			if (!$captcha.val()) {
				alert("인증번호를 입력해 주세요");
				$captcha.focus();
				return false;
			}
		} else {
			return true;
		}
	}

	// KM-1483 Amplitude
	KurlyTracker.setScreenName('login').setTabName('my_kurly');
</script>
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div id="content">

						<div id="qnb" class="quick-navigation"></div>
						<div class="section_login">
							<h3 class="tit_login">로그인</h3>
							<div class="write_form">
								<div class="write_view login_view">
									<form method="post" name="form" id="form" onsubmit="return checkReCaptcha();" action="/shop/member/login_ok.php">
										<input type="hidden" name="returnUrl" value="https://www.kurly.com/shop/member/join.php?return_url=https%3A%2F%2Fwww.kurly.com%2Fshop%2Fmypage%2Fmypage_orderlist.php">
										<input type="hidden" name="return_url" value="">
										<input type="hidden" name="close" value="">
										<input type="text" name="m_id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
										<input type="password" name="password" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
										<div class="checkbox_save">
											<label class="label_checkbox checked">
												<input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked" 
													onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
													보안접속
											</label>

											<div class="login_search">
												<a href="/shop/member/find_id.php" class="link">아이디 찾기</a>
												<span class="bar"></span>
												<a href="/shop/member/find_pwd.php" class="link">비밀번호 찾기</a>
											</div>
										</div>
										<button type="submit" class="btn_type1">
											<span class="txt_type">로그인</span>
										</button>
									</form>
									<a href="/shop/member/join.php" class="btn_type2 btn_member">
									<span class="txt_type">회원가입</span></a>
								</div>
							</div>
						</div>
						
					</div>


				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>