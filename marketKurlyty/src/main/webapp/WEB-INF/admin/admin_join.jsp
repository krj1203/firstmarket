<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/default/top.jsp"></jsp:include>
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/ItemListStyle.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script>
function zip(){
	var myAddress;
	var myZipcode;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#zip").val(myZipcode)
			$("#addr1").val(myAddress);
			$(".hid").attr("class",".addressShow");
		}
	}).open();
}
function validateEmail(email){
	var emailReg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
	return emailReg.test(email);
}
function formJoinSubmit(){

	if(document.frmAdmin.admin_id.value==""){
		alert("아이디를 입력하세요.");
		document.frmAdmin.admin_id.focus();
		return;
	}
	
	if(document.frmAdmin.chk_id.value=="불가능"){
		alert("중복된 아이디는 사용할 수 없습니다.");
		document.frmAdmin.user_id.focus();
		return;
	}

	if(document.frmAdmin.admin_pw.value==""){
		alert("비밀번호를 입력하세요.");
		document.frmAdmin.admin_pw.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw_check.value==""){
		alert("비밀번호 확인을 입력하세요.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw.value!=document.frmAdmin.admin_pw_check.value){
		alert("비밀번호를 다시 확인해 주세요.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_name.value==""){
		alert("이름을 입력하세요.");
		document.frmAdmin.admin_name.focus();
		return;
	}
	
	if(document.frmAdmin.admin_email.value==""){
		alert("이메일을 입력하세요.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(!validateEmail(document.frmAdmin.admin_email.value)){
		alert("올바른 이메일을 입력해 주세요.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(document.frmAdmin.admin_phone.value==""){
		alert("전화번호를 입력하세요.");
		document.frmAdmin.admin_phone.focus();
		return;
	}
	
	if(document.frmAdmin.admin_address1.value==""){
		alert("주소를 입력하세요.");
		document.frmAdmin.admin_address1.focus();
		return;
	}

	if(document.frmAdmin.admin_address2.value==""){
		alert("상세주소를 입력하세요.");
		document.frmAdmin.admin_address2.focus();
		return;
	}

	document.frmAdmin.submit();
}
function chkId(){
	var id = document.frmAdmin.admin_id.value;
	$.ajax({
		url:"idCheck.mdo?admin_id="+id,
		datatype:"json",
		success:function(res){
			const data = JSON.parse(res);
			alert(data.message);
			$("#posibleId").val(data.usedId);
		}
	})
}

</script>
<body>
	<div class="page_aticle">
		<div class="type_form member_join ">
			<form id="form" name="frmAdmin" method="post" action="joinProc.mdo" novalidate="">

				<table class="tbl_comm">
						<tr class="fst">
							<th>아이디</th>
							<td>
								<input type="text" name="admin_id" value="" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
								<input id="posibleId" type="hidden" name="chk_id" value="불가능">
								<a class="btn default" href="javascript:chkId()">중복확인</a>
							</td>
						</tr>

						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="admin_pw" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
							</td>
						</tr>

						<tr class="member_pwd">
							<th>비밀번호확인</th>
							<td>
								<input type="password" name="admin_pw_check" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
							</td>
						</tr>

						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="admin_name" value="" placeholder="이름을 입력해주세요">
							</td>
						</tr>

						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="admin_email" value="" data-email="" size="30" label="이메일" placeholder="">
							</td>
						</tr>
						
						<tr class="field_phone">
							<th>휴대폰</th>
							<td>
								<div class="phone_num">
									<input type="text" value="" pattern="[0-9]*" name="admin_phone" placeholder="숫자만 입력해주세요" class="inp">
								</div>
							</td>
						</tr>

					<tr class="fst">
						<th>주소</th>
						<td>
							<input id="addr1" type="text" name="admin_address1" value="" >
							<a class="btn default" href="javascript:zip()">주소검색</a><br><br>
							<input id="addr2" type="text" name="admin_address2" value="" placeholder="나머지 주소를 입력해주세요" >
							
						</td>
						
					</tr>
					<tr class="select_sex">
						<th>직급</th>
						<td>
							<label class="">
								<input type="radio" name="admin_position" value="master">
								<span class="ico"></span>Master
							</label>
							
							<label class="">
								<input type="radio" name="admin_position" value="senior" >
								<span class="ico"></span>Senior
							</label>
							
							<label class="checked">
								<input type="radio" name="admin_position" value="junior" checked="checked">
								<span class="ico"></span>Junior
							</label>
						</td>
					</tr>
				</table>
				<div id="formSubmit" class="form_footer">
					<button type="button" class="btn active btn_join" onclick="formJoinSubmit()">가입하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>