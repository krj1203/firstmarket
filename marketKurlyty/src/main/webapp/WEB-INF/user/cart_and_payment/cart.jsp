<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<style>
#main {
	min-height: 100vh
}
</style>
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/cart_and_payment/cart.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div class="tit_page">
						<h2 class="tit">장바구니</h2>
					</div>
					<div id="main">
						<div id="content">
							
							
							<!-- 상품목록이 없을때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
							<h3 class="screen_out">장바구니 상품 목록</h3>
							<form>
								<div id="cartItemList" class="only_pc" style="min-height: 557px;">
									<div class="empty">
										<div class="cart_item no_item">
											<div class="cart_select">
												<div class="inner_select">
													<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
														<span class="ico"></span>전체선택 (0/0)
													</label>
													<a href="#none" class="btn_delete">선택삭제</a>
												</div>
											</div>
											<div class="inner_empty">
												<span class="bg"></span>
												<p class="txt">장바구니에 담긴 상품이 없습니다</p>
												<div class="btn_submit">
													<button type="button" class="btn disabled">상품을담아주세요</button>
												</div>
											</div>
											<div class="cart_select">
												<div class="inner_select">
													<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
													<span class="ico"></span>전체선택 (0/0)</label>
													<a href="#none" class="btn_delete">선택삭제</a>
												</div>
											</div>
										</div>
										<div class="cart_result">
											<div class="inner_result" style="top: 60px;">
												<div class="cart_delivery">
													<h3 class="tit">배송지</h3>
													<div class="no_address">
														<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!
														<a href="#" class="btn default"><span class="ico"></span>주소 검색</a>
													</div>
												</div>
												<div class="amount_view">
													<dl class="amount">
														<dt class="tit">상품금액</dt>
														<dd class="price">
															<span class="num">0</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">상품할인금액</dt>
														<dd class="price">
															<span class="num">0</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">배송비</dt>
														<dd class="price">
															<span class="num">0</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount lst">
														<dt class="tit">결제예정금액</dt>
														<dd class="price">
															<span class="num">0</span><span class="won">원</span>
														</dd>
													</dl>
													<div class="reserve"></div>
												</div>
												<div class="btn_submit">
													<button type="submit" class="btn disabled">상품을 담아주세요</button>
												</div>
												<div class="notice">
													<span class="txt"><span class="ico">·</span>
														‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
													<span class="txt">
													
													<span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>

							<form id="viewCart" name="frmCart" method="post" action="/shop/order/order.php">
								<input type="hidden" name="mode" value="setOrder">
							</form>
							<script src="/appProxy/appData.php?ver=1.40.4"></script>
							<script src="/asset/js/cart/list.bundle.js?ver=1.40.4"></script>
							<script>
  _cart.showItemList('pc');

  /**
   * 스크롤 이벤트 : CartContainer.jsx 에서 호출
   * 스크립트 재시작 요건
   * 아이템 삭제시
   * 주소가 변경시
   * 목록접을때
   * 위치 값이 달라지는 경우
   * .off('scroll') 을 사용할수 없음. gnb 때문에
   */
  function resultPosition() {
    var objTarget = {};

    objTarget = {
      winHeight: $(window).height(),
      gnbHeight: $('#gnbMenu').height(),
      moveBox: $('.cart_result').find('.inner_result'),
      boxHeight: $('.cart_result').find('.inner_result').height(),
      baseTop: $('#cartItemList').offset().top - $('#gnbMenu').height()
    }

    var _position = {
      scroll: function(){
        var that = this, num = 0;
        $(window).scroll(function () {
          num = $(this).scrollTop().toFixed(0);
          that.scrollEvent(num);
        }).scroll();
        if(num === 0){
          that.scrollEvent(num);
        }
      },
      scrollEvent: function(num){
        num = num - objTarget.baseTop + objTarget.gnbHeight;
        var baseHeight = $('#cartItemList').height();
        var resultBox = baseHeight - objTarget.boxHeight;
        if(objTarget.boxHeight > objTarget.winHeight || baseHeight <= objTarget.boxHeight){
          num = 0;
          $('#cartItemList').css({'minHeight' : objTarget.boxHeight});
        }
        if(num > resultBox){
          num = resultBox;
        }
        objTarget.moveBox.css({ top: num <= 60 ? 60 : num });
      }
    }

    _position.scroll();
  }

  KurlyTracker.setScreenName('cart');

  function reloadAction(){
    location.reload();
  }
</script>
						</div>
					</div>

<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
					<!-- 상품목록이 있을때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<!-- 					<form>
						<div id="cartItemList" class="only_pc">
							<div class="">
								<div class="cart_item ">
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox"
												name="checkAll" checked=""><span class="ico"></span>전체선택
												(5/5)</label><a href="#none" class="btn_delete">선택삭제</a>
										</div>
									</div>
									<div class="box cold">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>냉장
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"><input
														type="checkbox"
														id="chkItem9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														name="chkItem"
														data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														data-item-no="30559" data-item-parent-no="30559"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[KF365] 애호박 1개</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1631668505211i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">1,650<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
																	data-item-no="30559" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
																	data-item-no="30559" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														data-item-no="30559" data-type="cold">상품 삭제</button>
												</div></li>
											<li><div class="item">
													<label class="check"
														for="chkItem8f8ff416-87e9-4b3a-b08a-748a80dc9c68"><input
														type="checkbox"
														id="chkItem8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														name="chkItem"
														data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														data-item-no="63110" data-item-parent-no="63110"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[연세우유 x 마켓컬리] 전용목장우유</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610086510346i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">1,850<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
																	data-item-no="63110" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
																	data-item-no="63110" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														data-item-no="63110" data-type="cold">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="box frozen">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>냉동
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem2fdb2390-1f15-451e-bfb3-4f5955e39ad3"><input
														type="checkbox"
														id="chkItem2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														name="chkItem"
														data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														data-item-no="27444" data-item-parent-no="27449"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[남향푸드또띠아] 콤비네이션 피자 브리또</a><a
																href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">2,900<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
																	data-item-no="27444" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
																	data-item-no="27444" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														data-item-no="27444" data-type="frozen">상품 삭제</button>
												</div></li>
											<li><div class="item">
													<label class="check"
														for="chkItemc35d890b-debc-4108-8612-54e53405cb3f"><input
														type="checkbox"
														id="chkItemc35d890b-debc-4108-8612-54e53405cb3f"
														name="chkItem"
														data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
														data-item-no="27448" data-item-parent-no="27449"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[남향푸드또띠아] 핫 치킨 브리또</a><a
																href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">2,900<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
																	data-item-no="27448" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
																	data-item-no="27448" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
														data-item-no="27448" data-type="frozen">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="box room">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>상온
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem9841183c-8365-4a52-ae1e-7eb831f25fff"><input
														type="checkbox"
														id="chkItem9841183c-8365-4a52-ae1e-7eb831f25fff"
														name="chkItem"
														data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
														data-item-no="48865" data-item-parent-no="48866"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[아토앤오투] 바른 손소독제 500ml</a><a
																href="#" class="product ">[아토앤오투] 바른 손소독제 2종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1581924872593i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">19,800<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
																	data-item-no="48865" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
																	data-item-no="48865" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
														data-item-no="48865" data-type="room">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox"
												name="checkAll" checked=""><span class="ico"></span>전체선택
												(5/5)</label><a href="#none" class="btn_delete">선택삭제</a>
										</div>
									</div>
								</div>
								<div class="cart_result">
									<div class="inner_result" style="top: 60px;">
										<div class="cart_delivery">
											<h3 class="tit">배송지</h3>
											<div class="no_address">
												<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!<a
													href="#" class="btn default"><span class="ico"></span>주소
													검색</a>
											</div>
										</div>
										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price">
													<span class="num">29,100</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">상품할인금액</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>
											<div class="no_sale">로그인 후 할인 금액 적용</div>
											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num plus">3,000</span><span class="won">원</span>
												</dd>
											</dl>
											<p class="free_limit">
												10,900원 추가주문 시, <strong>무료배송</strong>
											</p>
											<dl class="amount lst">
												<dt class="tit">결제예정금액</dt>
												<dd class="price">
													<span class="num">32,100</span><span class="won">원</span>
												</dd>
											</dl>
											<div class="reserve">
												<span class="bage">적립</span>로그인 후 회원등급에 따라 적립
											</div>
										</div>
										<div class="btn_submit">
											<button type="submit" class="btn disabled">배송지를
												입력해주세요</button>
										</div>
										<div class="notice">
											<span class="txt"><span class="ico">·</span>‘입금확인’ 상태일
												때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span><span class="txt"><span
												class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
 -->

				</div>
			</div>
		</div>
		
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>