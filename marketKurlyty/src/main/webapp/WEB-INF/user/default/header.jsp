<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"categoryData.do",
			datatype:"json",
			success:function(res){
				console.log(res)
				const data = JSON.parse(res);
				for(key in data){
					var rink = "categoryGoods.do?category_main_serial="+data[key].serial;
					$(".gnb_sub ul.gnb_menu").
					append("<li class="+data[key].serial+"><a href="+rink+" class='menu'><span class='icon'><img src='${pageContext.request.contextPath }/resources/images/"+data[key].iconBlack+".png' class='icon_on'>"+
							"<img src='${pageContext.request.contextPath }/resources/images/"+data[key].iconColor+".png' class='icon_off'></span>"+
							"<span class='name'>"+data[key].name+"</span></a></li>");
					$(".gnb_sub ul.gnb_menu").find("li."+data[key].serial).append("<ul class='sub'></ul>");
					for(sub in data[key].data){
						var parentSerial = "categoryGoods.do?category_main_serial="+data[key].serial+"&category_sub_serial="+data[key].data[sub].serial;
						$("ul.gnb_menu li."+data[key].serial).find("ul").
						append("<li><a class='sub' href="+parentSerial+"><span>"+data[key].data[sub].name).
						append("</span></a></li>")
					}
					$("#categoryMain li").mouseover(function(){
						$(this).css("background","#efebf0");
						$(this).find("img:eq(0)").attr("class","icon_off");
						$(this).find("img:eq(1)").attr("class","icon_on");
						$(this).find(".name").css("color","#8700a8");
						$(this).find("ul").attr("class", "sub_on");
						$(".gnb_sub").css("width","438");
						$("#categoryMain ul.sub_on").find("li").mouseover(function(){
							$(this).attr("class","on");
						});
						$("#categoryMain ul.sub_on").find("li").mouseleave(function(){
							$(this).attr("class","");
						});
					});
					$("#categoryMain li").mouseleave(function(){
						$(this).css("background","none");
						$(this).find("img:eq(0)").attr("class","icon_on");
						$(this).find("img:eq(1)").attr("class","icon_off");
						$(this).find(".name").css("color","black");
						$(this).find("ul").attr("class","sub");
						$(".gnb_sub").css("width","219");
						$("#categoryMain ul.sub_on").find("li").mouseover(function(){
							$(this).attr("class","on");
						});
						$("#categoryMain ul.sub_on").find("li").mouseleave(function(){
							$(this).attr("class","");
						});
					});
					$("#categoryMain ul.sub_on").mouseover(function(){
						$(this).attr("class","on");
					});
					$("#categoryMain ul.sub_on").mouseleave(function(){
						$(this).attr("class","");
					});
				}
			}
			
		});
		$(".menu1").hover(function(){
			$(".gnb_sub").css("display","block");
		});
		$(".menu1").mouseleave(function(){
			$(".gnb_sub").css("display","none");
		});
		$(".gnb_sub").hover(function(){
			$(this).css("display","block");
		});
		$(".gnb_sub").mouseleave(function(){
			$(this).css("display","none");
		});
		
	});
	
	
</script>
<style>
.icon_off {
	display: none;
}

.icon_on {
	display: block;
}

.gnb_sub ul.gnb_menu .icon {
	float: left;
	width: 24px;
	height: 24px;
}

.gnb_sub ul.gnb_menu .name{
	float: left;
	width: 100px;
	height: 24px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 15px;
	line-height: 1.7;
}

.gnb_sub ul.gnb_menu li {
	text-align: left;
}

ul.sub {
	position:absolute;
	z-index:0;
	left:200px;
	top:0px;
	width:248px;
	height:100%;
	padding: 0 0 0 20px;
	opacity:0;
	transition:opacity 0.2s;
}
ul.sub_on{
	position:absolute;
	z-index:1;
	left:200px;
	top:0px;
	width:248px;
	height:100%;
	padding: 0 0 0 20px;
	opacity:1;
	transition:opacity 0.5s;
}
.gnb_sub ul.gnb_menu li ul li {
	width: 100px;
	height: 24px;
	margin-left: 10px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 14px;
	line-height: 2;
}
ul.sub_on li.on{
	text-decoration:underline;
	color:#8700a8;
}
</style>
<div id="header">
	<!-- 헤더부분 -->

	<div class="bnr_header" id="top-message">
		<a
			href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_211006"
			id="eventLanding"> 지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img
			src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png"
			class="bnr_arr">
			<div class="bnr_top">
				<div class="inner_top_close">
					<button id="top-message-close" class="btn_top_bnr">가입하고
						혜택받기</button>
				</div>
			</div>
		</a>

	</div>
	<!-- 우측 최상단 메뉴 -->
	<div id="userMenu">
		<ul class="list_menu">
			<li class="menu none_sub menu_join"><a
				href="join.do" class="link_menu">회원가입</a></li>
			<li class="menu none_sub menu_login"><a
				href="/shop/member/login.php" class="link_menu">로그인</a> <!----></li>
			<!---->
			<li class="menu lst"><a href="/shop/board/list.php?id=notice"
				class="link_menu">고객센터</a>
				<ul class="sub">
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/board/list.php?id=notice', 'select_my_kurly_notice_list')">공지사항</a>
					</li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/service/faq.php', 'select_my_kurly_frequently_qna')">자주하는
							질문</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/mypage_qna.php', 'select_my_kurly_personal_inquiry_history')">1:1
							문의</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')">대량주문
							문의</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')">상품
							제안</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')">에코포장
							피드백</a></li>
				</ul></li>
		</ul>
	</div>

	<div id="headerLogo" class="layout-wrapper">
		<h1 class="logo">
			<a href="index.do" class="link_main"> <span
				id="gnbLogoContainer"></span> <img src="${pageContext.request.contextPath }/resources/images/logo.png"
				alt="마켓컬리 로고">
			</a>
		</h1>
		<a href="/shop/board/view.php?id=notice&no=64"
			onclick="ga('send','event','etc','main_gif_btn_click');"
			class="bnr_delivery"> <img
			src="https://res.kurly.com/pc/service/common/2011/delivery_210801.png"
			alt="샛별, 택배 배송안내" width="121" height="22">
		</a>
	</div>
	<div id="gnb">
		<h2 class="screen_out">메뉴</h2>
		<div id="gnbMenu" class="gnb_kurly">
			<div class="inner_gnbkurly">
				<div class="gnb_main">
					<ul class="gnb">
						<li class="menu1" class="on"><a href="#none"><span
								class="ico"></span><span class="txt">전체 카테고리</span></a></li>
						<li class="menu2"><a class="link new "
							href="newGoodsPage.do"><span class="txt">신상품</span></a></li>
						<li class="menu3"><a class="link best " href="BestGoodsPage.do"><span
								class="txt">베스트</span></a></li>
						<li class="menu4"><a class="link bargain "
							href="altleShopping.do"><span class="txt">알뜰쇼핑</span></a></li>
						<li class="lst"><a class="link event "
							href="/shop/goods/event.php?&"><span class="txt">특가/혜택</span></a></li>
					</ul>
					<div id="side_search" class="gnb_search">
						<form action="/shop/goods/goods_search.php?&"
							onsubmit="return searchTracking(this)">
							<input type=hidden name=searched value="Y"> <input
								type=hidden name=log value="1"> <input type=hidden
								name=skey value="all"> <input type="hidden"
								name="hid_pr_text" value=""> <input type="hidden"
								name="hid_link_url" value=""> <input type="hidden"
								id="edit" name="edit" value=""> <input name="sword"
								type="text" id="sword" class="inp_search" value="" required
								label="검색어" placeholder="검색어를 입력해주세요."> <input
								type=image
								src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
								class="btn_search">
							<div class="init">
								<button type="button" class="btn_delete" id="searchInit">검색어
									삭제하기</button>
							</div>
						</form>

					</div>
					<div class="cart_count">
						<div class="inner_cartcount">
							<a href="/shop/goods/goods_cart.php" class="btn_cart"> <span
								class="screen_out">장바구니</span> <span
								class="num realtime_cartcount" id="cart_item_count"></span>
							</a>
						</div>
						<div id="addMsgCart" class="msg_cart">
							<span class="point"></span>
							<div class="inner_msgcart">
								<img src="https://res.kurly.com/images/common/bg_1_1.gif" alt=""
									class="thumb">
								<p id="msgReaddedItem" class="desc">
									<span class="tit"></span> <span class="txt"> 장바구니에 상품을
										담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
									</span>
								</p>
							</div>
						</div>
					</div>
					<div class="location_set">
						<button type="button" class="btn_location on">배송지 설정하기</button>
						<div class="layer_location" style="display: none"></div>
					</div>
				</div>
				<div class="gnb_sub">
					<div class="inner_sub">
						<ul id="categoryMain"
							class="gnb_menu size_over" style="height: 200.833px;">
							<!-- <li class=""><a class="menu on"><span class="ico"><img
										src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png"
										alt="카테고리 아이콘" class="ico_off"> <img
										src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png"
										alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span
										class="txt">채소</span></span></a>
								<ul class="sub_menu">
									<li class=""><a class="sub"><span class="name">친환경</span></a>
										</li>
									<li><a class="sub"><span class="name">고구마·감자·당근</span></a>
										</li>
									<li><a class="sub"><span class="name">시금치·쌈채소·나물</span></a>
										</li>
									<li><a class="sub"><span class="name">브로콜리·파프리카·양배추</span></a>
										</li>
									<li><a class="sub"><span class="name">양파·대파·마늘·배추</span></a>
										</li>
									<li><a class="sub"><span class="name">오이·호박·고추</span></a>
										</li>
									<li><a class="sub"><span class="name">냉동·이색·간편채소</span></a>
										</li>
									<li><a class="sub"><span class="name">콩나물·버섯</span></a></li>
								</ul></li>
							<li class=""><a class="menu"><span class="ico"><img
										src="https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png"
										alt="카테고리 아이콘" class="ico_off"> <img
										src="https://img-cf.kurly.com/shop/data/category/icon_fruit_active_pc@2x.1568684150.png"
										alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span
										class="txt">과일·견과·쌀</span></span></a>
								<ul class="sub_menu">
									<li class=""><a class="sub"><span class="name">친환경</span></a>
										</li>
									<li><a class="sub"><span class="name">제철과일</span></a></li>
									<li><a class="sub"><span class="name">국산과일</span></a></li>
									<li><a class="sub"><span class="name">수입과일</span></a></li>
									<li><a class="sub"><span class="name">간편과일</span></a></li>
									<li><a class="sub"><span class="name">냉동·건과일</span></a></li>
									<li><a class="sub"><span class="name">견과류</span></a></li>
									<li><a class="sub"><span class="name">쌀·잡곡</span></a></li>
								</ul>
							</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>