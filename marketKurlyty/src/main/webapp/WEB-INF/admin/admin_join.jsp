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
		alert("���̵� �Է��ϼ���.");
		document.frmAdmin.admin_id.focus();
		return;
	}
	
	if(document.frmAdmin.chk_id.value=="�Ұ���"){
		alert("�ߺ��� ���̵�� ����� �� �����ϴ�.");
		document.frmAdmin.user_id.focus();
		return;
	}

	if(document.frmAdmin.admin_pw.value==""){
		alert("��й�ȣ�� �Է��ϼ���.");
		document.frmAdmin.admin_pw.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw_check.value==""){
		alert("��й�ȣ Ȯ���� �Է��ϼ���.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw.value!=document.frmAdmin.admin_pw_check.value){
		alert("��й�ȣ�� �ٽ� Ȯ���� �ּ���.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_name.value==""){
		alert("�̸��� �Է��ϼ���.");
		document.frmAdmin.admin_name.focus();
		return;
	}
	
	if(document.frmAdmin.admin_email.value==""){
		alert("�̸����� �Է��ϼ���.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(!validateEmail(document.frmAdmin.admin_email.value)){
		alert("�ùٸ� �̸����� �Է��� �ּ���.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(document.frmAdmin.admin_phone.value==""){
		alert("��ȭ��ȣ�� �Է��ϼ���.");
		document.frmAdmin.admin_phone.focus();
		return;
	}
	
	if(document.frmAdmin.admin_address1.value==""){
		alert("�ּҸ� �Է��ϼ���.");
		document.frmAdmin.admin_address1.focus();
		return;
	}

	if(document.frmAdmin.admin_address2.value==""){
		alert("���ּҸ� �Է��ϼ���.");
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
							<th>���̵�</th>
							<td>
								<input type="text" name="admin_id" value="" maxlength="16" placeholder="6�� �̻��� ���� Ȥ�� ������ ���ڸ� ����">
								<input id="posibleId" type="hidden" name="chk_id" value="�Ұ���">
								<a class="btn default" href="javascript:chkId()">�ߺ�Ȯ��</a>
							</td>
						</tr>

						<tr>
							<th>��й�ȣ</th>
							<td>
								<input type="password" name="admin_pw" label="��й�ȣ" maxlength="16" class="reg_pw" placeholder="��й�ȣ�� �Է����ּ���">
							</td>
						</tr>

						<tr class="member_pwd">
							<th>��й�ȣȮ��</th>
							<td>
								<input type="password" name="admin_pw_check" maxlength="16" class="confirm_pw" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���">
							</td>
						</tr>

						<tr>
							<th>�̸�</th>
							<td>
								<input type="text" name="admin_name" value="" placeholder="�̸��� �Է����ּ���">
							</td>
						</tr>

						<tr>
							<th>�̸���</th>
							<td>
								<input type="text" name="admin_email" value="" data-email="" size="30" label="�̸���" placeholder="">
							</td>
						</tr>
						
						<tr class="field_phone">
							<th>�޴���</th>
							<td>
								<div class="phone_num">
									<input type="text" value="" pattern="[0-9]*" name="admin_phone" placeholder="���ڸ� �Է����ּ���" class="inp">
								</div>
							</td>
						</tr>

					<tr class="fst">
						<th>�ּ�</th>
						<td>
							<input id="addr1" type="text" name="admin_address1" value="" >
							<a class="btn default" href="javascript:zip()">�ּҰ˻�</a><br><br>
							<input id="addr2" type="text" name="admin_address2" value="" placeholder="������ �ּҸ� �Է����ּ���" >
							
						</td>
						
					</tr>
					<tr class="select_sex">
						<th>����</th>
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
					<button type="button" class="btn active btn_join" onclick="formJoinSubmit()">�����ϱ�</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>